-- linCongC ; mouse
let x = mouseX KR 20 sampleRate Linear 0.1
in linCongC AR x 1.1 0.13 1 0 * 0.1
