-- lpcAnalyzer
let x = mouseX kr 1 128 Linear 0.2
in X.lpcAnalyzer (soundIn 0) (impulse ar 440 0 * 0.2) 1024 x 0 0.999 1
