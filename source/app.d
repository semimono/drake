
import drake.math.vector3;
import std.stdio;
import core.time;


void main() {
	writeln("Edit source/app.d to start your project.");
	auto myVec = Vector3!double(1, 2, 3);
	
	MonoTime start = MonoTime.currTime;
	for(int i=0; i<100000; ++i)
		writeln(myVec);
	
	MonoTime end = MonoTime.currTime;
	Duration elapsed = end -start;
	writeln(elapsed);
}
