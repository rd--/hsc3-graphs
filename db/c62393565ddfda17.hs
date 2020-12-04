-- delayN ; dust randomly triggers decay to envelope WhiteNoise ; input is left, delay right
let i = decay (dust 'α' AR 1) 0.3 * whiteNoise 'β' AR * 0.1
in mce2 i (delayN i 0.1 0.1)
