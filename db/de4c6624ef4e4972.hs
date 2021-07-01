-- setResetFF ; silence
let tr = setResetFF (impulse kr 5 0) (impulse kr 10 0)
in brownNoiseId 'α' ar * decay2 tr 0.01 0.05 * 0.1
