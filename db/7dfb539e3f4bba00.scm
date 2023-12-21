; f0 <https://twitter.com/redFrik/status/1338987643057688579>
(let* ((b (to 8 18))
       (x (VarSaw (Add (Mce3 18.1 81.8 1.81) b) 1 (VarSaw (Div b 81) 0 0.5)))
       (t (VarSaw (/ 8 1.818) (Mce2 1 8/18) 0.5))
       (d (RoundTo (LinExp (VarSaw (Div b 181.8) 0 0.5) -1 1 (/ 1.81 818) (/ 1.8 181.8)) (/ 1.81 818)))
       (c (Add (VarSaw 1/8 (Div 1 b) 0.5) (* 8.18 1.8)))
       (z (LinLin (VarSaw (/ 1 81.8) 0 0.5) -1 1 (expt 1.8 -1) (/ 8.1 8.18)))
       (p (MulDiv (Pluck x t (/ 1.8 181.8) d c z) (VarSaw (Div 1.8 b) 0 0.5) 1.8)))
  (Hpf (Splay2 p) (/ 18 1.81)))
