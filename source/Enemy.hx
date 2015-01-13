package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * Class for handling Enemies. 
 */
class Enemy extends FlxSprite
{
	
	var speed:Float;

	public function new(x:Float, y:Float) 
	{
		super(x, y);
		speed = 5;
		loadGraphic(AssetPaths.enemy__png, true, 64, 64);
		animation.add("run", [0, 1, 2, 3,5,6,7,8,9],8, true);
		velocity.x = 0;
		velocity.y = 0;
		animation.play("run");
	}
	public function attack():Void
	{
		


	}
	override public function update():Void
	{
		super.update();
	}



}