package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.group.FlxTypedGroup;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var player:Player;
	var testEnemy:Enemy;
	var backdrop:Backdrop;
	var enemies = new FlxTypedGroup<Enemy>(20);
	var total_enemies = 0;
	var spawn_count = 0;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		player = new Player(0, 0);
		backdrop = new Backdrop();
		testEnemy= new Enemy(20,100);
		add(backdrop);
		add(player);
		add(testEnemy);
		add(enemies);
		FlxG.camera.follow(player);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		spawn_count++;
		if(spawn_count>100)
		{

    	enemies.add(new Enemy(Std.random(100),Std.random(100)));
    	spawn_count = 0;
		}
	}	
}