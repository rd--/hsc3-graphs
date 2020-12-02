; alien froggies (jmcc) #1
(u:overlap-texture
 0.25 0.5 5
 (lambda (tr)
   (let* ((r 11)
          (r* (fold (mul r (u:exp (t-rand -0.2 0.2 tr))) 1 30)) ; t-lin-rand
          (o (formant ar r* (t-exp-rand 200 3000 tr) (mul-add (t-rand 0 9 tr) r* r*))))
     (mul o 0.05))))
