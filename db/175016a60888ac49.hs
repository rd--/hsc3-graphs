-- crossoverDistortion
let x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
in X.crossoverDistortion (soundIn 0) x y
