
import vector2;
import vector3;

class Vector4(T) {
	
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
	this() {
		this(0, 0, 0);
	}
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
	
	// operators
	
}