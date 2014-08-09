-- vla-adttn (rd)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

-- fr = freq,dt = detune
vla_partial :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen
vla_partial b fr rise fall dt n =
    let m = n * 2
        ampl = bufRdN 1 KR b m NoLoop
        ph = bufRdN 1 KR b (m + 1) NoLoop
        o = let dt' = lfNoise1 'α' KR 1 * dt + 1.0
            in fSinOsc AR (fr * (n + 1) * dt') ph
        e = linen (impulse KR 0 0)
                  (rise * rand 'β' 0.75 1.25)
                  ampl
                  (fall * rand 'γ' 0.75 1.25)
                  DoNothing
    in o * e

vla_plyr :: UGen -> UGen -> UGen
vla_plyr b n =
    let fr = midiCPS (rand 'α' 10 30)
        rise = rand 'β' 1 2
        fall = rand 'γ' 4 7
        dt = rand 'δ' 0.001 0.005
        a = rand 'ε' 0.05 0.1
        l = rand 'ζ' (-1) 1
        s = sum (map (vla_partial b fr rise fall dt) [0 .. n - 1])
        e = detectSilence s 0.001 0.2 RemoveSynth
    in mrg2 (pan2 s l a) e

plyr36 :: UGen
plyr36 =
    let p_prep (a,p) = (dbAmp a,p)
        unp (i,j) = [i,j]
        b = asLocalBuf 'α' (concatMap (unp . p_prep) vla)
    in vla_plyr b 36

main :: IO ()
main = spawnTextureU (const 3,maxBound) plyr36

vla :: Fractional n => [(n,n)]
vla =
    [(-49.43290,1.99165)
    ,(0.00000,1.09187)
    ,(-2.53835,-2.73340)
    ,(-8.55317,0.73919)
    ,(-7.58952,-0.75267)
    ,(-8.48353,1.70372)
    ,(-13.92700,1.64759)
    ,(-39.93130,-2.25142)
    ,(-19.87800,-3.12024)
    ,(-34.19660,-1.58899)
    ,(-18.82040,-1.39847)
    ,(-21.22520,2.04672)
    ,(-21.33070,-0.14754)
    ,(-31.08620,2.05345)
    ,(-42.51880,-0.55890)
    ,(-41.19730,0.23896)
    ,(-46.80570,1.71249)
    ,(-47.17510,2.37942)
    ,(-37.97520,-0.83005)
    ,(-38.32750,-2.49358)
    ,(-44.79280,-1.16301)
    ,(-49.11850,1.33082)
    ,(-45.26480,-0.45146)
    ,(-46.27050,-0.15578)
    ,(-63.14360,-3.13979)
    ,(-44.27590,-2.59826)
    ,(-40.19680,-2.16540)
    ,(-56.83330,0.48774)
    ,(-56.62160,-0.84155)
    ,(-55.76370,1.59076)
    ,(-59.36050,-0.99090)
    ,(-55.42520,-0.58264)
    ,(-64.99020,0.00110)
    ,(-63.45910,1.55117)
    ,(-64.77610,2.68228)
    ,(-68.27080,-1.82120)
    ,(-71.90240,1.80545)
    ,(-79.13910,2.99369)
    ,(-64.94640,-3.12388)
    ,(-59.41810,1.84679)
    ,(-86.33570,1.81713)
    ,(-88.53500,1.01834)
    ,(-64.17470,-1.52081)
    ,(-61.24430,1.45757)
    ,(-69.88980,-0.47708)
    ,(-65.39420,0.82882)
    ,(-73.84740,0.41623)
    ,(-72.26330,0.31856)
    ,(-73.88560,2.64035)
    ,(-70.86610,-0.43802)
    ,(-67.86130,-0.43389)
    ,(-80.76020,-2.50016)
    ,(-66.44520,2.26219)
    ,(-83.49810,2.57825)
    ,(-66.01220,-2.08254)
    ,(-65.30220,-2.83644)
    ,(-74.05780,0.21665)
    ,(-72.69060,-2.78729)
    ,(-75.49700,2.96210)
    ,(-69.45200,0.72293)
    ,(-75.36160,0.14687)
    ,(-70.21110,1.42155)
    ,(-79.34420,0.76044)
    ,(-81.56200,2.16997)
    ,(-84.20670,3.11095)
    ,(-74.40450,-2.98094)
    ,(-76.67820,1.96564)
    ,(-79.95980,2.68183)
    ,(-77.31420,-1.92260)
    ,(-74.60450,-1.89189)
    ,(-67.98670,1.99457)
    ,(-80.17960,-1.95013)
    ,(-79.44400,-2.70955)
    ,(-81.89010,3.12971)
    ,(-80.18220,1.76888)
    ,(-82.94420,2.77531)]
