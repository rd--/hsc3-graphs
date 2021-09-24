-- lfPulse ; amplitude modulation
lfPulse kr (xLine kr 1 200 10 DoNothing) 0 0.2 * sinOsc ar 440 0 * 0.1
