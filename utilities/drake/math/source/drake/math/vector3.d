
module drake.math.vector3;

import drake.math.vector2;
import drake.math.vector4;
import std.math;
import std.range;
import std.conv;
import std.format;



struct Vector3(T) {
	
	
	// constants
	static const Vector3 zero = Vector3!(T)(0, 0, 0);
	static const Vector3 right = Vector3!(T)(1, 0, 0);
	static const Vector3 left = Vector3!(T)(-1, 0, 0);
	static const Vector3 up = Vector3!(T)(0, 1, 0);
	static const Vector3 down = Vector3!(T)(0, -1, 0);
	static const Vector3 forward = Vector3!(T)(0, 0, 1);
	static const Vector3 back = Vector3!(T)(0, 0, -1);
	
	
	// members
	T x, y, z;
	
	
	// constructors
	this(T x, T y, T z) {
		this.x = x; 
		this.y = y;
		this.z = z;
	}
	this(const ref Vector2!(T) source) {
		this(source.x, source.y, 0);
	}
	this(const ref Vector4!(T) source) {
		this(source.x, source.y, source.z);
	}
	
	
	// methods
	T magnitude() const {
		return sqrt(x*x + y*y + z*z);
	}
	T magnitudeSquared() const {
		return x*x + y*y + z*z;
	}
	Vector3!(T) normal() const {
		T magnitude = sqrt((x*x) + (y*y) + (z*z));
		return Vector3!(T)(x /magnitude, y /magnitude, z /magnitude);
	}
	void normalize() {
		T m = sqrt((x*x) + (y*y) + (z*z));
		x /= m; y /= m; z /= m;
	}
	
	Vector3!(T) scale(T s) const {
		return Vector3!(T)(x*s, y*s, z*s);
	}
	
	T dot(const ref Vector3!(T) b) const {
		return (x * b.x) + (y * b.y) + (z * b.z);
	}
	Vector3!(T) cross(const ref Vector3!(T) b) const {
		return Vector3!(T)((y*b.z)- (z*b.y), (z*b.x)- (x*b.z), (x*b.y)- (y*b.x));
	}
	
	
	// operators
	override Vector3!(T) opBinary(string op)(const ref Vector3!(T) other) {
		static if (op == "+")
			return Vector3!(T)(x +other.x, y +other.y, z +other.z);
		else static if (op == "-")
			return Vector3!(T)(x -other.x, y -other.y, z -other.z);
		else static if (op == "*")
			return Vector3!(T)(x *other.x, y *other.y, z *other.z);
		else static if (op == "/")
			return Vector3!(T)(x /other.x, y /other.y, z /other.z);
		else
			static assert(0 == "Operator "~op~" not implemented");
	}
	override Vector3!(T) opBinary(string op)(T scalar) {
		static if (op == "*")
			return Vector3!(T)(x *scalar, y *scalar, z *scalar);
		else static if (op == "/")
			return Vector3!(T)(x /scalar, y /scalar, z /scalar);
		else
			static assert(0 == "Operator "~op~" not implemented");
	}
	
	override Vector3!(T) opUnary(string op)() const if (op == "-") {
		return Vector3!(T)(-x, -y, -z);
	}
	
	override ref Vector3!(T) opOpAssign(string op)(const ref Vector3!(T) other) {
		static if (op == "+=") {
			x += other.x; y += other.y; z += other.z;
		} else static if (op == "-=") {
			x -= other.x; y -= other.y; z -= other.z;
		} else static if (op == "*=") {
			x *= other.x; y *= other.y; z *= other.z;
		} else static if (op == "/=") {
			x /= other.x; y /= other.y; z /= other.z;
		} else
			static assert(0 == "Operator "~op~" not implemented");
		return this;
	}
	
	override ref Vector3!(T) opOpAssign(string op)(T scalar) {
		static if (op == "*=") {
			x *= scalar; y *= scalar; z *= scalar;
		} else static if (op == "/=") {
			x /= scalar; y /= scalar; z /= scalar;
		} else
			static assert(0 == "Operator "~op~" not implemented");
		return this;
	}
	
	bool opEquals(const ref Vector3!(T) other) {
		return x == other.x && y == other.y && z == other.z;
	}
	
	ref T opIndex(size_t i) {
		switch(i) {
			case 0: return x;
			case 1: return y;
			default: return z;
		}
	}
	T opIndex(size_t i) const {
		switch(i) {
			case 0: return x;
			case 1: return y;
			default: return z;
		}
	}
	
	
	// output
	string toString() const {
		return "("~to!string(x)~", "~to!string(y)~", "~to!string(z)~")";
	}
	void toString(scope void delegate(const(char)[]) sink, FormatSpec!char fmt) const {
		put(sink, "(");
		formatValue(sink, x, fmt);
		put(sink, ", ");
		formatValue(sink, y, fmt);
		put(sink, ", ");
		formatValue(sink, z, fmt);
		put(sink, ")");
	}
}


//////////////////
//  unit tests  //
//////////////////

unittest {
	Vector3!double test = Vector3!double(1, 2, 3);
	double x = test[0];
	double y = test[1];
	double z = test[2];
	assert(x == 1);
	assert(y == 2);
	assert(z == 3);
}

unittest {
	Vector3!double test = Vector3!double(2, 4, 4);
	assert(test.magnitude() == 6);
}

unittest {
	Vector3!double test = Vector3!double(1, 2, 3);
	Vector3!double result = test.scale(2);
		double x = result[0];
		double y = result[1];
		double z = result[2];
		assert(2 == x);
		assert(4 == y);
		assert(6 == z);
}

unittest {
	Vector3!double a = Vector3!double(1, 2, 3);
	Vector3!double b = Vector3!double(3, 2, 1);
	double result = a.dot(b);
	assert(10 == result);
}

unittest {
	Vector3!double a = Vector3!double(0, 0, 0);
	a[0] = 1;
	a[1] = 2;
	a[2] = 3;
	double x = a[0];
	double y = a[1];
	double z = a[2];
	assert(1 == x);
	assert(2 == y);
	assert(3 == z);
}

unittest { 
	Vector3!double a = Vector3!double(1, 2, 3);
	Vector3!double b = Vector3!double(3, 4, 5);
	Vector3!double result = a.cross(b);
	double x = result[0];
	double y = result[1];
	double z = result[2];
	assert(-2 == x);
	assert(4 == y);
	assert(-2 == z);
}

unittest {
	Vector3!double a = Vector3!double(2, 5, 7);
	double l = a.normal().magnitude();
	double epsilon = .0000001;
	assert(abs(1.0 - l) < epsilon);
	
	Vector3!double b = Vector3!double(.6, 0, 0);
	Vector3!double normal = b.normal();
	l = normal.magnitude();
	assert(abs(1.0 - l) < epsilon);
	assert(1.0 == normal.x);
	assert(0 == normal.y);
	assert(0 == normal.z);
}
