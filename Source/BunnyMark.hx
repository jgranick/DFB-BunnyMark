package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import openfl.display.FPS;
import openfl.Assets;


@:bitmap("Outdoor_01.png") class Background extends BitmapData {}
@:bitmap("wabbit_alpha.png") class BunnyAsset extends BitmapData {}

class BunnyMark extends Sprite {
	
	
	public var bunnies:Array <BitmapBunny>;
	public var gravity:Float = 3;
	public var maxX:Int = 640;
	public var minX:Int = 0;
	public var maxY:Int = 480;
	public var minY:Int = 0;
	public var numBunnies:Int = 3000;
	
		
	public function new () {
		
		super ();
		
		graphics.beginBitmapFill (new Background (0, 0));
		graphics.drawRect (minX, minY, maxX - minX, maxY - minY);
		
		bunnies = new Array <BitmapBunny> ();
		var bunnyAsset = new BunnyAsset (0, 0);
		var bunny:BitmapBunny; 
		
		for (i in 0...numBunnies) {
			
			bunny = new BitmapBunny();
			bunny.bitmapData = bunnyAsset;
			bunny.speedX = Math.random() * 10;
			bunny.speedY = (Math.random() * 10) - 5;
			
			addChild(bunny);
			bunnies.push(bunny);
			
		}
		
		addChild (new FPS());
			
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
	}
	
	
	private function onEnterFrame (event:Event):Void {
		
		var bunny:BitmapBunny; 
		
		for (i in 0...numBunnies) {
			
			bunny = bunnies[i];
			bunny.x += bunny.speedX;
			bunny.y += bunny.speedY;
			bunny.speedY += gravity;
			
			if (bunny.x > maxX) {
				
				bunny.speedX *= -1;
				bunny.x = maxX;
				
			} else if (bunny.x < minX) {
				
				bunny.speedX *= -1;
				bunny.x = minX;
				
			}
			
			if (bunny.y > maxY) {
				
				bunny.speedY *= -0.8;
				bunny.y = maxY;
					
				if (Math.random () > 0.5) {
					
					bunny.speedY -= Math.random () * 12;
				}
				
			} else if (bunny.y < minY) {
				
				bunny.speedY = 0;
				bunny.y = minY;
				
			}
			
		}
		
	}
		
}