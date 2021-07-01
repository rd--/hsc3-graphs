-- streson ; c.f. Sound.SC3.Data.Modal.modal_frequency_ratios
let dt = recip (linExp (lfCub kr 0.1 (0.5 * pi)) (-1) 1 280 377)
in X.streson (soundIn 0) dt 0.9 * 0.1
