-- bPeakEQ ; warning=feedback
let i = soundIn 0
    freq = mouseX KR 2200 18000 Exponential 0.2
    db = mouseY KR 12 (-12) Linear 0.2
in bPeakEQ i freq 0.8 db * 0.5
