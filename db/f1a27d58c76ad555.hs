-- bAllPass ; bandpass ; warning=feedback
let i = soundIn (mce2 0 1) * 0.5
    f = mouseX kr 100 18000 Exponential 0.2
in bAllPass i f 0.8 + negate i
