-- bLowShelf ; warning=feedback
let i = soundIn (mce2 0 1)
    freq = mouseX kr 20 6000 Exponential 0.2
    rs = mouseY kr 0.1 1 Linear 0.2
    db = 6
in bLowShelf i freq rs db * 0.5
