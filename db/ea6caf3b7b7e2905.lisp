; demand-env-gen ; gate, mouse-x on right side of screen toggles gate
(let* ((x (mouse-x kr 0 1 0 0.1))
       (l (u:round (dwhite dinf 300 1000) 100))
       (f (demand-env-gen kr l 0.1 5 0.3 (gt x 0.5) 1 1 0 1 do-nothing)))
  (mul (sin-osc ar (mul f (mce2 1 1.21)) 0) 0.1))
