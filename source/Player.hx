package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

import Math;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	
	var speed:Float;
	var playerFriction:Float;
	var aimAngle:Float;
	public function new(x:Float, y:Float) 
	{
		super(x, y);
		loadGraphic(AssetPaths.doctor__png,true,64,64);
		speed = .20;
		playerFriction = .030;
		animation.add("right", [0,1,2],8,true);
		animation.play("right");
		
	
	}
	
	public function movement() 
	{
		if (FlxG.keys.pressed.A) {
			acceleration.x = -speed;
		}
		else if (FlxG.keys.pressed.D) {
			acceleration.x = speed;
		}
		else {
			acceleration.x = 0;
			velocity.x /= 1.1;
		}
		
		if (FlxG.keys.pressed.W) {
			acceleration.y = -speed;
		}
		else if (FlxG.keys.pressed.S) {
			acceleration.y = speed;
		}
		else {
			acceleration.y = 0;
			velocity.y /= 1.1;
		}
		
		if ( (FlxG.keys.pressed.A || FlxG.keys.pressed.D) && 
			(FlxG.keys.pressed.W ||FlxG.keys.pressed.S) ) {
			acceleration.x /= Math.sqrt(speed * speed * 2);
			acceleration.y /= Math.sqrt(speed * speed * 2);
			acceleration.x *= speed;
			acceleration.y *= speed;
		}
		
		var deltaX = FlxG.mouse.getScreenPosition().x - FlxG.width/2;
		var deltaY = FlxG.mouse.getScreenPosition().y - FlxG.height/2;
		var newAngle = Math.atan(Math.abs(deltaY) / Math.abs(deltaX)) * (180 / Math.PI);
		if (deltaX > 0 && deltaY > 0) {
			angle = newAngle+90;
		}
		else if (deltaX > 0 && deltaY > 0) {
			angle = -newAngle+90;
		}
		else if (deltaX > 0 && deltaY < 0) {
			angle = -newAngle+90;
		}
		else if (deltaX < 0 && deltaY < 0) {
			angle = newAngle-90;
		}
		else if (deltaX < 0 && deltaY > 0) {
			angle = -newAngle-90;
		}
			
		
			
		velocity.x += acceleration.x - playerFriction*velocity.x;
		velocity.y += acceleration.y - playerFriction*velocity.y;
		x += velocity.x;
		y += velocity.y;
		
	}
	
	override public function update():Void
	{

		movement();
		super.update();
	}
	
}