-- thb (rd)

import Data.List
import qualified Music.Theory.Contour.Polansky_1992 as T {- hmt -}
import qualified Music.Theory.Pitch as T
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Control.Instrument as I {- hsc3-lang -}
import qualified Sound.SC3.Lang.Control.Pitch as P
import Sound.SC3.Lang.Pattern.ID
import Sound.OSC {- hosc -}

-- | Happy birthday
--
-- > nub hb == "hapy birtd"
-- > sort (nub hb) == " abdhiprty"
hb :: String
hb = "happy birthday"

-- | Scale degrees
hb_d :: Num n => [[n]]
hb_d =
    [[5,5,6,5,1,7]
    ,[5,5,6,5,2,1]
    ,[5,5,5,3,1,7,6]
    ,[4,4,3,1,2,1]]

-- | Octaves
hb_o :: Num n => [[n]]
hb_o =
    [[3,3,3,3,4,3]
    ,[3,3,3,3,4,4]
    ,[3,3,4,4,4,3,3]
    ,[4,4,4,4,4,4]]

-- | Durations
hb_t :: Num n => [[n]]
hb_t =
    [[3,1,4,4,4,8]
    ,[3,1,4,4,4,8]
    ,[3,1,4,4,4,4,4]
    ,[3,1,4,4,4,4]]

-- | Test typing
--
-- > withSC3 plain
plain :: Transport m => m ()
plain = do
  _ <- async (d_recv I.defaultInstrument)
  let p :: [[Double]] -> P Double
      p = toP . concat
  play (pbind [("degree",p hb_d - 1)
              ,("octave",p hb_o + 1)
              ,("dur",p hb_t / 16)])

-- | Pitch classes
--
-- > tail hb_k == [[7,7,9,7,2,0],[7,7,7,4,0,11,9],[5,5,4,0,2,0]]
hb_k :: Integral n => [[n]]
hb_k =
    let f = floor . P.degree_to_key [0,2,4,5,7,9,11] 12 . pred
    in map (map f) (hb_d :: [[Double]])

-- | Midi note numbers
--
-- > tail hb_m == [[55,55,57,55,62,60],[55,55,67,64,60,59,57],[65,65,64,60,62,60]]
hb_m :: [[Integer]]
hb_m = zipWith (\p q -> map T.octpc_to_midi (zip p q)) hb_o hb_k

-- | Transposition predicate.
is_trs :: (Eq a,Num a) => [a] -> [a] -> Bool
is_trs p q = T.all_equal (zipWith (-) p q)

-- | 'Enum' transposition predicate.
--
-- > e_is_trs "abc" "bcd" == True
e_is_trs :: Enum a => [a] -> [a] -> Bool
e_is_trs p q = is_trs (map fromEnum p) (map fromEnum q)

-- | Delete transpositions
--
-- > del_trs ["abc","bcd","bca"] == ["abc","bca"]
del_trs :: Enum a => [[a]] -> [[a]]
del_trs = nubBy e_is_trs

-- | All /n/ element combinations from /x/, degree is 'length' /x/ '^' /n/.
--
-- > all_n_cmb 3 "ab" == ["aaa","aab","aba","abb","baa","bab","bba","bbb"]
-- > length (nub hb) ^ maximum (map length hb_d) == 10000000
all_n_cmb :: Monad m => Int -> m a -> m [a]
all_n_cmb n = sequence . replicate n

-- | All non transpositionally equivalent combinations of elements of
-- list 'hb' that match the contour of /x/.
--
-- > filter ((== 'h') . head) (gen_c [0..5]) == ["hiprty"]
-- > sort (gen_c [0,1]) == [" a"," b"," d"," h"," i"," p"," r"," t"," y","ad","ah","ap","at","ay","bh","bp","br","bt","by","dy","hi","hp","hr","ht","hy","it","pr","pt","py","ty"]
gen_c :: Ord a => [a] -> [String]
gen_c x =
      let c = T.contour_description x
          p = all_n_cmb (length x) (nub hb)
          f q = T.contour_description q == c
      in del_trs (filter f p)

-- | Cache of 'map' 'gen_c' 'hb_m'
--
-- > gen_c_hb_m_cache == map gen_c hb_m
-- > map length gen_c_hb_m_cache == [209,209,210,209]
gen_c_hb_m_cache :: [[String]]
gen_c_hb_m_cache =
    [["hhphyr","hhphyt","hhphtr","hhihyp","hhihyr","hhihyt","hhihrp","hhihtp","hhihtr","hhrhyt","aahapi","aahayp","aahayi","aahayr","aahayt","aaharp","aahari","aahatp","aahati","aahatr","aapayr","aapayt","aapatr","aabahd","aabaph","aabapi","aabapd","aabayh","aabayp","aabayi","aabayr","aabayt","aabayd","aabaih","aabaid","aabarh","aabarp","aabard","aabath","aabatp","aabati","aabatr","aabatd","aaiayp","aaiayr","aaiayt","aaiarp","aaiatp","aaiatr","aarayt","aadaph","aadapi","aadayh","aadayp","aadayi","aadayr","aadayt","aadaih","aadarh","aadarp","aadari","aadath","aadatp","aadati","aadatr","pprpyt","  h pi","  h yp","  h yi","  h yr","  h yt","  h rp","  h ri","  h tp","  h ti","  h tr","  a hb","  a hd","  a ph","  a pb","  a pi","  a pd","  a yh","  a yp","  a yb","  a yi","  a yr","  a yt","  a yd","  a ih","  a ib","  a id","  a rh","  a rp","  a rb","  a ri","  a rd","  a th","  a tp","  a tb","  a ti","  a tr","  a td","  a db","  p yr","  p yt","  p tr","  b hd","  b ph","  b pi","  b pd","  b yh","  b yp","  b yi","  b yr","  b yt","  b yd","  b ih","  b id","  b rh","  b rp","  b ri","  b rd","  b th","  b tp","  b ti","  b tr","  b td","  i yp","  i yr","  i yt","  i rp","  i tp","  i tr","  r yt","  d ph","  d pi","  d yh","  d yp","  d yi","  d yr","  d yt","  d ih","  d rh","  d rp","  d ri","  d th","  d tp","  d ti","  d tr","bbhbpi","bbhbyp","bbhbyi","bbhbyr","bbhbyt","bbhbrp","bbhbri","bbhbtp","bbhbti","bbhbtr","bbpbyr","bbpbyt","bbpbtr","bbibyp","bbibyr","bbibyt","bbibrp","bbibtp","bbibtr","bbrbyt","bbdbph","bbdbpi","bbdbyh","bbdbyp","bbdbyi","bbdbyr","bbdbyt","bbdbih","bbdbrh","bbdbrp","bbdbri","bbdbth","bbdbtp","bbdbti","bbdbtr","iipiyr","iipiyt","iipitr","iiriyt","ddhdpi","ddhdyp","ddhdyi","ddhdyr","ddhdyt","ddhdrp","ddhdri","ddhdtp","ddhdti","ddhdtr","ddpdyr","ddpdyt","ddpdtr","ddidyp","ddidyr","ddidyt","ddidrp","ddidtp","ddidtr","ddrdyt"]
    ,["hhphyr","hhphyt","hhphtr","hhihyp","hhihyr","hhihyt","hhihrp","hhihtp","hhihtr","hhrhyt","aahapi","aahayp","aahayi","aahayr","aahayt","aaharp","aahari","aahatp","aahati","aahatr","aapayr","aapayt","aapatr","aabahd","aabaph","aabapi","aabapd","aabayh","aabayp","aabayi","aabayr","aabayt","aabayd","aabaih","aabaid","aabarh","aabarp","aabard","aabath","aabatp","aabati","aabatr","aabatd","aaiayp","aaiayr","aaiayt","aaiarp","aaiatp","aaiatr","aarayt","aadaph","aadapi","aadayh","aadayp","aadayi","aadayr","aadayt","aadaih","aadarh","aadarp","aadari","aadath","aadatp","aadati","aadatr","pprpyt","  h pi","  h yp","  h yi","  h yr","  h yt","  h rp","  h ri","  h tp","  h ti","  h tr","  a hb","  a hd","  a ph","  a pb","  a pi","  a pd","  a yh","  a yp","  a yb","  a yi","  a yr","  a yt","  a yd","  a ih","  a ib","  a id","  a rh","  a rp","  a rb","  a ri","  a rd","  a th","  a tp","  a tb","  a ti","  a tr","  a td","  a db","  p yr","  p yt","  p tr","  b hd","  b ph","  b pi","  b pd","  b yh","  b yp","  b yi","  b yr","  b yt","  b yd","  b ih","  b id","  b rh","  b rp","  b ri","  b rd","  b th","  b tp","  b ti","  b tr","  b td","  i yp","  i yr","  i yt","  i rp","  i tp","  i tr","  r yt","  d ph","  d pi","  d yh","  d yp","  d yi","  d yr","  d yt","  d ih","  d rh","  d rp","  d ri","  d th","  d tp","  d ti","  d tr","bbhbpi","bbhbyp","bbhbyi","bbhbyr","bbhbyt","bbhbrp","bbhbri","bbhbtp","bbhbti","bbhbtr","bbpbyr","bbpbyt","bbpbtr","bbibyp","bbibyr","bbibyt","bbibrp","bbibtp","bbibtr","bbrbyt","bbdbph","bbdbpi","bbdbyh","bbdbyp","bbdbyi","bbdbyr","bbdbyt","bbdbih","bbdbrh","bbdbrp","bbdbri","bbdbth","bbdbtp","bbdbti","bbdbtr","iipiyr","iipiyt","iipitr","iiriyt","ddhdpi","ddhdyp","ddhdyi","ddhdyr","ddhdyt","ddhdrp","ddhdri","ddhdtp","ddhdti","ddhdtr","ddpdyr","ddpdyt","ddpdtr","ddidyp","ddidyr","ddidyt","ddidrp","ddidtp","ddidtr","ddrdyt"]
    ,["hhytrpi","aapihdb","aayphdb","aaypihb","aaypihd","aaypidb","aayihdb","aayrhdb","aayrphb","aayrphd","aayrpih","aayrpib","aayrpid","aayrpdb","aayrihb","aayrihd","aayridb","aaythdb","aaytphb","aaytphd","aaytpih","aaytpib","aaytpid","aaytpdb","aaytihb","aaytihd","aaytidb","aaytrhb","aaytrhd","aaytrph","aaytrpb","aaytrpi","aaytrpd","aaytrih","aaytrib","aaytrid","aaytrdb","aarphdb","aarpihb","aarpihd","aarpidb","aarihdb","aatphdb","aatpihb","aatpihd","aatpidb","aatihdb","aatrhdb","aatrphb","aatrphd","aatrpih","aatrpib","aatrpid","aatrpdb","aatrihb","aatrihd","aatridb","  phdba","  pihba","  pihda","  pihdb","  pidba","  yhdba","  yphba","  yphda","  yphdb","  ypiha","  ypihb","  ypihd","  ypiba","  ypida","  ypidb","  ypdba","  yihba","  yihda","  yihdb","  yidba","  yrhba","  yrhda","  yrhdb","  yrpha","  yrphb","  yrphd","  yrpba","  yrpih","  yrpia","  yrpib","  yrpid","  yrpda","  yrpdb","  yriha","  yrihb","  yrihd","  yriba","  yrida","  yridb","  yrdba","  ythba","  ythda","  ythdb","  ytpha","  ytphb","  ytphd","  ytpba","  ytpih","  ytpia","  ytpib","  ytpid","  ytpda","  ytpdb","  ytiha","  ytihb","  ytihd","  ytiba","  ytida","  ytidb","  ytrha","  ytrhb","  ytrhd","  ytrph","  ytrpa","  ytrpb","  ytrpi","  ytrpd","  ytrba","  ytrih","  ytria","  ytrib","  ytrid","  ytrda","  ytrdb","  ytdba","  ihdba","  rhdba","  rphba","  rphda","  rphdb","  rpiha","  rpihb","  rpihd","  rpiba","  rpida","  rpidb","  rpdba","  rihba","  rihda","  rihdb","  ridba","  thdba","  tphba","  tphda","  tphdb","  tpiha","  tpihb","  tpihd","  tpiba","  tpida","  tpidb","  tpdba","  tihba","  tihda","  tihdb","  tidba","  trhba","  trhda","  trhdb","  trpha","  trphb","  trphd","  trpba","  trpih","  trpia","  trpib","  trpid","  trpda","  trpdb","  triha","  trihb","  trihd","  triba","  trida","  tridb","  trdba","bbypihd","bbyrphd","bbyrpih","bbyrpid","bbyrihd","bbytphd","bbytpih","bbytpid","bbytihd","bbytrhd","bbytrph","bbytrpi","bbytrpd","bbytrih","bbytrid","bbrpihd","bbtpihd","bbtrphd","bbtrpih","bbtrpid","bbtrihd","ddyrpih","ddytpih","ddytrph","ddytrpi","ddytrih","ddtrpih"]
    ,["hhb a ","hhdaba","hhd a ","hhd b ","pphaba","pphada","pph a ","pph b ","pph d ","pphbdb","ppb a ","ppiaha","ppiaba","ppiada","ppi h ","ppi a ","ppi b ","ppi d ","ppibhb","ppibdb","ppidhd","ppdaba","ppd a ","ppd b ","yyhaba","yyhada","yyh a ","yyh b ","yyh d ","yyhbdb","yyphih","yypaha","yypaba","yypaia","yypada","yyp h ","yyp a ","yyp b ","yyp i ","yyp d ","yypbhb","yypbib","yypbdb","yypdhd","yypdid","yyb a ","yyiaha","yyiaba","yyiada","yyi h ","yyi a ","yyi b ","yyi d ","yyibhb","yyibdb","yyidhd","yyrhph","yyrhih","yyraha","yyrapa","yyraba","yyraia","yyrada","yyr h ","yyr a ","yyr p ","yyr b ","yyr i ","yyr d ","yyrbhb","yyrbpb","yyrbib","yyrbdb","yyripi","yyrdhd","yyrdpd","yyrdid","yythph","yythih","yythrh","yytaha","yytapa","yytaba","yytaia","yytara","yytada","yytprp","yyt h ","yyt a ","yyt p ","yyt b ","yyt i ","yyt r ","yyt d ","yytbhb","yytbpb","yytbib","yytbrb","yytbdb","yytipi","yytiri","yytdhd","yytdpd","yytdid","yytdrd","yydaba","yyd a ","yyd b ","iihaba","iihada","iih a ","iih b ","iih d ","iihbdb","iib a ","iidaba","iid a ","iid b ","rrhaba","rrhada","rrh a ","rrh b ","rrh d ","rrhbdb","rrphih","rrpaha","rrpaba","rrpaia","rrpada","rrp h ","rrp a ","rrp b ","rrp i ","rrp d ","rrpbhb","rrpbib","rrpbdb","rrpdhd","rrpdid","rrb a ","rriaha","rriada","rri h ","rri a ","rri b ","rri d ","rribhb","rribdb","rridhd","rrdaba","rrd a ","rrd b ","tthaba","tthada","tth a ","tth b ","tth d ","tthbdb","ttphih","ttpaha","ttpaba","ttpaia","ttpada","ttp h ","ttp a ","ttp b ","ttp i ","ttp d ","ttpbhb","ttpbib","ttpbdb","ttpdhd","ttpdid","ttb a ","ttiaha","ttiaba","ttiada","tti h ","tti a ","tti b ","tti d ","ttibhb","ttibdb","ttidhd","ttrhph","ttrhih","ttraha","ttrapa","ttraba","ttraia","ttrada","ttr h ","ttr a ","ttr p ","ttr b ","ttr i ","ttr d ","ttrbhb","ttrbpb","ttrbib","ttrbdb","ttripi","ttrdhd","ttrdpd","ttrdid","ttdaba","ttd a ","ttd b ","ddb a "]]

-- | 'concat' of 'tail' of 'gen_c_hb_m_cache'.  The first two phrases
-- of 'hb' have the same contour.
--
-- > gen_c_hb_m_cache !! 0 == gen_c_hb_m_cache !! 1
-- > length gen_c_hb_m_cache' == 209 + 210 + 209
-- > gen_c_hb_m_cache' == nub gen_c_hb_m_cache'
gen_c_hb_m_cache' :: [String]
gen_c_hb_m_cache' = concat (tail gen_c_hb_m_cache)

-- | Multiply enumeration index of /c/ by /n/.
--
-- > map (unc 1) hb == [104,97,112,112,121,32,98,105,114,116,104,100,97,121]
-- > map (unc 1e-2) hb == [1.04,0.97,1.12,1.12,1.21,0.32,0.98,1.05,1.1400000000000001,1.16,1.04,1.0,0.97,1.21]
unc :: (Num a, Enum b) => a -> b -> a
unc n c = fromIntegral (fromEnum c) * n

-- | 'unc' variant for 'hb' such that minima is @0@ and maxima @1@.
--
-- > map hb_md " y" == [0,1]
hb_md :: (Ord a, Fractional a, Enum b) => b -> a
hb_md c =
    let i = map (unc 1) hb
        l = minimum i
        r = maximum i
        n = r - l
    in (unc 1 c - l) * (1 / n)

-- | /(frequency,amplitude,zero-one)/
type Cim n = (n,n,n)

-- | 'Cim' scaled variants of 'unc'.
--
-- > map cim " y" == [(320.0,1.6e-2,0.0),(1210.0,6.05e-2,1.0)]
cim :: (Fractional t,Ord t,Enum e) => e -> Cim t
cim c =
    let i = unc 1e-2 c
    in (i * 1e3, i * 5e-2,hb_md c)

-- | 'cim' of 'gen_c_hb_m_cache''.
ph :: [(Double,Double,Double)]
ph = concatMap (map cim) gen_c_hb_m_cache'

-- | Trivial 'impulse' instrument
--
-- > audition ins_s
ins_s :: Synthdef
ins_s =
    let f = control IR "freq" 440
        l = control IR "loc" 0
        a = control IR "amp" 0.1
        d = control IR "sustain" 0.1
        s = envSine d a
        e = envGen AR 1 1 0 1 RemoveSynth s
        i = impulse AR f 0
    in synthdef "ins" (out 0 (pan2 i l e))

-- | 'audition' 'ph' using pattern library.  /blur/ is @legato@.
--
-- > withSC3 (hear 1 (map cim "hiprty"))
-- > withSC3 (hear 9 (map cim hb))
hear :: Transport m => P Double -> [Cim Double] -> m ()
hear blur x =
    let (freq,dur,c) = unzip3 x
    in play (ins_s,pbind [("freq",toP freq)
                         ,("dur",toP dur)
                         ,("legato",blur)
                         ,("amp",toP c * 0.1 + 0.1)
                         ,("loc",toP c * 2 - 1)])

main :: IO ()
main = withSC3 (hear 9 ph)

-- Local Variables:
-- truncate-lines:t
-- End:
