package rice2d;

class Assets {

    public static var images: Array<Map<String, kha.Image>> = [];
    public static var fonts: Array<Map<String, kha.Font>> = [];
    public static var sounds: Array<Map<String, kha.Sound>> = [];
    public static var blobs: Array<Map<String, kha.Blob>> = [];

    public static var imageDone:Bool = false;
    public static var fontDone:Bool = false;
    public static var soundDone:Bool = false;
    public static var blobDone:Bool = false;

    public static function getImage(imageRef:String) {
        var newImage:kha.Image = null;
        for (image in images){
            if(image.exists(imageRef)) newImage = image.get(imageRef);
        }
        return newImage;
    }

    public static function getFont(fontRef:String) {
        var newFont:kha.Font = null;
        for (font in fonts){
            if(font.exists(fontRef)) newFont = font.get(fontRef);
        }
        return newFont;
    }

    public static function getSound(soundRef:String) {
        var newSound:kha.Sound = null;
        for (sound in sounds){
            if(sound.exists(soundRef)) newSound = sound.get(soundRef);
        }
        return newSound;
    }

    public static function getBlob(blobRef:String) {
        var newBlob:kha.Blob = null;
        for (blob in blobs){
            if(blob.exists(blobRef)) newBlob = blob.get(blobRef);
        }
        return newBlob;
    }
    
    public static function loadImagesFromScene(imagesRef:Array<String>, done: Void->Void){
        for (image in imagesRef){
            kha.Assets.loadImageFromPath(image, true, function (img){
                images.push([image.split(".")[0] => img]);
                if(images.length == imagesRef.length){
                    imageDone = true;
                    done();
                }
            }, function (error){
                throw error + 'Can`t find image $image, make sure path is correct and image is in `Assets` folder';
            });
        }
    }

    public static function loadFontsFromScene(fontsRef:Array<String>, done:Void->Void){
        for (font in fontsRef){
            kha.Assets.loadFontFromPath(font, function (fnt){
                fonts.push([font.split(".")[0] => fnt]);
                if(fonts.length == fontsRef.length){
                    fontDone = true;
                    done();
                } 
            }, function (error){
                throw error + 'Can`t find font $font, make sure path is correct and font is in `Assets` folder';
            });
        }
    }

    public static function loadSoundsFromScene(soundsRef:Array<String>, done:Void->Void){
        if(soundsRef != null) for (sound in soundsRef){
            kha.Assets.loadSoundFromPath(sound, function (snd){
                sounds.push([sound.split(".")[0] => snd]);
                if(sounds.length == soundsRef.length){
                    soundDone = true;
                    done();
                }
            }, function (error){
                throw error + 'Can`t find sound $sound, make sure path is correct and sound is in `Assets` folder';
            });
        }
    }

    public static function loadBlobsFromScene(blobsRef:Array<String>, done:Void->Void){
        if(blobsRef != null) for (blob in blobsRef){
            kha.Assets.loadBlobFromPath(blob, function (blb){
                blobs.push([blob.split(".")[0] => blb]);
                if(blobs.length == blobsRef.length){
                    blobDone = true;
                    done();
                }
            }, function (error){
                throw error + 'Can`t find blob $blob, make sure path is correct and blob is in `Assets` folder';
            });
        }
    }
}