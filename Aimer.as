package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author William David Hunt
	 */
	public class Aimer extends Enemy
	{
		[Embed(source = 'assets/enemy_32_3.png')]
		private const SPRITE:Class;
		
		public function Aimer(_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0) 
		{
			super(_x, _y, _vx, _vy);
			image = new Image(SPRITE);
			image.centerOO();
			graphic = image;
		}
		
		override public function update():void 
		{
			x += vx;
			y += vy;
			
			var p1:Player = Level(world).p1;
			var p2:Player = Level(world).p2;
			
			if (time % 150 == 0) {
				shootAt(p1.x, p1.y);
				shootAt(p2.x, p2.y);
			}
			
			time += 1;
		}
		
	}

}