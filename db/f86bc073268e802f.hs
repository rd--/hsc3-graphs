-- bpf ; of control signals
let vib = bpf (pinkNoise 'α' KR) (mouseX KR 1 100 Exponential 0.2) 0.3 * 10
in sinOsc AR (vib * 200 + 600) 0 * 0.1
