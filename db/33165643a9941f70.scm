; tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899> ; edit for packet size
(let* ((f (lambda (k)
            (lambda (i)
              (let ((x (Impulse (Div (Pow 0.5 i) k) 0)))
                (SinOsc i (Div (SinOsc (Pow (Add i k) i) 0) (Mul (Decay x (List i (Add i 1))) k)))))))
       (n 5)
       (s (mixFillOneIndexed n (lambda (k) (mixFill 6 (f k))))))
  (Mix (Transpose (Div (GVerb s 1 3 0.5 0.5 15 1 0.7 0.5 300) 512))))
