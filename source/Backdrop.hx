package ;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class Backdrop extends FlxSprite
{

	public function new() 
	{
		super(0, 0);
		loadGraphic(AssetPaths.backdrop__jpg);
	}
	
}