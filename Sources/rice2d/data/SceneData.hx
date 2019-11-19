package rice2d.data;

typedef SceneData = {
    public var name: String;
    public var objects: Array<ObjectData>;
    public var assets: AssetData;
    @:optional public var scripts: Array<String>;
    @:optional public var physicsWorld: echo.data.Options.WorldOptions;
    @:optional public var canvasRef: String;
}
