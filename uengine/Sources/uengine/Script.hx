package uengine;

class Script {

    public var object: uengine.data.ObjectData;
    public var name:String = "";

    public function notifyOnUpdate(func: Void->Void) {
        App.notifyOnUpdate(func);
    }
    
}