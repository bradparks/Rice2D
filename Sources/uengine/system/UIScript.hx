package uengine.system;

#if u_ui
    import zui.Canvas.TCanvas;
    import zui.Canvas.TElement;
#end

class UIScript {

    #if u_ui

    public static function addElement(canvasRef: String, elem:TElement) {
        var canvas = getCanvas(canvasRef);
        canvas.elements.push(elem);
    }

    public static function addCanvas(canvas:TCanvas) {
        Scene.canvases.push(canvas);
    }

    public static function getCanvas(name:String): TCanvas {
        var canvas:TCanvas = null;
        for (canva in Scene.canvases) if (canva.name == name) canvas = canva;
        return canvas;
    }
    
    public static function getElement(canvasRef:String, name:String): TElement {
        var element:TElement = null;
        var canvas = getCanvas(canvasRef);
        for (elem in canvas.elements) if(elem.name == name) element = elem;
        return element;
    }

    public static function setCanvasVisibility(canvasRef: String, visible:Bool) {
        var canvas = getCanvas(canvasRef);
        for (elem in canvas.elements) elem.visible = visible;
    }

    #end
}
