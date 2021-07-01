-- sinGrain ; mouse control
let x = mouseX kr 0.001 0.2 Linear 0.1
    y = mouseX kr 90 600 Linear 0.1
in X.sinGrain ar (dustId 'β' kr 25) x y * 0.1
