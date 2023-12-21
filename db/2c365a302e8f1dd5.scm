; https://twitter.com/sluyterrific_sc/status/435684664200540161 (es) ; edit to fit packet
(let ((f (lambda (i)
           (let ((m (Add (Mod i (MulAdd (LfNoise2 0.01) 50 50))
                         (MulAdd (LfNoise2 0.1) 10 40))))
             (Mul (SinOsc (MidiCps m) 0) (MulAdd (LfNoise2 1) 0.01 0.01))))))
  (Splay2 (map f (toBy 1 80 2))))
