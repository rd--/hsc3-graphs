; Blip ; event control
(let ((f (lambda (g _x y z o _rx _ry p _px _py)
           (Pan2 (Blip (MidiCps p) (MulAdd y 10 1)) (MulAdd o 2 -1) (Mul g z)))))
  (Mul (Mix (Voicer 16 f)) (ctl "gain" 0.5)))
