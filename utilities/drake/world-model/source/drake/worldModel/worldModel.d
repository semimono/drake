
module drake.worldModel.worldModel;

import drake.worldModel.renderer;
import std.container.rbtree;



class WorldModel(T) {
	
	synchronized void addObject(SceneObject object) {
		objects.insert(object);
		foreach(BaseRenderer rend; renderers) {
			rend.addObject(object);
		}
	}
	
	synchronized void removeObject(SceneObject asset) {
		object.remove(asset);
		foreach(BaseRenderer rend; renderers) {
			rend.removeObject(object);
		}
	}
	
	synchronized void addRenderer(BaseRenderer rend) {
		renderers.insert(rend);
		foreach(SceneObject ob; assets) {
			rend.addObject(ob);
		}
	}
	
	synchronized void removeRenderer(BaseRenderer rend) {
		renderers.remove(rend);
		foreach(SceneObject ob; assets) {
			rend.removeObject(ob);
		}
	}
	
protected:
	RedBlackTree!SceneObject objects;
	RedBlackTree!BaseRenderer renderers;
}



//////////////////
//  Unit Tests  //
//////////////////

