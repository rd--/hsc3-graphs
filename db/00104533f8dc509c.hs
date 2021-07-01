-- lpcAnalyzer
let x = mouseX kr 1 256 Linear 0.2
in X.lpcAnalyzer (soundIn 0) (whiteNoiseId 'α' ar * 0.1) 256 x 0 0.999 0
