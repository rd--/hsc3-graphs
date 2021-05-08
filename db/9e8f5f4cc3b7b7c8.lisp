; Rand
(mul (sinosc (kr: (muladd (lfnoise1 (add 6 (mce-fill 2 (lambda (_) (rand -4 4))))) 100 200)) 0) 0.1)
