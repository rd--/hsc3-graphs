-- logistic ; mouse control
let x = mouseX kr 3 3.99 Linear 0.1
    y = mouseY kr 10 10000 Exponential 0.1
in logistic ar x y 0.25 * 0.2
