; Pitch ; default arguments
(let* ((In (Mul (SinOsc ar (MouseX kr 220 660 0 0.1) 0)
		(MouseY kr 0.05 0.25 0 0.1)))
       (amp (Amplitude kr In 0.05 0.05))
       (freq+ (pitch* In 7 0.02))
       (f (FDiv (car (mce-channels freq+)) 2))
       (o (Mul (SinOsc ar f 0) amp)))
  (mce2 In o))
