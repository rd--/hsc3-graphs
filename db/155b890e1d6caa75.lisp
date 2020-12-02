; dc ; offset ; cf. leak-dc
(let ((o (add (mul (sin-osc ar 110 0) 0.1) (dc ar 0.5)))) (mce2 o (leak-dc o 0.995)))
