-- logistic ; mouse control
let x = mouseX KR 3 3.99 Linear 0.1
    y = mouseY KR 10 10000 Exponential 0.1
in logistic AR x y 0.25 * 0.2
