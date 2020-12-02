-- pinkNoise ; speaker balance ; mouse control
let x = mouseX KR 0 1 Linear 0.2
    x' = 1 - x
    n = pinkNoise 'δ' AR * 0.05
in mce2 (n * x') (n * x)
