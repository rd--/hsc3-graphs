; in-trig ; run an oscillator reading trigger at bus=10 ; run control signal writing to bus=10
(let* ((k 10)
       (t (in-trig 1 kr k))
       (p (env-perc 0.01 1 1 (list -4 -4)))
       (e (env-gen kr t t 0 1 do-nothing p))
       (f (mul-add (latch t t) 440 880)))
  (mrg2 (mul (sin-osc ar f 0) e)
        (out k (mul (impulse kr 1 0) 0.1))))
