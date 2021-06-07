; tim walters ; <https://swiki.hfbk-hamburg.de/MusicTechnology/899>
(let* ((f (lambda (k)
            (lambda (i)
              (let ((x (Impulse kr (FDiv (Pow 0.5 i) k) 0)))
                (SinOsc ar i (FDiv (SinOsc ar (Pow (Add i k) i) 0) (Mul (Decay x (mce2 i (Add i 1))) k)))))))
       (n 5) ; 6+ = error?
       (s (mix-fill n (lambda (k) (mix-fill 6 (f k))))))
  (mix (mce-transpose (FDiv (GVerb s 1 3 0.5 0.5 15 1 0.7 0.5 300) 512))))
