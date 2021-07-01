-- lfPulse ; note SC2 had no initial phase argument
let f = lfPulse kr 3 0 0.3 * 200 + 200 in lfPulse ar f 0 0.2 * 0.1
