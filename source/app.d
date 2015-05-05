import std.stdio;
import drake.math.vector3;

struct V(T) {
	
	// members
	T x, y, z;
	
	// constructors
//	this() {
//		this(0, 0, 0);
//	}
	this(T x, T y, T z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
}

void main()
{
	writeln("Edit source/app.d to start your project.");
	auto myVec = Vector3!double(1, 2, 3);
	writeln(myVec);
}
