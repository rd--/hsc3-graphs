-- pitchShift
let s = soundIn 0
    pd = mouseX kr 0.0 0.1 Linear 0.1
    td = mouseY kr 0.0 0.1 Linear 0.1
in pitchShift s 0.2 (mce2 1.0 1.5) pd td
