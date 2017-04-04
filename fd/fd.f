C********************************************************************
C     This program models wavepropagation in an acoustic medium   ***
C     containing two strip reflector. A point source radiates     ***
C     the field. Free surface is included. Output is one set      ***
C     of pressure-values, corresponding to measurement at a       ***
C     depth level below the source.                               ***
C********************************************************************
C     Calls subroutine Source_Function, returns source            ***
C     function values in the common block FF.                     ***
C                                                                 ***
C     * V(NX,NZ) contains the velocity values in the grid points. ***
C     * P(NX,NZ)    ... pressure values at grid nodes             ***
C     * PM1(NX,NZ)  ... pressure at last time                     ***
C     * PM1(NX,NZ)  ... pressure at time before PM1 again         ***
C********************************************************************
C                  Stability criterion :                          ***
C                                                                 ***
C            delta t < delta x/(sqrt(2).*maxvelocity)             ***
C                                                                 ***
C********************************************************************

      program Finite_Difference

      Integer , Parameter :: nt=1000, nx=1000, nz=nx,
     +     Depth_Layer1=25, Depth_Layer2=50, Source_Depth=2,
     +     Receiver_Level=1
      Real , Parameter :: Delx=10.0, Delz=Delx, Delt=0.001,
     +     Vel1=2000, Vel2=3000, Vel3=3000

      Real , Dimension(0:nx,0:nz) :: V, P, PM1, PM2
      Real , Dimension(0:nt,0:nx) :: T
      Real , Dimension(200) :: FF

      common FF

      Integer :: DTMS, DZMS
      Real, Dimension(NT) :: W
C-------------------------------------
C     Set up the parameters
C-------------------------------------
      NX2=NX/2
      NX2P1=NX2+1
      NZ2=NZ/2
      NZ2P1=NZ2+1
      NSX=NX/2+1
C--------------------------------------
C     Set up the structure of the model
C--------------------------------------
C-----Layer one
      DO 20 J=0,Depth_Layer1
         DO 30 K=0,NX
            V(K,J) = Vel1
 30      CONTINUE
 20   CONTINUE
C-----Layer two
      DO 40 J=Depth_Layer1+1,Depth_Layer2
         DO 50 K=0,NX
      	    V(K,J) = Vel2
 50      CONTINUE
 40   CONTINUE
C-----Layer three
      DO 70 J=Depth_Layer2+1,NZ
         DO 80 K=0,NX
            V(K,J) = Vel3
 80      CONTINUE
 70   CONTINUE
C--------------------------------------
C     Call Source_Function
C--------------------------------------
      CALL Source_Function
      DO 91 I=1,200
         W(I-1) = FF(I)
 91   CONTINUE
C--------------------------------------
C     Now do the model
C--------------------------------------
C-----Set up the time slices (PM1 and PM2)
      PM2 = 0.
      PM1 = 0.
      DO 100 I=0,nt
         J=0
         DO 118 K=1,NX-1
            P(K,J)=0.
 118     CONTINUE
C-----Set endpoint pressure values to zero
         P(0,J)=0.
         P(NX,J)=0.
         DO 17 J=1,NZ-1
            DO 18 K=1,NX-1
               A=V(K,J)*DELT/DELX
               A2=A*A
               FACTOR=1.-2.*A2
               P(K,J)=2.*FACTOR*PM1(K,J)-PM2(K,J)
               SUM=PM1(K+1,J)+PM1(K-1,J)+PM1(K,J+1)+PM1(K,J-1)
               P(K,J)=P(K,J)+A2*SUM
 18         CONTINUE
C-----Set endpoint pressure values to zero
            P(0,J)=0.
            P(NX,J)=0.
 17      CONTINUE
C-----Set grid bottom pressure values to zero
         DO 31 K=0,NX
            P(K,NZ)=0.
 31      CONTINUE
C-----Add in a point source
         P(NSX,Source_Depth)=P(NSX,Source_Depth) - 
     +        ((V(NSX,Source_Depth)*DELT)**2)* W(I)
C-----Pick off data at receivers
         DO 41 K=0,NX
            T(I,K) = P(K,Receiver_Level)
 41      CONTINUE
C-----Shift data to  PM1 and PM2
         PM2 = PM1
         PM1 = P
 100  CONTINUE
C--------------------------------------
C     Convert and print out on files
C--------------------------------------      
      RMAX=1.
      NSAMP=NT
      PRINT *,'Output press.-data file : ./p1_fd.d'
      OPEN(UNIT=15,FILE='./p1_fd.d',FORM='UNFORMATTED')
      DO 103 NTR=400,599
         WRITE(15) (T(I,NTR),I=1,NT)
 103  CONTINUE

      contains

      subroutine Source_Function
C********************************************************************
C
C     This program generates the source function - first derivative
C     of a gaussian.
C
C********************************************************************

C-----Local variable declaration
      implicit integer(I-N)
      dimension FF(200)
      common FF

      SWIDTH=.02
      RLOAD=1.0

C-----Initialize the source function
      SNORM=1.
      SHIFT=2.
      SDELAY=2.*SWIDTH
      S2=SDELAY+SDELAY
      SLOPE=-EXP(-2.*4.)

      SNORM=SWIDTH*(.5*EXP(-.5)+SLOPE) 
      PERIOD=2.*SWIDTH                          
      CFREQ=1./PERIOD                           
      VMIN=1500.
      VMAX=2000.
      SQ2=SQRT(2.)
      DT=0.001

C-----WEIGHT(K) = The relative weight of the k'th load.
      WEIGHT=1.
      WEIGHT=WEIGHT*RLOAD/SNORM                                           

C-----Determine the maximum time step NFMAX for a nonzero source
      NFMAX=(2.*SDELAY)/DT+1.5                           
      DO 699 JJ=1,200 
         FF(JJ)=0.0
 699  CONTINUE
      Time=0.0
      DO 1000 ITT=1,NFMAX
         Time=Time+DT
         P0=Time-SDELAY
         P1=P0                                                        
         IF(P1+SDELAY .LT. 0.) GO TO 1000
         IF(P1-SDELAY .GT. 0.) GO TO 1000
         P2=P1/SWIDTH
         P3=2.*P2*P2
         FF(ITT)=P1*(EXP(-P3)+SLOPE)*WEIGHT  
 1000 CONTINUE
      PRINT *,'Output source time function : ./gau.d'
      OPEN(UNIT=18,FILE='./gau.d',FORM='FORMATTED')
      do itt=1,200
         WRITE(18,*) itt*dt, FF(ITT)
      enddo
      CLOSE(18)
      end subroutine Source_Function

C-----Terminate main program
      end program Finite_Difference
