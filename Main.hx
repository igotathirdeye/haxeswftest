// instead of using flash.*, we use openfl.* so the code compiles to WASM and Adobe Flash Player
import openfl.Lib;
import openfl.display.Shape;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

class Main {
    static var shape:Shape;

    // what.
    static var keysPressed:Map<Int, Bool> = new Map<Int, Bool>();

    static function main() {
        var stage = Lib.current.stage;

        // create a center aligned rounded gray square
        shape = new Shape();
        shape.graphics.beginFill(0x333333);
        shape.graphics.drawRoundRect(0, 0, 100, 100, 10);
        shape.x = (stage.stageWidth - 100) / 2;
        shape.y = (stage.stageHeight - 100) / 2;

        stage.addChild(shape);

        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
    
        stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    static function onKeyDown(event:KeyboardEvent):Void {
        keysPressed.set(event.keyCode, true);
    }

    static function onKeyUp(event:KeyboardEvent):Void {
        keysPressed.set(event.keyCode, false);
    }

    static function onEnterFrame(event:Event):Void {
        var speed = 5;
        var dx = 0.0;
        var dy = 0.0;

        if (keysPressed.get(Keyboard.LEFT)) dx = -1;
        if (keysPressed.get(Keyboard.RIGHT)) dx = 1;
        if (keysPressed.get(Keyboard.UP)) dy = -1;
        if (keysPressed.get(Keyboard.DOWN)) dy = 1;

        if (dx != 0 || dy != 0) {
            // math
            var len = Math.sqrt(dx*dx+dy*dy);

            dx = (dx / len) * speed;
            dy = (dy / len) * speed;

            shape.x += dx;
            shape.y += dy;
        }
    }
}