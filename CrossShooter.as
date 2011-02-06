package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author William David Hunt
	 */
	public class CrossShooter extends Enemy
	{
		
		[Embed(source = '../assets/enemy_32_2.png')]
		private const SPRITE:Class;
		
		private var angle:Number = 0;
		
		private var dvx:Number;
		private var dvy:Number;
		
		public function CrossShooter(_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0) 
		{
			super(_x, _y, _vx, _vy);
			image = new Image(SPRITE);
			image.centerOO();
			graphic = image;
			
			dvx = _vx;
			dvy = _vy;
		}
		
		override public function update():void 
		{
			x += vx;
			y += vy;
			
			angle += 1;
			angle = angle % 360;
			
			var pos:Array = Toolbox.movePoint(0, 0, angle, 1);
			vx = pos[0] + dvx;
			vy = pos[1] + dvy;
			
			if (time % 60 == 0 && time % 120 != 0 ) {
				shootAt(x + 100, y + 100);
				shootAt(x - 100, y - 100);
				shootAt(x - 100, y + 100);
				shootAt(x + 100, y - 100);
			} else if ( time % 120 == 0) {
				shootAt(x + 100, y);
				shootAt(x - 100, y);
				shootAt(x, y + 100);
				shootAt(x, y - 100);			
			}
			
			if (x < 0 || x > 640 || y < 0 || y > 480) {
				world.remove(this);
			}
			
			
			time += 1;
		}
		
	}

}