
//import vector2;
//import vector4;
import std.math;

struct Vector3(T) {
	
	
	// constants
//	static const Vector3 zero = Vector3!(T)(0, 0, 0);
//	static const Vector3 right = Vector3!(T)(1, 0, 0);
//	static const Vector3 left = Vector3!(T)(-1, 0, 0);
//	static const Vector3 up = Vector3!(T)(0, 1, 0);
//	static const Vector3 down = Vector3!(T)(0, -1, 0);
//	static const Vector3 forward = Vector3!(T)(0, 0, 1);
//	static const Vector3 back = Vector3!(T)(0, 0, -1);
	
	
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
//	this(const ref Vector2!(T) source) {
//		this(source.x, source.y, 0);
//	}
//	this(const ref Vector4!(T) source) {
//		this(source.x, source.y, source.z);
//	}
	
	
	// methods
//	T magnitude() const {
//		return sqrt(x*x + y*y + z*z);
//	}
//	T magnitudeSquared() const {
//		return x*x + y*y + z*z;
//	}
//	Vector3!(T) normal() const {
//		T magnitude = sqrt((x*x) + (y*y) + (z*z));
//		return Vector3!(T)(x /magnitude, y /magnitude, z /magnitude);
//	}
//	void normalize() {
//		T m = sqrt((x*x) + (y*y) + (z*z));
//		x /= m; y /= m; z /= m;
//	}
//	
//	Vector3!(T) normalized() const {
//		T m = sqrt((x*x) + (y*y) + (z*z));
//		return Vector3!(T)(x / m, y / m, z / m);
//	}
//	
//	Vector3!(T) scale(T s) const {
//		return Vector3!(T)(x*s, y*s, z*s);
//	}
//	
//	T dot(const ref Vector3!(T) b) const {
//		return (x * b.x) + (y * b.y) + (z * b.z);
//	}
//	Vector3!(T) cross(const ref Vector3!(T) b) const {
//		return Vector3!(T)((y*b.z)- (z*b.y), (z*b.x)- (x*b.z), (x*b.y)- (y*b.x));
//	}
	
	
	// operators
//	override Vector3!(T) opBinary(string op)(const ref Vector3!(T) other) {
//		static if (op == "+")
//			return Vector3!(T)(x +other.x, y +other.y, z +other.z);
//		else static if (op == "-")
//			return Vector3!(T)(x -other.x, y -other.y, z -other.z);
//		else static if (op == "*")
//			return Vector3!(T)(x *other.x, y *other.y, z *other.z);
//		else static if (op == "/")
//			return Vector3!(T)(x /other.x, y /other.y, z /other.z);
//		else
//			static assert(0, "Operator "~op~" not implemented");
//	}
//	override Vector3!(T) opBinary(string op)(T scalar) {
//		static if (op == "*")
//			return Vector3!(T)(x *scalar, y *scalar, z *scalar);
//		else static if (op == "/")
//			return Vector3!(T)(x /scalar, y /scalar, z /scalar);
//		else
//			static assert(0, "Operator "~op~" not implemented");
//	}
//	
//	override Vector3!(T) opUnary(string op)() const if (op == "-") {
//		return Vector3!(T)(-x, -y, -z);
//	}
//	
//	override ref Vector3!(T) opOpAssign(string op)(const ref Vector3!(T) other) {
//		static if (op == "+=") {
//			x += other.x; y += other.y; z += other.z;
//		} else static if (op == "-=") {
//			x -= other.x; y -= other.y; z -= other.z;
//		} else static if (op == "*=") {
//			x *= other.x; y *= other.y; z *= other.z;
//		} else static if (op == "/=") {
//			x /= other.x; y /= other.y; z /= other.z;
//		} else
//			static assert(0, "Operator "~op~" not implemented");
//		return this;
//	}
//	
//	override ref Vector3!(T) opOpAssign(string op)(T scalar) {
//		static if (op == "*=") {
//			x *= scalar; y *= scalar; z *= scalar;
//		} else static if (op == "/=") {
//			x /= scalar; y /= scalar; z /= scalar;
//		} else
//			static assert(0, "Operator "~op~" not implemented");
//		return this;
//	}
//	
//	bool opEquals(const ref Vector3!(T) other) {
//		return x == other.x && y == other.y && z == other.z;
//	}
//	
//	ref T opIndex(size_t i) {
//		switch(i) {
//			case 0: return x;
//			case 1: return y;
//		}
//		return z;
//	}
//	T opIndex(size_t i) const {
//		switch(i) {
//			case 0: return x;
//			case 1: return y;
//		}
//		return z;
//	}
//	
//	
//	// output
	string toString() const pure @safe {
		return "(%d, %d, %d)", x, y, z;
	}
	void toString(scope void delegate(const(char)[]) sink) const {
		sink("("); sink(x); sink(", "); sink(y); sink(", "); sink(z); sink(")");
	}
}
