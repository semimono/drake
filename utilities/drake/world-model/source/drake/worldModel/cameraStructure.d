
module drake.worldModel.cameraStructure;

//#ifndef M_PI
//	#define M_PI 3.14159265358979323846
//#endif



class CameraStructure(T) {
	
	
	this(Vector3!T pos, Vector3!T dir, Vector3!T up) {
		this.position = pos;
		this.direction = dir;
		this.up = up;
	}
	
	this(T x, T y, T z, T vrp_x, T vrp_y, T vrp_z, T upx, T upy, T upz) {
		position = Vector3!T(x, y, z);
		up = Vector3!T(upx, upy, upz);
		direction = Vector3!T((position +Vector3!T(vrp_x, vrp_y, vrp_z)).normal());
	}
	
	// commented due to lack of GL import.  Should exist in gl camera
	//void Camera::Look(Vector3<float> look) {
	//	//gluLookAt(pos[0], pos[1], pos[2], look[0], look[1], look[2], up[0], up[1], up[2]);
	//	//cout << "here " << *this << endl;
	//	//cout << look << endl;
	//	Matrix<float> M = Matrix<float>(4, 4);
	//	//cout << "pos: " << pos << endl;
	//	Vector3<float> posf = Vector3<float>((float)position.x, (float)position.y, (float)position.z);
	//	Vector3<float> upf =  Vector3<float>((float)up.x, (float)up.y, (float)up.z);
	//
	//	Vector3<float> F = look - posf;
	//	//cout << "F: " << F << endl;
	//	F.normalize();
	//	up.normalize();
	//	//cout << "f: " << F << endl;
	//
	//	Vector3<float> s = upf.cross(F);
	//
	//	s.normalize();
	//	//cout << "s: " << s << endl;
	//	Vector3<float> u = s.cross(F);
	//	u.normalize();
	//	//cout << "u: " << u << endl;
	//
	//	M(0,0) = s[0];
	//	M(1,0) = s[1];
	//	M(2,0) = s[2];
	//	M(3,0) = 0;
	//
	//	M(0,1) = u[0];
	//	M(1,1) = u[1];
	//	M(2,1) = u[2];
	//	M(3,1) = 0;
	//
	//	M(0,2) = -F[0];
	//	M(1,2) = -F[1];
	//	M(2,2) = -F[2];
	//	M(3,2) = 0;
	//
	//	M(0,3) = 0;
	//	M(1,3) = 0;
	//	M(2,3) = 0;
	//	M(3,3) = 1;
	//
	//	//cout << M << endl;
	//	//glMatrixMode( GL_PROJECTION );
	//	//cout << M << endl;
	//	//glTranslated(-pos[0], -pos[1], -pos[2]);
	//	glMultMatrixf(M.toArray());
	//	glTranslated(-position[0], -position[1], -position[2]);
	//}
	
	// commented due to lack of GL import.  Should exist in gl camera
	//void Camera::setPerspective(float fovy, float aspect, float zNear, float zFar) {
	////glLoadIdentity();
	//	//cout << "persp look " << look << endl;
	//	/*Matrix<T> M = Matrix<T>(4,4);
	//	T f = tan(M_PI_2 - (fovy/2)); //cotangent of fovy/2
	//
	//	M(0, 0) = f/aspect_ratio;
	//	M(1,0) = 0;
	//	M(2,0) = 0;
	//	M(3,0) = 0;
	//
	//	M(0, 1) = 0;
	//	M(1,1) = f;
	//	M(2,1) = 0;
	//	M(3,1) = 0;
	//
	//	M(0, 2) = 0;
	//	M(1,2) = 0;
	//	M(2,2) = (near_plane + far_plane)/(near_plane - far_plane);
	//	M(3,2) = (2*near_plane*far_plane)/(near_plane - far_plane);
	//
	//	M(0,3) = 0;
	//	M(1,3) = 0;
	//	M(2,3) = -1;
	//	M(3,3) = 0;
	//
	//	cout << M << endl;
	//
	//	//glLoadIdentity();
	//	glMultMatrixf(M.toArray());
	//	//Look();*/
	//	double xmin, xmax, ymin, ymax;
	//    ymax = zNear * tan(fovy * M_PI / 360.0);
	//    ymin = -ymax;
	//    xmin = ymin * aspect;
	//    xmax = ymax * aspect;
	//    glFrustum(xmin, xmax, ymin, ymax, zNear, zFar);
	//}
	
	// commented due to lack of GL import.  Should exist in gl camera
	//void Camera::rotate(float delta, int axis, Vector3<float> look) {
	//	//cout << *this << endl;
	//	//look.normalize();
	//	//cout << "hi" << endl;
	//	//cout << axis << endl;
	//	//cout << look << endl;
	//
	//	Vector3<float> posf = Vector3<float>(position[0], position[1], position[2]);
	//	//Vector3<GLfloat> lookDir = look - pos;
	//	//lookDir.normalize();
	//	int axis2 = 2;
	//	//if (axis == 1) {
	//	//	axis2 = 1;
	//	//	axis = 2;
	//	//}
	//	GLfloat cam_x = look[axis] - posf[axis];
	//	GLfloat cam_z = look[axis2] - posf[axis2];
	//	//cout << "hi" << endl;
	//	//cout << look << endl;
	//	//cout << pos << endl;
	//	//cout << "end" << endl;
	//	GLfloat magnitude = sqrt(cam_x*cam_x + cam_z*cam_z);
	//
	//	GLfloat angle = acos(cam_z/magnitude);
	//	if (cam_x < 0) {
	//		angle = -abs(angle);
	//	}
	//	else {
	//		angle = abs(angle);
	//	}
	//
	//	look[axis] = sin(angle + delta) + posf[axis];
	//	look[axis2] = cos(angle + delta) + posf[axis2];
	//	//look.normalize();
	//	//look[2 - (axis + 1)] = lookDir[2 - (axis + 1)] + pos[2 - (axis + 1)];
	//	Vector3<float> test = look - posf;
	//	test.normalize();
	//	//TODO removed because the operator<< implementation doesn't work
	//	//cout << test << endl;
	//}
	
	string getName() const {
		return name;
	}
	
	Vector3!T getFocalPoint() const {
		return position +direction *nearPlane;
	}
	
	Vector3!T getHorizontalAxis() const {
	        Vector3!T n = direction.normal();
	        Vector3!T u = up.normal().cross(n).normal();
	        return u;
	}
	
	Vector3!T getVerticalAxis() const {
	        Vector3!T n = direction.normal();
	        Vector3!T u = up.normal().cross(n).normal();
	        Vector3!T v = n.cross(u).normal();
	        return v;
	}
protected:
	string name;
	Vector3!T position;
	Vector3!T up;
	Vector3!T direction;
	Vector3!T nearPlane;
}



//////////////////
//  Unit Tests  //
//////////////////

