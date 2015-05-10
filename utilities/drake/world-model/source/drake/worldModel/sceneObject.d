
module drake.worldModel.sceneObject;



class SceneObject(T) {
	
	
	void addChild(SceneObject!T c) {
		children ~= c;
	}
	SceneObject!T[] getChildren() {
		return children;
	}
	SceneObject!T getChild(int index) {
		return children[index];
	}
	int childCount() {
		return children.length;
	}
	void clearChildren() {
		children = [];
	}
	
	void addMesh(Mesh!T m) {
		meshes ~= m;
	}
	Mesh!T[] getMeshes() {
		return meshes;
	}
	ref Mesh!T getMesh(int index) {
		return meshes[index];
	}
	int meshCount() {
		return meshes.length;
	}
	void clearMeshes() {
		meshes = [];
	}
	
protected:
	SceneObject!T[] children;
	Mesh!T[] meshes;
}



//////////////////
//  Unit Tests  //
//////////////////

