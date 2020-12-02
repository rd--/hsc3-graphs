; rand-seed ; reset the seed at a variable rate
(mrg2 (rand-seed kr (impulse kr (mouse-x kr 0.1 100 0 0.1) 0) 1956) 0)
