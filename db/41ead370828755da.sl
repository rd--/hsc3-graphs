/* Stereo half-life (jrhb) */
let tHalf = 3.92; /* Radon-219, discovered 1904 by Giesel and Debierne */
let nAtoms = 100000; /* Ca. 3.6e-14 mg */
let n = (nAtoms - PulseCount(LocalIn(2, 0), 0)).Max(0);
let activity = Dust(n * 2.Log / tHalf);
(activity * 0.1) <! LocalOut(activity)
