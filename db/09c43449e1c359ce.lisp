; pitch ; default arguments
(let* ((in (sound-in 0))
       (amp (amplitude kr in 0.05 0.05))
       (freq+ (pitch* in 7 0.02))
       (f (car (mce-channels freq+)))
       (o (mul (sin-osc ar f 0) amp)))
  (mce2 in o))
