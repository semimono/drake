
import vector3;
import vector4;

class Vector2(T) {
	
	// constants
	static const Vector2 zero = Vector2!(T)(0, 0);
	static const Vector2 right = Vector2!(T)(1, 0);
	static const Vector2 left = Vector2!(T)(-1, 0);
	static const Vector2 up = Vector2!(T)(0, 1);
	static const Vector2 down = Vector2!(T)(0, -1);
	
	// members
	T x, y;

	// constructors
	this() {
		this(0, 0);
	}
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
	
	// operators
	
}