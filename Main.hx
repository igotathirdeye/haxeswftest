// instead of using flash.*, we use openfl.* so the code compiles to WASM and Adobe Flash Player
import openfl.Lib;
import openfl.display.Shape;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

class Main {
    static var player1:Shape;
    static var player2:Shape;

    // what.
    static var keysPressed:Map<Int, Bool> = new Map<Int, Bool>();

    static var lastTime:Float = 0;

    static function main() {
        var stage = Lib.current.stage;

        // create a center aligned rounded gray square
        player1 = new Shape();
        player1.graphics.beginFill(0xAA0000);
        player1.graphics.drawRoundRect(0, 0, 100, 100, 10);
        player1.x = (stage.stageWidth - 100) / 3;
        player1.y = (stage.stageHeight - 100) / 3 * 2;

        player2 = new Shape();
        player2.graphics.beginFill(0x0000AA);
        player2.graphics.drawRoundRect(0, 0, 100, 100, 10);
        player2.x = (stage.stageWidth - 100) / 3 * 2;
        player2.y = (stage.stageHeight - 100) / 3;

        stage.addChild(player1);
        stage.addChild(player2);

        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        
        lastTime = Lib.getTimer();
        stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    static function onKeyDown(event:KeyboardEvent):Void {
        keysPressed.set(event.keyCode, true);
    }

    static function onKeyUp(event:KeyboardEvent):Void {
        keysPressed.set(event.keyCode, false);
    }

    static function onEnterFrame(event:Event):Void {
        var curTime = Lib.getTimer();
        var dt = (curTime - lastTime) / 1000.0;
        lastTime = curTime;
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

            dx = (dx / len) * speed * dt * 60;
            dy = (dy / len) * speed * dt * 60;

            player2.x += dx;
            player2.y += dy;
        }

        dx = 0.0;
        dy = 0.0;

        if (keysPressed.get(Keyboard.A)) dx = -1;
        if (keysPressed.get(Keyboard.D)) dx = 1;
        if (keysPressed.get(Keyboard.W)) dy = -1;
        if (keysPressed.get(Keyboard.S)) dy = 1;

        if (dx != 0 || dy != 0) {
            // math
            var len = Math.sqrt(dx*dx+dy*dy);

            dx = (dx / len) * speed * dt * 60;
            dy = (dy / len) * speed * dt * 60;

            player1.x += dx;
            player1.y += dy;
        }
    }
}
