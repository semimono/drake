
import drake.math.vector3;
import std.stdio;
import core.time;

import dlangui;

mixin APP_ENTRY_POINT;



/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
	
    // create window
    Window window = Platform.instance.createWindow("DlangUI example - HelloWorld", null);

    // create some widget to show in window
    window.mainWidget = (new Button()).text("Hello, world!"d).margins(Rect(20,20,20,20));

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}



//void main() {
//	writeln("Edit source/app.d to start your project.");
//	auto myVec = Vector3!double(1, 2, 3);
//	writeln(myVec);
//	
////	MonoTime start = MonoTime.currTime;
////	for(int i=0; i<100000; ++i)
////		writeln(myVec);
////	
////	MonoTime end = MonoTime.currTime;
////	Duration elapsed = end -start;
////	writeln(elapsed);
//}
