; Pitch ; default arguments
(let* ((In (sound-in 0))
       (amp (Amplitude kr In 0.05 0.05))
       (freq+ (pitch* In 7 0.02))
       (f (car (mce-channels freq+)))
       (o (Mul (SinOsc ar f 0) amp)))
  (mce2 In o))
