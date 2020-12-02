; pitch ; default arguments
(let* ((in (mul (sin-osc ar (mouse-x kr 220 660 0 0.1) 0)
		(mouse-y kr 0.05 0.25 0 0.1)))
       (amp (amplitude kr in 0.05 0.05))
       (freq+ (pitch* in 7 0.02))
       (f (f-div (car (mce-channels freq+)) 2))
       (o (mul (sin-osc ar f 0) amp)))
  (mce2 in o))
