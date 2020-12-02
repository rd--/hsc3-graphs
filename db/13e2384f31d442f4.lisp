; hpf
(let* ((i (mul (saw ar 200) 0.05))
       (f1 (x-line kr 0.7 300 20 do-nothing))
       (f2 (mul-add (f-sin-osc kr f1 0) 3600 4000)))
  (mul (hpf i f2) 5))
