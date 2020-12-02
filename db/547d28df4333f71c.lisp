; in-feedback
(let ((f (mul-add (in-feedback 1 0) 1300 300)))
 (mul (sin-osc ar f 0) 0.1))
