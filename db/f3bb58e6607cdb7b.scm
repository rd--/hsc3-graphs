; http://sccode.org/1-4Qy (f0)
(let* ((z (Mul3 (SinOsc (Mce2 1/8 1/7) 0) (SinOsc 1/30 0) 9))
       (l (MidiCps (toBy 56 98 6)))
       (m (SinOsc (Mce2 1/4 1/3) 0))
       (o (Mul (SinOsc (kr: (Select z l)) 0) m)))
  (Mul (Tanh (CombN o 1 (Mce2 1/6 1/5) 9)) 0.1))
