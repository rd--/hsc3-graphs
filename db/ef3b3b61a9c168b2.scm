; http://sccode.org/1-4Qy (f0)
(let* ((z (Mul3 (LFTri (Mce2 1/7 1/8) 0) (LFTri 1/9 0) 99))
       (l (MidiCps (mceFromTo 60 79)))
       (f (kr (Select z l)))
       (w (Mod (LFTri (Mce2 1/3 1/4) 0) 1))
       (o (VarSaw f 0 w)))
  (Fdiv (CombN o 1 (Mce2 1/5 1/6) 8) 8))
