-- gbmanN ; change initial params
let x = mouseX kr 20 sampleRate Linear 0.2
in gbmanN ar x (-0.7) (-2.7) * 0.05
