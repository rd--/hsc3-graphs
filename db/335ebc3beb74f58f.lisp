; mul ; ring modulation
(mul3 (sin-osc ar (x-line kr 100 1001 10 do-nothing) 0)
      (sync-saw ar 100 200)
      0.1)
