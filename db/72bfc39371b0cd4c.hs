-- MiRings ; using theId 'pit' input to set midi pitch and excite the resonator
X.miRings ar 0 0 (range 30 50 (lfNoise0Id 'α' kr 2)) 0.25 0.5 0.7 0.25 (X.miRings_mode "SYMPATHETIC_STRING") 1 0 0 0 * 0.2
