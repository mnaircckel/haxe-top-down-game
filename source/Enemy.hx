package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import Math;

/**
 * Class for handling Enemies. 
 */
class Enemy extends FlxSprite
{
	var idle = true;
	var playingRun = true;
	var playingAttack=false;
	var speed:Float;
	
	var attacking = false;
	var target:FlxSprite;
	var walkCount=0;
	var distance:Float;

	//the x and y distance to the target. 
	var deltaX:Float;
	var deltaY:Float;
	var theta:Float;

	public function new(x:Float, y:Float,targ:FlxSprite) 
	{
		super(x, y);
		target = targ;
		speed = 5;
		loadGraphic(AssetPaths.enemy__png, true, 64, 64);
		animation.add("run", [3, 4, 5, 6],8, true);
		animation.add("death", [2],1, true);
		animation.add("attack", [0,1,3,5],14, true);
		velocity.x = 0;
		velocity.y = 0;
		animation.play("run");
		//change the hitbox
		width = 35;
		height = 50;
		offset.x = 7;
	}
	private function calculateTargetDistance():Void
	{
		deltaX= target.x -x;
		deltaY= target.y -y;
		distance = Math.sqrt((deltaX*deltaX)+(deltaY*deltaY));

	}
	public function movement():Void
	{

		if(distance<250)
			idle = false;
		else{
			idle = true;
			
		}

		//move in a shitty square. feel free to change. 
		if(idle)
		{

			walkCount++;
			if(walkCount<50){
				velocity.x = 1;
				velocity.y=0;
				angle = 270;
			}
			else if(walkCount>=50 && walkCount<100){
				velocity.x = 0;
				velocity.y = 1;
				angle = 360;
			}
			else if(walkCount>=100 && walkCount <150){
				velocity.x = -1;
				velocity.y = 0;
				angle  = 90;
			}
			else if(walkCount>=150 && walkCount < 200){
				velocity.x = 0;
				velocity.y = -1;
				angle = 180;
			}
			else if(walkCount>=200)
				walkCount = 0;
		}
		else //if it is close then attack. 
		{		
			//make into unit vector so we can move towards target
			if(distance<75 && !playingAttack){
				animation.play("attack");
				playingAttack=true;
				playingRun=false;
			}
			if(distance>75 && !playingRun){
					animation.play("run");
					playingRun=true;
					playingAttack=false;
				}

			deltaX/=distance; 
			deltaY/=distance;
			
			//calculate rotation
			theta = (Math.acos(deltaY) *(180/Math.PI));
			if(deltaX>0)
				theta*=-1;

			angle=theta;
			//trace(deltaX);
			velocity.x= deltaX;
			velocity.y = deltaY;
		}

		x += velocity.x;
		y += velocity.y;

	}
	override public function update():Void
	{
		calculateTargetDistance();
		movement();
		super.update();
	}



}