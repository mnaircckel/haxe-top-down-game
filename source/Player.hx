package ;

import flixel.FlxSprite;
import flixel.FlxG;
import Math;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	
	var speed:Float;
	
	public function new(x:Float=0, y:Float) 
	{
		super(x, y);
		makeGraphic(16, 16);
		speed = 5;
		
	}
	
	public function movement() 
	{
		if (FlxG.keys.pressed.A) {
			velocity.x = -speed;
		}
		else if (FlxG.keys.pressed.D) {
			velocity.x = speed;
		}
		else {
			velocity.x = 0;
		}
		
		if (FlxG.keys.pressed.W) {
			velocity.y = -speed;
		}
		else if (FlxG.keys.pressed.S) {
			velocity.y = speed;
		}
		else {
			velocity.y = 0;
		}
		
		if ( (FlxG.keys.pressed.A || FlxG.keys.pressed.D) && (FlxG.keys.pressed.W ||FlxG.keys.pressed.S) ) {
			velocity.x /= Math.sqrt(speed * speed * 2);
			velocity.y /= Math.sqrt(speed * speed * 2);
			velocity.x *= speed;
			velocity.y *= speed;
		}
		
		x += velocity.x;
		y += velocity.y;
		
	}
	
	override public function update()
	{
		movement();
	}
	
}