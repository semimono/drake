
module drake.worldModel.light;

import drake.math.vector3;
import drake.worldModel.color;



struct Light(T) {
	
	Color color;
	Vector3!T center;
	T w;
	
	this(const ref Vector3!T center, T u, const ref Color color) {
		this.center = center; 
		w = u;
		this.color = color;
	}
	
	//const std::vector<int> * Light::get_color() const{
	//	return &color;
	//}
	//
	//double Light::get_x() const {
	//	return center[0];
	//}
	//
	//double Light::get_y() const {
	//	return center[1];
	//}
	//
	//double Light::get_z() const {
	//	return center[2];
	//}
	//
	//double Light::get_w() const {
	//	return w;
	//}
	//
	//const Vector3<double> * Light::getCenter() const{
	//	//vector<double> * result = new vector<double>();
	//	//result->push_back(center.get_x());
	//	//result->push_back(center.get_y());
	//	//result->push_back(center.get_z());
	//	return &center;//result;
	//}
	//
	//bool Light::isBlocked(Vector3<double> point, const vector<Face *> & faces) const {
	//	//vector<double> * ray 
	////	double d;
	//	//if (center.get_w() == 0) {
	//		//d = magnitude();
	//	//}
	//	double d = (point - *getCenter()).magnitude();
	//	for	(size_t i = 0; i < faces.size(); i++) {
	//		double T;
	//		Vector3<double> temp = faces[i]->intersect(point, center, &T); //switched these
	//		if (faces[i]->isInside(temp)) {
	//			double d1 = (temp - *getCenter()).magnitude();
	//			if ((d - d1) < 0.000001 && (d1 - d) < .000001) {
	//				
	//			}
	//			else if (d > d1) {
	//			return true;
	//			}
	//		}
	//	//	temp->clear();
	//	//	temp->~vector();
	//	}
	//	
	//	//TODO update this code to add support for elipses
	//	/*for	(int i = 0; i < elipses.size(); i++) {
	//		vector<double> * temp = elipses[i]->intersect(point, getCenter());
	//		if (elipses[i]->is_inside(temp)) {
	//			double d1 = magnitude(subtract(temp, getCenter()));
	//			if ((d - d1) < 0.000001 && (d1 - d) < .000001) {
	//				
	//			}
	//			else if (d > d1) {
	//			return true;
	//			}
	//		}
	//		temp->~vector();
	//	}*/
	//	return false;
	//}
}