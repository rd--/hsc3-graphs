-- bGenSin1Tbl ; osc
let tbl = bGenSine1Tbl ("tbl", 0, 8192) [1, 1/2, 1/3, 1/4, 1/5]
in osc ar tbl 220 0 * 0.1
