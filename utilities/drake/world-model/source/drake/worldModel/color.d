
module drake.worldModel.color;

import std.conv;
import std.format;
import std.range;



struct Color {
	ubyte r, g, b;
	
	this(ubyte r, ubyte g, ubyte b) {
		this.r = r;
		this.g = g;
		this.b = b;
	}
	this(ubyte[3] channels) {
		r = channels[0];
		g = channels[1];
		b = channels[2]; 
	}
	
	
	// operators
	ref ubyte opIndex(size_t i) {
		switch(i) {
			case 0: return r;
			case 1: return g;
			default: return b;
		}
	}
	ubyte opIndex(size_t i) const {
		switch(i) {
			case 0: return r;
			case 1: return g;
			default: return b;
		}
	}
	
	
	// output
	string toString() const {
		return "("~to!string(r)~", "~to!string(g)~", "~to!string(b)~")";
	}
	void toString(scope void delegate(const(char)[]) sink, FormatSpec!char fmt) const {
		put(sink, "(");
		formatValue(sink, r, fmt);
		put(sink, ", ");
		formatValue(sink, g, fmt);
		put(sink, ", ");
		formatValue(sink, b, fmt);
		put(sink, ")");
	}
}



//////////////////
//  Unit Tests  //
//////////////////

