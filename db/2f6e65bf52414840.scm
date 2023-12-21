; http://sccode.org/1-4Qy (f0) ; requires=kr:
(let* ((z (Mul3 (LfTri (list 1/7 1/8) 0) (LfTri 1/9 0) 99))
       (l (MidiCps (to 60 79)))
       (f (kr: (Select z l)))
       (w (Mod (LfTri (list 1/3 1/4) 0) 1))
       (o (VarSaw f 0 w)))
  (Div (CombN o 1 (list 1/5 1/6) 8) 8))
