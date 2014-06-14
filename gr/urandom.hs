-- urandom (rd)

import Control.Monad {- base -}
import qualified Data.ByteString.Lazy as B {- bytestring -}
import Data.Int {- base -}
import Data.Binary {- base -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import System.IO {- base -}

ur_bytes :: Int -> IO B.ByteString
ur_bytes n = withFile "/dev/urandom" ReadMode (flip B.hGet n)

ur_int32 :: IO Int32
ur_int32 = fmap decode (ur_bytes 4)

ur_byte_set :: Int -> Int -> IO [B.ByteString]
ur_byte_set n k =
    let f h = replicateM k (B.hGet h n)
    in withFile "/dev/urandom" ReadMode f

-- > ur_int32_set 3
ur_int32_set :: Int -> IO [Int32]
ur_int32_set = fmap (map decode) . ur_byte_set 4

-- > fmap (map int32_to_normal) (ur_int32_set 3)
int32_to_normal :: Fractional n => Int32 -> n
int32_to_normal n = fromIntegral (abs n) / fromIntegral (maxBound::Int32)

-- > ur_real_set 3
ur_real_set :: Fractional n => Int -> IO [n]
ur_real_set = fmap (map int32_to_normal) . ur_int32_set

-- > audition =<< mk_node
mk_node :: IO UGen
mk_node = do
  [f,g,l] <- ur_real_set 3
  let f' = linLin_u f 440 660
      g' = linLin_u g 0.05 0.25
      l' = linLin_u l (-1) 1
  return (pan2 (sinOsc AR f' 0) l' g')

main :: IO ()
main = overlapTextureM (3,3,9,maxBound) mk_node
