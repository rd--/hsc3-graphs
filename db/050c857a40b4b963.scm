; Rand
(mul (sinosc (kr: (muladd (lfnoise1 (add 6 (mceFill 2 (lambda (_) (rand -4 4))))) 100 200)) 0) 0.1)
