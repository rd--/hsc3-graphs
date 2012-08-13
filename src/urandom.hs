import Control.Monad {- base -}
import qualified Data.ByteString.Lazy as B {- bytestring -}
import Sound.OpenSoundControl.Coding.Byte {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import System.IO {- base -}

ur_bytes :: Int -> IO B.ByteString
ur_bytes n = withFile "/dev/urandom" ReadMode (flip B.hGet n)

ur_int :: IO Int
ur_int = fmap decode_i32 (ur_bytes 4)

ur_double :: IO Double
ur_double = fmap decode_f64 (ur_bytes 8)

ur_byte_set :: Int -> Int -> IO [B.ByteString]
ur_byte_set n k =
    let f h = replicateM k (B.hGet h n)
    in withFile "/dev/urandom" ReadMode f

-- > ur_int_set 3
ur_int_set :: Int -> IO [Int]
ur_int_set = fmap (map decode_i32) . ur_byte_set 4

-- > fmap (map int_to_normal) (ur_int_set 3)
int_to_normal :: Fractional n => Int -> n
int_to_normal n = fromIntegral (abs n) / fromIntegral (maxBound::Int)

ur_real_set :: Fractional n => Int -> IO [n]
ur_real_set = fmap (map int_to_normal) . ur_int_set

-- > audition =<< mk_node
mk_node :: IO UGen
mk_node = do
  [f,g,l] <- ur_real_set 3
  let f' = linLin f 0 1 440 660
      g' = linLin g 0 1 0.05 0.25
      l' = linLin l 0 1 (-1) 1
  return (pan2 (sinOsc AR f' 0) l' g')

main :: IO ()
main = overlapTextureM (3,3,9,maxBound) mk_node
