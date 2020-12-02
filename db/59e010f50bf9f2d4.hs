-- lfPulse ; note SC2 had no initial phase argument
let f = lfPulse KR 3 0 0.3 * 200 + 200 in lfPulse AR f 0 0.2 * 0.1
