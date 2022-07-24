; Pitch ; defaultguments
(let* ((in (SoundIn 0))
       (amp (Amplitude in 0.05 0.05))
       (freq+ (pitchDefaults in 7 0.02))
       (f (car (mceChannels freq+)))
       (o (Mul (SinOsc f 0) amp)))
  (Mce2 in o))
