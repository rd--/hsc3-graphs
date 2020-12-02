-- setResetFF ; silence
let tr = setResetFF (impulse KR 5 0) (impulse KR 10 0)
in brownNoise 'α' AR * decay2 tr 0.01 0.05 * 0.1
