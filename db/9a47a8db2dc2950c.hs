-- bHiShelf ; warning=feedback
let i = soundIn 0
    f = mouseX kr 2200 18000 Exponential 0.2
    db = mouseY kr 18 (-18) Linear 0.2
in bHiShelf i f 1 db * 0.25
