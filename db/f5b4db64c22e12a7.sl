(* https://twitter.com/HernaniVillase/status/562825448854675456 ; requires=kr ; edit (rd) *)
{
	let o = LfTri(Sequencer([999 99 4000], Impulse(10, 0)).kr, 0);
	AllpassC(o * Dust(Sequencer([1 5], Impulse(1, 0))).kr, 0.2, 0.02, 1)
} ! 2
