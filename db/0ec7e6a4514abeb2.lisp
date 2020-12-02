; fb-sine-c ; increase feedback
(let ((fb (line kr 0.01 4 10 do-nothing)))
  (mul (fb-sine-c ar sample-rate 1 fb 1.1 0.5 0.1 0.1) 0.1))
