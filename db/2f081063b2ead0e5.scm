; asLocalBufMultiChannel ; BufRd ; three channels, four frames
(let* ((b (asLocalBufMultiChannel '((110 220 440 880) (220 440 880 1760) (112 224 448 896))))
       (f (BufRd 3 b (MouseX 0 (BufFrames b) 0 0.2) 0 1)))
  (Splay (Mul (SinOsc f 0) 0.1) 1 1 0 #t))
