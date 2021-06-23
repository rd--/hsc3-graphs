-- control ; constructor setting index sequence
let [f,a] = control_set [control KR "freq" 440
                        ,control KR "amp" 0.1]
in sinOsc AR f 0 * a
