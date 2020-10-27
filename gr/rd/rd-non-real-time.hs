import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import System.Process {- process -}

graph :: UGen
graph =
    let f = control KR "freq" 440
        g = control KR "gain" 0.1
        e = envGen KR 1 1 0 1 RemoveSynth (envPerc 0.1 1.0)
        o = sinOsc AR f 0 * e
    in out 0 (pan2 o 0 g)

-- > nrt_audition score
score :: NRT
score =
    let mk_instr = d_recv (synthdef "test" graph)
        mk_group = g_new [(1, AddToTail, 0)]
        mk_synth t f = bundle t [s_new "test" (-1) AddToTail 1 [("freq",f)]]
        notes = take 128 (zipWith mk_synth [1.0, 1.05 ..] [330, 350 ..])
    in NRT (bundle 0.0 [mk_instr, mk_group] : notes)

render :: NRT -> IO ()
render s = do
  writeNRT "/tmp/nrt.score" s
  _ <- system "scsynth -N /tmp/nrt.score _ /tmp/nrt.wav 44100 WAVE float"
  return ()

main :: IO ()
main = do
  render score
  nrt_audition score
