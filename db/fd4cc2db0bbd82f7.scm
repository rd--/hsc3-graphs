; http://sccode.org/1-4Qy (f0)
(let* ((z (Mul3 (LFTri kr (Mce2 1/7 1/8) 0) (LFTri kr 1/9 0) 99))
       (l (MIDICPS (mceFromTo 60 79)))
       (f (Select z l))
       (w (Mod (LFTri kr (Mce2 1/3 1/4) 0) 1))
       (o (VarSaw ar f 0 w)))
  (FDiv (CombN o 1 (Mce2 1/5 1/6) 8) 8))
