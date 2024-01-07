let p = PinkNoise(); (* Source *)
let [w, x, y] = PanB2(p, MouseX(-1, 1, 0, 0.2), 0.1); (* B-format encode *)
let [a, b, c, d] = DecodeB2(4, w, x, y, 0.5); (* B-format decode to quad *)
[a, b, d, c] (* Reorder for speaker arrangement *)
