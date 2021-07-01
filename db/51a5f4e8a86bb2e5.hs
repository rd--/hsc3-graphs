-- bAllPass ; thoughpass ; warning=feedback
let i = soundIn (mce2 0 1)
    f = mouseX kr 10 18000 Exponential 0.2
in bAllPass i f 0.8 * 0.2
