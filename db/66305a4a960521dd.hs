-- changed ; fixed number of sample impulses ; https://fredrikolofsson.com/f0blog/impulse-train/
let dur = 1
    num = 8
in changed (min (ceil (sweep ar 0 (num / dur))) num) 0
