; Pitch ; default arguments
(let* ((in (Mul (SinOsc ar (MouseX kr 220 660 0 0.1) 0)
		(MouseY kr 0.05 0.25 0 0.1)))
       (amp (Amplitude kr in 0.05 0.05))
       (freq+ (pitchDefaults in 7 0.02))
       (f (FDiv (car (mceChannels freq+)) 2))
       (o (Mul (SinOsc ar f 0) amp)))
  (Mce2 in o))
