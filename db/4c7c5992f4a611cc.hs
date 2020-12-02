-- crossoverDistortion
let x = mouseX KR 0 1 Linear 0.2
    y = mouseY KR 0 1 Linear 0.2
in X.crossoverDistortion (soundIn 0) x y
