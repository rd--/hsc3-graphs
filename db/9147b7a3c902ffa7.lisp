; lf-noise0 ; as frequency control
(mul (sin-osc ar (mul-add (lf-noise0 kr 4) 400 450) 0) 0.1)
