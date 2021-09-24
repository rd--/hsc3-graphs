-- lfPulse ; mouse control of width
let x = mouseX kr 0 1 Linear 0.2 in lfPulse ar 220 0 x * 0.1
