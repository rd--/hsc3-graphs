; rand
(mul (sin-osc ar (mul-add (lf-noise1 kr (add 6 (mce-fill 2 (lambda (_) (rand -4 4))))) 100 200) 0) 0.1)
