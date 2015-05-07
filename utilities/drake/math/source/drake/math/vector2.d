
module drake.math.vector2;

import drake.math.vector3;
import drake.math.vector4;
import std.math;
import std.conv;

struct Vector2(T) {
	
	// constants
	static const Vector2 zero = Vector2!(T)(0, 0);
	static const Vector2 right = Vector2!(T)(1, 0);
	static const Vector2 left = Vector2!(T)(-1, 0);
	static const Vector2 up = Vector2!(T)(0, 1);
	static const Vector2 down = Vector2!(T)(0, -1);
	
	// members
	T x, y;

	// constructors
	this(T x, T y) {
		this.x = x;
		this.y = y;
	}
	this(const ref Vector3!(T) source) {
		this(source.x, source.y);
	}
	this(const ref Vector4!(T) source) {
		this(source.x, source.y);
	}


	// methods
	T magnitude() const {
		return sqrt(x*x + y*y);
	}
	T magnitudeSquared() const {
		return x*x + y*y;
	}
	Vector2!(T) normal() const {
		T magnitude = sqrt((x*x) + (y*y));
		return Vector2!(T)(x /magnitude, y /magnitude);
	}
	void normalize() {
		T m = sqrt((x*x) + (y*y));
		x /= m; y /= m;
	}
	
	Vector2!(T) scale(T s) const {
		return Vector2!(T)(x*s, y*s);
	}
	
	T dot(const ref Vector2!(T) b) const {
		return (x * b.x) + (y * b.y);
	}
	
	
	// operators
	override Vector2!(T) opBinary(string op)(const ref Vector2!(T) other) {
		static if (op == "+")
			return Vector2!(T)(x +other.x, y +other.y);
		else static if (op == "-")
			return Vector2!(T)(x -other.x, y -other.y);
		else static if (op == "*")
			return Vector2!(T)(x *other.x, y *other.y);
		else static if (op == "/")
			return Vector2!(T)(x /other.x, y /other.y);
		else
			static assert(0, "Operator "~op~" not implemented");
	}
	override Vector2!(T) opBinary(string op)(T scalar) {
		static if (op == "*")
			return Vector2!(T)(x *scalar, y *scalar);
		else static if (op == "/")
			return Vector2!(T)(x /scalar, y /scalar);
		else
			static assert(0, "Operator "~op~" not implemented");
	}
	
	override Vector2!(T) opUnary(string op)() const if (op == "-") {
		return Vector2!(T)(-x, -y);
	}
	
	override ref Vector2!(T) opOpAssign(string op)(const ref Vector2!(T) other) {
		static if (op == "+=") {
			x += other.x; y += other.y;
		} else static if (op == "-=") {
			x -= other.x; y -= other.y;
		} else static if (op == "*=") {
			x *= other.x; y *= other.y;
		} else static if (op == "/=") {
			x /= other.x; y /= other.y;
		} else
			static assert(0, "Operator "~op~" not implemented");
		return this;
	}
	
	override ref Vector2!(T) opOpAssign(string op)(T scalar) {
		static if (op == "*=") {
			x *= scalar; y *= scalar;
		} else static if (op == "/=") {
			x /= scalar; y /= scalar;
		} else
			static assert(0, "Operator "~op~" not implemented");
		return this;
	}
	
	bool opEquals(const ref Vector2!(T) other) {
		return x == other.x && y == other.y;
	}
	
	ref T opIndex(size_t i) {
		switch(i) {
			case 0: return x;
			default: return y;
		}
	}
	T opIndex(size_t i) const {
		switch(i) {
			case 0: return x;
			default: return y;
		}
	}
	
	
	// output
	string toString() const {
		return "("~text!double(x)~", "~text!double(y)~")";
	}
}