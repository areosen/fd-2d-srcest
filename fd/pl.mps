*START                                                   
            - no. shots in array         /     1  /  :    (        ) 
            - no. traces/shot record     /     1  /  :    (   200  )
            - no. samples/trace          /     1  /  :    (  1000  )

*IN
            - data file      :  (./p1_fd.d                         )
            - header file    :  (./homes/konaos/mpsplot/plott/HEAD )
            - FirstShot                  /     1  /  :    (        )
            - LastShot                   /    -1  /  :    (        )
            - ShotIncrement              /     1  /  :    (        )
            - ShotLocation               /     1  /  :    (        )
            - TracesPerShot              /   -1   /  :    (        )
            - FirstTrace                 /     1  /  :    (        )
            - LastTrace                  /    -1  /  :    (        )
            - TraceIncrement             /     1  /  :    (        )
            - TraceLocation              /     1  /  :    (        )
            - Recordlength               /    -1  /  :    (        )
            - FirstSample                /     1  /  :    (        )
            - LastSample                 /    -1  /  :    (        )
            - SampleIncrement            /     1  /  :    (        )
            - SampleLocation             /     1  /  :    (        )
            - Transpose                  /     N  /  :    (        )
            - HorizontalSamp             /   -1.0 /  :    (        )
            - VerticalSamp               /   -1.0 /  :    (        )
            - Reverse                    /     N  /  :    (        )

*MULTIPLY                                                
            - first  shot  , last shot   /  1,-1  /  :    (   1,1  ) 
            - first  trace , last trace  /  1,-1  /  :    (        ) 
            - first  sample, last sample /  1,-1  /  :    (        ) 
            - multiply with ?            /   1.0  /  :    (  0.005 )

*SCALE                                                  
            - first shot   , last shot   /  1,-1  /  :    (        ) 
            - first trace  , last trace  /  1,-1  /  :    (        ) 
            - first sample , last sample /  1,-1  /  :    (        ) 
            - time**gamma        ,0.0=no /   2.0  /  :    ( 1.01   )
            - amplitude**exponent,1.0=no /   1.0  /  :    (        ) 

*UNIOPN
              Device            (hposta4                           ) 

*BEGIN                                                   
            - FirstShot                  /     1  /  :    (   1    )
            - LastShot                   /    -1  /  :    (   1    )
            - ShotIncrement              /     1  /  :    (        )
            - FirstTrace                 /     1  /  :    (   1    )
            - LastTrace                  /    -1  /  :    (   200  )
            - TraceIncrement             /     1  /  :    (   2    )
            - FirstSample                /     1  /  :    (   1    )
            - LastSample                 /    -1  /  :    (   950  )
            - SampleIncrement            /     1  /  :    (        )
            - NewNoshots                 /    -1  /  :    (        )
            - NewNotraces                /    -1  /  :    (        )
            - NewNosamples               /    -1  /  :    (        )

*PLOTT                                                   
            - Pause                      /  N     /  :    (        )
            - Horizontaltrace            /  N     /  :    (        ) 
            - UpDown                     /  Y     /  :    (        ) 
            - LeftRight                  /  Y     /  :    (        ) 
            - XAbsLength                 /  150.0 /  :    (   190. )
            - XMin                       /  0.0   /  :    ( -1000. ) 
            - XMax                       /  1.0   /  :    (  1000. ) 
            - XStep                      /  0.2   /  :    (   250. )
            - XGridDensity               /  0.0   /  :    (        ) 
            - XAxisText         (Offset (m)                        )
            - YAbsLength                 /  100.0 /  :    (   150. ) 
            - YMin                       /  0.0   /  :    (        ) 
            - YMax                       /  1.0   /  :    (  0.950 )      
            - YStep                      /  0.1   /  :    (  0.25  )
            - YGridDensity               /  0.0   /  :    (        ) 
            - YAxisText         (Time (s)                          ) 
            - Bias                       /  Y     /  :    (        ) 
            - ModelFileName     (                                  ) 
            - PlotIntensity              /  0.1   /  :    (        ) 
            - PlotHeadingText   (                                  )
            - TextFontSize               /  5.0   /  :    (  3.0   ) 
            - FrameThickness             /  0.0   /  :    (        ) 
            - DigitsRightOfComma         /  1,1   /  :    (        ) 
            - TextFont          (                                  ) 
            - AxisThickness              /  0.2   /  :    (        ) 
            - ZeroLine                   /  0.0   /  :    (        ) 
            - AnnotationTopXaxis         /  Y     /  :    (        )
            - AnnotationBotXAxis         /  N     /  :    (        )
            - AnnotationRightYAxis       /  N     /  :    (        )
            - AnnotationLeftYAxis        /  Y     /  :    (        )
            - XAxisTextPosition          /  15.0  /  :    ( -165.  )
            - YAxisTextPosition          /  25.0  /  :    (   15.  )
            - Xdevsize                   /  -1.0  /  :    (        ) 
            - Ydevsize                   /  -1.0  /  :    (        ) 
            - DrawLeftYAxis              /  Y     /  :    (        )
            - DrawBotXAxis               /  Y     /  :    (        )
            - DrawRightYAxis             /  Y     /  :    (        )
            - DrawTopXaxis               /  Y     /  :    (        )
            - Orientation (Land or Portr)/  L        :    (        ) 
            - ClearDevice                /  Y     /  :    (        ) 

*UNICLS
*END                                                     













