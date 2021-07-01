-- pinkNoise ; speaker balance ; mouse control
let x = mouseX kr 0 1 Linear 0.2
    x' = 1 - x
    n = pinkNoiseId 'δ' ar * 0.05
in mce2 (n * x') (n * x)
