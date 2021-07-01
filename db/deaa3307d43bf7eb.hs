-- bHiShelf ; warning=feedback
let i = soundIn 0
    f = mouseX kr 2200 18000 Exponential 0.2
    rs = mouseY kr 0.1 1 Linear 0.2
in bHiShelf i f rs 6 * 0.25
