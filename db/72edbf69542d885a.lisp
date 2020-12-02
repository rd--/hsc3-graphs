; rand-range ; rand-range is a binary-operator, rand is an ordinary ugen
(mul (sin-osc ar (mce2 (rand 440 660) (rand-range 440 660)) 0) 0.05)
