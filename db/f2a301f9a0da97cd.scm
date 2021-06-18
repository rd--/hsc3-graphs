; Blip ; event control
(let ((f (lambda (g _x y z o _rx _ry p)
           (Pan2 (Blip ar (MidiCps p) (MulAdd y 10 1)) (MulAdd o 2 -1) (Mul g z)))))
  (Mul (Mix (REventVoicer 16 f)) (ctl kr "gain" 0.5)))
