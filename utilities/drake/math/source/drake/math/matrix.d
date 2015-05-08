
module drake.math.matrix;



struct Matrix(T) {
public:

	@dsable this();
	
	this(int w, int h) {
		this.w = w;
		this.h = h;
		m = new T[h *w];
	}
	
	~this() {
		delete m;
	}

	const T *toArray() {
		return m.ptr;
	}

	ref T operator()(int x, int y) {
		return m[h *x +y];
	}

	string toString() {
		string s = "";
		for (int i = 0; i < a.h * a.w; i++) {
			//os << "[";
			//for (int j = 0; j < a.w; j++) {
			//if (j != 0) os << ", ";
			//os << i + j*a.h;
			s ~= to!string(a.m[i]) ~" ";
			//}
			//os << "]" << std::endl;
		}
		return s;
	}
	
private:
	T[] m;
	int h;
	int w;
}