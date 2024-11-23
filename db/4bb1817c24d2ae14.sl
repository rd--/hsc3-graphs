/* SfPlay ; mouse controls playback rate and re-trigger interval ; no loop, retrigger */
let sf = SfAcquireMono('Floating');
let rateMultiplier = MouseX(0.25, 4, 1, 0.2);
SfPlay(sf, rateMultiplier, Impulse(rateMultiplier / SfDur(sf), 0), 0, 0)
