// Pen ; animation ; jmcc
var h = 1080; // h = horizonal
var v = 720; // v = vertical
var seed = Date.seed;
var run = true;
var phase = 0;
var w = Window(name: "Pen: Animation", bounds: Rect(left: 40, top: 40, width: h, height: v), resizable: false);
w.view.background_(Color.rand(lo: 0, hi: 0.3));
w.onClose = { run = false };
w.front;
w.drawFunc = {
	Pen.width_(2);
	Pen.use({
		// set new seed
		thisThread.randSeed_(Date.seed);
		// slight chance of a new seed or background color
		(0.006.coin).ifTrue({ seed = Date.seed });
		(0.02.coin).ifTrue({ w.view.background_(Color.rand(lo: 0, hi: 0.3)) });
		// revert to the stored seed (or set the new one)
		thisThread.randSeed_(seed);
		// the random values below will be the same each time if the seed has not changed
		Pen.translate(x: h / 2, y: v / 2);
		// rotate the whole image, negative random values rotate one direction, positive the other
		Pen.rotate(angle: phase * 1.0.rand2, x: 0, y: 0);
		// scale the rotated y axis in a sine pattern
		Pen.scale(x: 1, y: 0.3 * (phase * 1.0.rand2 + (2 * pi.rand)).sin + 0.5);
		// create a random number of annular wedges
		6.rrand(24).do({
			var a = 60.rrand(300);
			Pen.color_(Color.rand(lo: 0.0, hi: 1.0).alpha_(0.1.rrand(0.7)));
			Pen.beginPath;
			Pen.addAnnularWedge(
				center: Point(x: 0, y:0),
				innerRadius: a,
				outerRadius: a + 50.rand2,
				startAngle: 2 * pi.rand + (phase * 2.0.rand2),
				sweepLength: 2 * pi.rand
			);
			0.5.coin.ifTrue({ Pen.stroke }, ifFalse: { Pen.fill });
		})
	})
};
// fork a thread to update 20 times a second, and advance the phase each time
{
	{ run }.whileTrue({
		w.refresh;
		(1 / 20).wait;
		phase = phase + (0.01 * pi)
	})
}.fork(AppClock)

// Pen ; animation ; jmcc
var phase = 0;
var seed = Date.seed;
var run = true;
var w = Window("...", Rect(128, 64, 800, 800), false);
w.view.background_(Color.blue(val: 0.4, alpha: 1));
w.onClose = { run = false };
w.front;
w.drawFunc = {
	Pen.use({
		(0.02.coin).ifTrue({ seed = Date.seed });
		thisThread.randSeed_(seed);
		Pen.strokeColor_(Color.white);
		200.do({
			var a = 4.rand;
			var b = 24.rand;
			var r1 = 230 + (50 * a);
			var a1 = 2 * pi / 24 * b + phase;
			var r2 = 230 + (50 * (a + 1.rand2).fold(0, 3));
			var a2 = 2 * pi / 24 * (b + 3.rand2).wrap(0, 23) + phase;
			Pen.width = 0.2 + 1.0.linrand;
			Pen.beginPath;
			Pen.moveTo(Polar(rho: r1, theta: a1).asPoint + Point(x: 400, y: 400));
			Pen.lineTo(Polar(rho: r2, theta: a2).asPoint + Point(x: 400, y: 400));
			Pen.stroke;
		});
		thisThread.randSeed_(Date.seed);
		40.do({
			var a = 4.rand;
			var b = 24.rand;
			var r1 = 230 + (50 * a);
			var a1 = 2 * pi / 24 * b + phase;
			var r2 = 230 + (50 * (a + 1.rand2).fold(0, 3));
			var a2 = 2 * pi / 24 * (b + 3.rand2).wrap(0, 23) + phase;
			Pen.width = 0.2 + 1.5.linrand;
			Pen.beginPath;
			Pen.moveTo(Polar(r1, a1).asPoint + Point(400, 400));
			Pen.lineTo(Polar(r2, a2).asPoint + Point(400, 400));
			Pen.stroke;
		})
	})
};
{
	{ run }.whileTrue({
		w.refresh;
		0.1.wait;
		phase = phase + (2 * pi / (20 * 24))
	})
 }.fork(AppClock)

// Pen ; redraw at random interval, different every time ; jmcc
var run = true;
var w = Window(name: "...", bounds: Rect(128, 64, 800, 800), resizable: false);
w.view.background_(Color.white);
w.onClose = { run = false };
w.front;
w.drawFunc = {
	Pen.use({
		Pen.width_(0.2);
		400.do({
			Pen.beginPath;
			Pen.moveTo(Point(x: 10.rand * 80 + 40, y: 10.rand * 80 + 40));
			Pen.lineTo(Point(x: 10.rand * 80 + 40, y: 10.rand * 80 + 40));
			Pen.stroke;
		})
	})
};
{
	{ run }.whileTrue({
		w.refresh;
		1.0.rand.wait
	})
}.fork(AppClock)

// Pen ; redraw at random interval, different every time ; jmcc
var run = true;
var w = Window(name: "", bounds: Rect(128, 64, 800, 500), resizable: false);
w.onClose = { run = false; };
w.front;
w.drawFunc = {
	Pen.use {
		80.do {
			Pen.width_(0.rrand(4) + 0.5);
			Pen.beginPath;
			Pen.moveTo(Point(800.rand, 500.rand));
			Pen.lineTo(Point(800.rand, 500.rand));
			Pen.stroke;
		}
	}
};
{
	{ run }.whileTrue({
		w.refresh;
		1.0.rand.wait
	})
}.fork(AppClock)

// Pen ; affines ; jmcc ; renaming for clarity (rd)
var h = 800;
var v = 600;
var seed = Date.seed;
var phase = 0;
var zoom = 0.7;
var zoomf = 1;
var run = true;
var w = Window(name: "Affines", bounds: Rect(40, 40, h, v), resizable: false);
w.view.background_(Color.blue(value: 0.4, alpha: 1));
w.onClose = { run = false };
w.front;
w.drawFunc = {
    thisThread.randSeed = Date.seed;
    (0.0125.coin).ifTrue({
	    seed = Date.seed;
	    phase = 0;
	    zoom = 0.7;
	    zoomf = (1 / 1.01).exprand(1.01)
    }, ifFalse: {
	    phase = phase + (2 * pi / 80);
	    zoom = zoom * zoomf
    });
    thisThread.randSeed = seed;
    Pen.use({
        var p1 = Point(20.rand2 + (h / 2), 20.rand2 + (v / 2));
        var p2 = Point(20.rand2 + (h / 2), 20.rand2 + (v / 2));
        var xscales = { (2 ** -0.1).exprand(2 ** 0.1) }.dup(2);
        var yscales = { (2 ** -0.1).exprand(2 ** 0.1) }.dup(2);
        var xlates = { 8.rand2 + phase }.dup(2);
        var ylates = { 8.rand2 }.dup(2);
        var rots = { 2 * pi.rand2 }.dup(2);
        var xform;
        xscales = xscales ++ (1 / xscales);
        yscales = yscales ++ (1 / yscales);
        xlates = xlates ++ xlates.neg;
        ylates = ylates ++ xlates.neg;
        rots = rots ++ rots.neg;
        xform = (0 .. 3).collect{ |i|
			(rot: rots[i], xlate: xlates[i], ylate: ylates[i], xscale: xscales[i], yscale: yscales[i])
		};
        Pen.strokeColor_(Color.grey(grey: 1, alpha: 0.5));
        Pen.width = 8.linrand + 1;
        Pen.translate(400, 400);
        Pen.scale(zoom, zoom);
        Pen.translate(-400, -400);
        1200.do({
		var t = xform.choose;
		Pen.width = 8.linrand + 1;
		Pen.beginPath;
		Pen.translate(t.xlate, t.ylate);
		Pen.rotate(t.rot, h / 2, v / 2);
		Pen.scale(t.xscale, t.yscale);
                Pen.moveTo(p1);
                Pen.lineTo(p2);
		Pen.stroke;
        })
    })
};
{
	{ run }.whileTrue({
		w.refresh;
		0.05.wait
	})
}.fork(AppClock)

// Pen ; simple rotating and scaling ; jmcc
var w = Window(
	name: "Pen Rotation and Scaling",
	bounds: Rect(left: 128, top: 64, width: 360, height: 360),
	resizable: false
);
w.drawHook = {
	var h = 300;
	var v = 300;
	Pen.use {
		// use the same rect for everything,  just scale and rotate
		var r = Rect(left: 0, top: 0, width: 200, height: 80);
		Color.black.set;
		// offset all subsequent co-ordinates
		Pen.translate(x: 80, y: 20);
		Pen.fillRect(r);
		Color.red.set;
		// scale all subsequent co-ordinates
		Pen.scale(x: 0.8,  y: 0.8);
		Pen.translate(x: 8, y: 10);
		// rotate all subsequent co-ordinates
		Pen.rotate(angle: 0.1 * pi, x: 0, y: 0);
		Pen.fillRect(r);
		Color.blue.set;
		// lather,  rinse,  repeat
		Pen.scale(x: 0.8,  y: 0.8);
		Pen.rotate(angle: 0.1 * pi, x: 0, y: 0);
		Pen.width_(3);
		Pen.strokeRect(r);
		Color.yellow(val: 1, alpha: 0.5).set;
		Pen.scale(x: 0.8,  y: 0.8);
		Pen.rotate(angle: 0.1 * pi, x: 0, y: 0);
		Pen.translate(x: 20, y: -20);
		Pen.fillOval(r);
	}
};
w.front;
