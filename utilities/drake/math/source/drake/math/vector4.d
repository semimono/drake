
module drake.math.vector4;

import drake.math.vector2;
import drake.math.vector3;
import std.math;
import std.range;
import std.conv;
import std.format;

struct Vector4(T) {
	
	// constants
	static const Vector4 zero = Vector4!(T)(0, 0, 0);
	static const Vector4 right = Vector4!(T)(1, 0, 0);
	static const Vector4 left = Vector4!(T)(-1, 0, 0);
	static const Vector4 up = Vector4!(T)(0, 1, 0);
	static const Vector4 down = Vector4!(T)(0, -1, 0);
	static const Vector4 forward = Vector4!(T)(0, 0, 1);
	static const Vector4 back = Vector4!(T)(0, 0, -1);
	
	// members
	T x, y, z, w;

	// constructors
	this(T x, T y, T z) {
		this(x, y, z, 1);
	}
	this(T x, T y, T z, T w) {
		this.x = x;
		this.y = y;
		this.z = z;
		this.w = w;
	}
	this(const ref Vector2!(T) source) {
		this(source.x, source.y, 0);
	}
	this(const ref Vector3!(T) source) {
		this(source.x, source.y, source.z);
	}


	// methods
	T magnitude() const {
		return sqrt(x*x + y*y + z*z);
	}
	T magnitudeSquared() const {
		return x*x + y*y + z*z;
	}
	Vector4!(T) normal() const {
		T magnitude = magnitude();
		return Vector4!(T)(x /magnitude, y /magnitude, z /magnitude);
	}
	void normalize() {
		T m = magnitude();
		x /= m; y /= m; z /= m;
	}
	
	Vector4!(T) scale(T s) const {
		return Vector4!(T)(x*s, y*s, z*s);
	}
	
	T dot(const ref Vector4!(T) b) const {
		return (x * b.x) + (y * b.y) + (z * b.z);
	}
	Vector4!(T) cross(const ref Vector4!(T) b) const {
		return Vector4!(T)((y*b.z)- (z*b.y), (z*b.x)- (x*b.z), (x*b.y)- (y*b.x));
	}
	
	
	// operators
	override Vector4!(T) opBinary(string op)(const ref Vector4!(T) other) {
		static if (op == "+")
			return Vector4!(T)(x +other.x, y +other.y, z +other.z);
		else static if (op == "-")
			return Vector4!(T)(x -other.x, y -other.y, z -other.z);
		else static if (op == "*")
			return Vector4!(T)(x *other.x, y *other.y, z *other.z);
		else static if (op == "/")
			return Vector4!(T)(x /other.x, y /other.y, z /other.z);
		else
			static assert(0, "Operator "~op~" not implemented");
	}
	override Vector4!(T) opBinary(string op)(T scalar) {
		static if (op == "*")
			return Vector4!(T)(x *scalar, y *scalar, z *scalar);
		else static if (op == "/")
			return Vector4!(T)(x /scalar, y /scalar, z /scalar);
		else
			static assert(0, "Operator "~op~" not implemented");
	}
	
	override Vector4!(T) opUnary(string op)() const if (op == "-") {
		return Vector4!(T)(-x, -y, -z);
	}
	
	override ref Vector4!(T) opOpAssign(string op)(const ref Vector4!(T) other) {
		static if (op == "+=") {
			x += other.x; y += other.y; z += other.z;
		} else static if (op == "-=") {
			x -= other.x; y -= other.y; z -= other.z;
		} else static if (op == "*=") {
			x *= other.x; y *= other.y; z *= other.z;
		} else static if (op == "/=") {
			x /= other.x; y /= other.y; z /= other.z;
		} else
			static assert(0, "Operator "~op~" not implemented");
		return this;
	}
	
	override ref Vector4!(T) opOpAssign(string op)(T scalar) {
		static if (op == "*=") {
			x *= scalar; y *= scalar; z *= scalar;
		} else static if (op == "/=") {
			x /= scalar; y /= scalar; z /= scalar;
		} else
			static assert(0, "Operator "~op~" not implemented");
		return this;
	}
	
	bool opEquals(const ref Vector4!(T) other) {
		return x == other.x && y == other.y && z == other.z && w == other.w;
	}
	
	ref T opIndex(size_t i) {
		switch(i) {
			case 0: return x;
			case 1: return y;
			case 2: return z;
			default: return w;
		}
	}
	T opIndex(size_t i) const {
		switch(i) {
			case 0: return x;
			case 1: return y;
			case 2: return z;
			default: return w;
		}
	}
	
	
	// output
	string toString() const {
		return "("~to!string(x)~", "~to!string(y)~", "~to!string(z)~", "~to!string(w)~")";
	}
	void toString(scope void delegate(const(char)[]) sink, FormatSpec!char fmt) const {
		put(sink, "(");
		formatValue(sink, x, fmt);
		put(sink, ", ");
		formatValue(sink, y, fmt);
		put(sink, ", ");
		formatValue(sink, z, fmt);
		put(sink, ", ");
		formatValue(sink, w, fmt);
		put(sink, ")");
	}
}