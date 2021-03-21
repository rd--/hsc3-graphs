; Charles Dodge and Thomas Jerse.
; "Computer Music: Synthesis, Composition, and Performance."
; Schirmer, New York, 1997.
; Second Edition
; FIGURE 4.5, pg. 81 (FIGURE 3.5, pg. 71)
(let ((RISE-TIME 0.05)
      (AMP 0.1)
      (DUR 2.0)
      (DECAY-TIME 0.7)
      (FREQ 220.0))
  (let* ((sustain (- DUR RISE-TIME DECAY-TIME))
         (env-data (env-linen RISE-TIME sustain DECAY-TIME AMP '(1 1 1)))
         (env (env-gen kr 1 1 0 1 remove-synth env-data)))
    (mul (sin-osc ar FREQ 0) env)))
