; Atan2
(let* ((x 10)
       (y (Mul (LfSaw 1/6 0) 100))
       (distance (Hypot x y))
       (amplitude (Div 40 (Squared distance)))
       (sound (Rlpf (Mul (FSinOsc 200 0) (LfPulse 31.3 0 0.4)) 400 0.3))
       (azimuth (Atan2 y x))
       (loc (Clip2 (Div azimuth (/ pi 2)) 1)))
  (Pan2 (DelayL sound 110/344 (Div distance 344))
        loc
        amplitude))
