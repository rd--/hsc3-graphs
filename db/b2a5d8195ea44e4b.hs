-- setResetFF ; duty cycle
let tr = 1 - setResetFF (impulse KR 10 0) (impulse KR 5 0)
in brownNoise 'α' AR * decay2 tr 0.01 0.05 * 0.1
