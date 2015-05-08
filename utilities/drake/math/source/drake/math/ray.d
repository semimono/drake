
module drake.math.ray;

import drake.math.vector3;



struct Ray3(T) {
	Vector3!T position, direction;

	this(const ref Vector3!T position, const ref Vector3!T direction) {
		this.position = position;
		this.direction = direction;
	}
}