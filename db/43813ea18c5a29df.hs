-- setResetFF ; duty cycle
let tr = 1 - setResetFF (impulse kr 10 0) (impulse kr 5 0)
in brownNoiseId 'α' ar * decay2 tr 0.01 0.05 * 0.1
