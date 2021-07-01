-- c.f. lfTri ; more efficient, some aliasing from 3000hz ; less harmonics for lower fundamentals
let x = mouseX kr 20 8000 Exponential 0.2
in lfTri ar x 0 * 0.1
