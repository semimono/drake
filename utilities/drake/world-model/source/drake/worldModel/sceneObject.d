
module drake.worldModel.sceneObject;



class SceneObject(T) {
	
	
	void addChild(SceneObject!T c) {
		children ~= c;
	}
	
	SceneObject!T[] getChildren() {
		return children;
	}
	
	void addChild(ref SceneObject!T object) {
		children ~= object;
	}
	
	void clearChildren() {
		children[0];
	}
	
protected:
	SceneObject!T[] children;
	Mesh!T[] meshes;
}



//////////////////
//  Unit Tests  //
//////////////////

