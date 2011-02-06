package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author William David Hunt
	 */
	public class BeamSpam extends Enemy
	{
		
		[Embed(source = '../assets/enemy_32_1.png')]
		private const SPRITE:Class;
		
		private var angle:Number = 0;
		private var targetX:Number;
		private var targetY:Number;
		
		public function BeamSpam(_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0) 
		{
			super(_x, _y, _vx, _vy);
			image = new Image(SPRITE);
			image.centerOO();
			graphic = image;
		}
		
		override public function update():void 
		{	
			if (time % 150 == 120) { 
				if (Toolbox.randBool()) {
					targetX = Level(world).p1.x;
					targetY = Level(world).p1.y;
				} else {
					targetX = Level(world).p2.x;
					targetY = Level(world).p2.y;
				}
			} else if (time % 150 > 120 && time % 3 == 0) {
				shootAt(targetX, targetY);
			} else {
				x += vx;
				y += vy;
			}
			
			if (x < 0 || x > 640 || y < 0 || y > 480) {
				world.remove(this);
			}
			
			
			time += 1;
		}
		
	}

}