; Pitch ; default arguments
(let* ((in (Mul (SinOsc (MouseX 220 660 0 0.1) 0)
		(MouseY 0.05 0.25 0 0.1)))
       (amp (Amplitude in 0.05 0.05))
       (freq+ (pitchDefaults in 7 0.02))
       (f (Div (car (mceChannels freq+)) 2))
       (o (Mul (SinOsc f 0) amp)))
  (Mce2 in o))
