; free-self-when-done
(let* ((x (mouse-x kr -1 1 0 0.1))
       (e (linen x 2 0.1 2 do-nothing)))
 (mrg2 (mul (sin-osc ar 440 0) e) (free-self-when-done e)))
