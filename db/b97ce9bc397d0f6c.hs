-- bLowShelf ; warning=feedback
let i = soundIn (mce2 0 1)
    freq = mouseX kr 40 6000 Exponential 0.2
    rs = 1
    db = mouseY kr 24 (-24) Linear 0.2
in bLowShelf i freq rs db * 0.5
