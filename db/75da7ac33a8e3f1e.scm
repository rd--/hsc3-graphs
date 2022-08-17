; https://twitter.com/sluyterrific_sc/status/435684664200540161 (es) ; edit to fit packet
(let ((f (lambda (i)
           (let ((m (Add (Mod i (MulAdd (LFNoise2 0.01) 50 50))
                         (MulAdd (LFNoise2 0.1) 10 40))))
             (Mul (SinOsc (MidiCps m) 0) (MulAdd (LFNoise2 1) 0.01 0.01))))))
  (Splay (map f (enumFromThenTo 1 3 80)) 1 1 0 #t))
