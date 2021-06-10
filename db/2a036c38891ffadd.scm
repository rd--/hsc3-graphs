; Klang ; c.f. klank
(let ((d (klangData '(440 550 660 770 880 990 1000)
		     '(0.05 0.02 0.07 0.04 0.05 0.02 0.03)
		     (replicate 7 0))))
  (Klang ar 1 0 d))
