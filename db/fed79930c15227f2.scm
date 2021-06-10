; https://twitter.com/sluyterrific_sc/status/435684664200540161 (es) ; edit to fit packet
(let ((f (lambda (i)
           (let ((m (Add (Mod i (MulAdd (LFNoise2 kr 0.01) 50 50))
                         (MulAdd (LFNoise2 kr 0.1) 10 40))))
             (Mul (SinOsc ar (MIDICPS m) 0) (MulAdd (LFNoise2 kr 1) 0.01 0.01))))))
  (Splay (asMce (map f (enumFromThenTo 1 3 80))) 1 1 0 #t))
