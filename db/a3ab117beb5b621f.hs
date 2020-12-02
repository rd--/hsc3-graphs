-- freeVerb2 ; process input channels ; warning=feedback
let i = soundIn (mce2 0 1)
    c = mceChannel
    x = mouseX KR 0 1 Linear 0.1
    y = mouseY KR 0 1 Linear 0.1
in freeVerb2 (c 0 i) (c 1 i) y x 0.5
