-- bpf ; of control signals
let vib = bpf (pinkNoiseId 'α' kr) (mouseX kr 1 100 Exponential 0.2) 0.3 * 10
in sinOsc ar (vib * 200 + 600) 0 * 0.1
