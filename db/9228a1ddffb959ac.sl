/* Changed ; fixed number of sample impulses ; https://fredrikolofsson.com/f0blog/impulse-train/ */
let dur = 1;
let num = 8;
Changed(Sweep(0, num / dur).Min(num).Ceiling, 0)
