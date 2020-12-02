-- bHiShelf ; warning=feedback
let i = soundIn 0
    f = mouseX KR 2200 18000 Exponential 0.2
    rs = mouseY KR 0.1 1 Linear 0.2
in bHiShelf i f rs 6 * 0.25
