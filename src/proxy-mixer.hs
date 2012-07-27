-- > Sound.SC3.UGen.Help.viewSC3Help "ProxyMixer"
import Sound.SC3.ID
import Sound.SC3.UGen.External.RDU

randN_l :: ID z => Int -> z -> UGen -> UGen -> [UGen]
randN_l k z l = mceChannels . randN k z l

iScramble :: ID z => z -> UGen -> UGen
iScramble z = tScramble z KR 1

-- > Sound.SC3.UGen.Dot.draw pm
pm :: UGen
pm =
    let e = let l = randN_l 11 'a' (-1) 1
                t = randN_l 10 'a' 0 1
            in Envelope l t [EnvNum 0] (Just 9) (Just 0)
        env = envGen KR 1 1 0 1 DoNothing e
        p = midiRatio (env * mce [1, 0.33, -1] * 19) * 250
        o = formant AR p (iScramble 'a' p * 2) (iScramble 'b' p)
    in out 0 (splay o 1 1 0 True * 0.1)

main :: IO ()
main = audition pm
