-- sinOscFB
let y = mouseY kr 10 1000 Exponential 0.2
    x = mouseX kr (pi/2) pi Linear 0.2
in sinOscFB ar y x * 0.1
