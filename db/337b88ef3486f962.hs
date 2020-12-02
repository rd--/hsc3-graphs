-- lpcAnalyzer
let x = mouseX KR 1 256 Linear 0.2
in X.lpcAnalyzer (soundIn 0) (whiteNoise 'α' AR * 0.1) 256 x 0 0.999 0
