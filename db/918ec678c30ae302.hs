-- inFeedback ; audio feedback modulation
let f = inFeedback 1 0 * 1300 + 300
in sinOsc AR f 0 * 0.2
