; https://www.listarc.bham.ac.uk/lists/sc-users/msg18379.html (f0)
(let* ((t (T2A 0 0))
       (o0 (MulAdd (LFSaw ar 3 0) 9 99))
       (s0 (Mod (Sweep t (mceFromTo 3 9)) o0))
       (s1 (BitAnd (Mod (Sweep t (mceFromThenTo 33 32 3)) 128) s0))
       (o1 (Mul (SinOsc ar (MIDICPS (Add s1 33)) 0) pi)))
  (FDiv (Splay (SinOsc ar 9 o1) 1 1 0 #t) 12))
