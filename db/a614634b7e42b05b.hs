-- control ; constructor setting index sequence
let [f,a] = control_set [control kr "freq" 440
                        ,control kr "amp" 0.1]
in sinOsc ar f 0 * a
