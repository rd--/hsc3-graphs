\ sample and hold liquidities (jmcc) #4
: clockRate 1 200 xmousex ;
: clockPeriod clockRate 1/ ;
: clock clockRate 0 impulse 0.4 * ;
: centerFreq 100 8000 xmousey ;
: freq whitenoise centerFreq * 0.5 * centerFreq + clock latch ;
: amp clock clockPeriod 0.1 * clockPeriod 0.9 * decay2 ;
: panPos whitenoise clock latch ;
: in freq 0 sinosc amp * panPos 1 pan2 ;
in 0.3 0.3 2 combn
