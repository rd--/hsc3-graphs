; random pulsations (jmcc #1) ; texture=spawn,1.125,inf
(let* ((e (env-linen 2 5 2 0.02 (list)))
       (o1 (mul (f-sin-osc ar (rand 0 2000) 0) (env-gen kr 1 1 0 1 do-nothing e)))
       (o2 (sin-osc ar (lin-rand 8 88 0) 0))
       (o3 (mul (sin-osc kr (rand 0.3 0.8) (rand 0 two-pi)) 0.7)))
  (pan2 (am-clip o1 o2) o3 1))
