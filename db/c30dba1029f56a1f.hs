-- syncSaw ; mouse control
let sy_f = mouseY kr 80 220 Exponential 0.2
    sw_f = sy_f * mouseX kr 1 3 Linear 0.2
in syncSaw ar sy_f sw_f * 0.1
