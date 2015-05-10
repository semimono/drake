
module drake.worldModel.renderer;



interface BaseRenderer {
	
	void addObject(SceneObject object) {
		
	}
	
	void removeObject(SceneObject object) {
		
	}
	
	abstract void addCamera(CameraStructure cam);
	
protected:
	WorldModel world;
};

