; asLocalBufMultiChannel ; BufRd ; three channels, four frames
(let* ((b (asLocalBufMultiChannel '((110 220 440 880) (220 440 880 1760) (112 224 448 896))))
       (f (BufRd 3 kr b (MouseX kr 0 (BufFrames kr b) 0 0.2) 0 1)))
  (Splay (Mul (SinOsc ar f 0) 0.1) 1 1 0 #t))
