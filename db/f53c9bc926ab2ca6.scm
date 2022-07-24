; Charles Dodge and Thomas Jerse.
; "Computer Music: Synthesis, Composition, and Performance."
; Schirmer, New York, 1997.
; Second Edition
; FIGURE 4.5, pg. 81 (FIGURE 3.5, pg. 71)
(let ((riseTime 0.05)
      (amp 0.1)
      (dur 2.0)
      (decayTime 0.7)
      (freq 220.0))
  (let* ((sustain (- dur riseTime decayTime))
         (envData (envLinen riseTime sustain decayTime amp '(1 1 1)))
         (env (EnvGen 1 1 0 1 removeSynth envData)))
    (Mul (SinOsc freq 0) env)))
