; gendy1 ; modulate distributions ; change of pitch as distributions change the duration structure and spectrum
(let* ((x (mouse-x kr 0 7 0 0.1))
       (y (mouse-y kr 0 7 0 0.1))
       (g (gendy1 ar x y 1 1 440 660 0.5 0.5 12 12)))
  (pan2 g 0 0.1))
