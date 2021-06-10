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
         (envData (envLinen RISE-TIME sustain DECAY-TIME AMP '(1 1 1)))
         (env (EnvGen kr 1 1 0 1 removeSynth envData)))
    (Mul (SinOsc ar FREQ 0) env)))
