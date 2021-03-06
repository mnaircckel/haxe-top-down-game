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
	
	var spawnTimer = 0;
	var enemies = new FlxTypedGroup<Enemy>(10);//can hold 10 enemies
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{	
		player = new Player(600, 600);
		backdrop = new Backdrop();
		add(backdrop);
		add(player);
		add(enemies);
		FlxG.camera.follow(player);
		FlxG.camera.setBounds(0,0,backdrop.width,backdrop.height);
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
		FlxG.collide(enemies, enemies); // Collide with each other? Doesn't seem to work
		player.setIsColliding(FlxG.collide(player, enemies));

		spawnTimer++;
		if(spawnTimer > 100)
		{
			enemies.add(new Enemy(Std.random(500),Std.random(500),player));
			spawnTimer = 0;
		}
	}	
}