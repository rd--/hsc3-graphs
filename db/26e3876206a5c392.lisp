; index-l
(let* ((b (as-local-buf (list 2 1 5 3 4 0)))
       (x (mouse-x kr 0 (buf-frames kr b) linear 0.2))
       (f (mul-add (index-l b x) 100 40)))
  (mul (saw ar (mul f (mce2 1 1.1))) 0.1))
