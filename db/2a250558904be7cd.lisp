; henon-n ; mouse-control of parameters
(mul (henon-n ar
              (f-div sample-rate 4)
              (mouse-x kr 1 1.4 0 0.1)
              (mouse-y kr 0 0.3 0 0.1)
              0
              0)
     0.05)
