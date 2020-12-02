-- bpf
let x = mouseX KR 100 10000 Exponential 0.2
in bpf (saw AR 200 * 0.5) x 0.3
