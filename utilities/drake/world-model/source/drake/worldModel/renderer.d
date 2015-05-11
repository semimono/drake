
module drake.worldModel.renderer;

import drake.worldModel.cameraStructure;
import drake.worldModel.sceneObject;
import drake.worldModel.worldModel;



interface BaseRenderer(T) {
	
	void addObject(SceneObject!T object) {
		
	}
	
	void removeObject(SceneObject!T object) {
		
	}
	
	abstract void addCamera(CameraStructure!T cam);
	
protected:
	WorldModel!T world;
};

