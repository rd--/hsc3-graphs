-- zitaRev ; http://kokkinizita.linuxaudio.org/linuxaudio/zita-rev1-doc/quickguide.html
let i = soundIn 0
    in_delay = 60
    eq1_freq = 315
    eq2_freq = 1500
    dry_wet_mix = 0.5
    level = 0
in X.zitaRev i i in_delay 200 3 2 6000 eq1_freq 0 eq2_freq 0 dry_wet_mix level
