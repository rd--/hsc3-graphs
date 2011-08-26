-- sam i am (jr)
-- http://www.listarc.bham.ac.uk/lists/sc-users/msg00280.html

import Control.Monad.Random
import Data.List
import Data.Maybe
import Sound.SC3
import Sound.SC3.Lang.Control.Event
import Sound.SC3.Lang.Random.Monad
import Sound.SC3.Lang.Pattern.ID

text :: [String]
text =
    ["I could not would not in a house"
    ,"I would not could not with a mouse"
    ,"I would not eat them with a fox"
    ,"I would not eat them in a box"
    ,"I would not eat them here or there"
    ,"I would not eat them anywhere"
    ,"I would not eat green eggs and ham"
    ,"I do not like them Sam-I-am"]

x :: [[String]]
x = map words text

a :: [String]
a = nub (concat x)

sam :: Synthdef
sam =
    let f1 = control KR "freq1" 440
        f2 = control KR "freq2" 440
        f3 = control KR "freq3" 440
        e = xLine KR 0.1 0.001 0.5 RemoveSynth
        o = sinOsc AR f1 0 * pulse AR f2 0.5 * saw AR f3 * e
    in synthdef "sam" (out 0 o)

b :: RandomGen g => g -> [(String,[(String,Double)])]
b g =
    let mk w = do
          f1 <- exprand 200 9000
          f2 <- exprand 20 9000
          f3 <- exprand 20 9000
          let d = 0.1 * fromIntegral (length w)
          return (w,[("freq1",f1),("freq2",f2),("freq3",f3),("dur",d)])
    in evalRand (mapM mk a) g

main :: IO ()
main = do
  g <- getStdGen
  let t = b g
      ae = mapMaybe (\w -> lookup w t >>= return . event) (concat x)
  audition (sam,pseq (map return ae) 1)
