; demanding studies (jmcc)
(let* ((s1 (Drand dinf (Mce4 72 75 79 82)))
       (s2 (Drand 1 (Mce3 82 84 86)))
       (s3 (Dseq dinf (Mce4 72 75 79 s2)))
       (x (MouseX kr 5 6 0 0.2))
       (tr (Impulse kr x 0))
       (f (Demand tr 0 (Mce2 (MIDICPS (Sub s1 12)) (MIDICPS s3))))
       (o1 (SinOsc ar (Add f (Mce2 0 0.7)) 0))
       (o2 (Mul (Saw ar (Add f (Mce2 0 0.7))) 0.3))
       (o3 (Cubed (Distort (Log (Distort (Add o1 o2)))))))
  (Mul o3 0.1))
