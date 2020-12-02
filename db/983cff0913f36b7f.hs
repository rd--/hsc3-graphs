-- c.f. lfTri ; more efficient, some aliasing from 3000hz ; less harmonics for lower fundamentals
let x = mouseX KR 20 8000 Exponential 0.2
in lfTri AR x 0 * 0.1
