-- pause
let f = control KR "f" 440
    g = control KR "g" 1
in mrg [sinOsc AR f 0 * 0.1,pause g 1001]
