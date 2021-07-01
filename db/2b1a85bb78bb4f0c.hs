-- bpf
let x = mouseX kr 100 10000 Exponential 0.2
in bpf (saw ar 200 * 0.5) x 0.3
