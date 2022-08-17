; babbling brook (jmcc) #sc3 ; autotranslate from .stc
(let ((b (lambda (f m a g)
	   (Mul (RHPF (OnePole (BrownNoise) 0.99) (Add (Mul (LPF (BrownNoise) f) m) a) 0.03) g))))
  (Add (dup (lambda () (value b 14 400 500 0.06)) 2) (dup (lambda () (value b 20 800 1000 0.1)) 2)))
