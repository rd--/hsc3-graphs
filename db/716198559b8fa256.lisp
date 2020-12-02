; c-osc
(let ((b (ctl kr "tbl" 10))) (mul (c-osc ar b 200 (mouse-x* kr 0 4 0 0.1)) 0.1))
