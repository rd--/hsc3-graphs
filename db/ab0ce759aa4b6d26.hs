-- linCongC ; mouse
let x = mouseX kr 20 sampleRate Linear 0.1
in linCongC ar x 1.1 0.13 1 0 * 0.1
