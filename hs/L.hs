module L where

import Data.Maybe {- base -}
import Data.List {- base -}

stripSuffix :: Eq a => [a] -> [a] -> Maybe [a]
stripSuffix s l = fmap reverse (stripPrefix (reverse s) (reverse l))

strip_suffix_or_id :: Eq a => [[a]] -> [a] -> [a]
strip_suffix_or_id s l =
    case s of
      [] -> l
      e:s' -> strip_suffix_or_id s' (fromMaybe l (stripSuffix e l))
