package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author William David Hunt
	 */
	public class Rotating extends Enemy
	{
		
		[Embed(source = '../assets/enemy_32_3.png')]
		private const SPRITE:Class;
		
		private var angle:Number = 0;
		
		public function Rotating(_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0) 
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
			
			angle += 1;
			angle = angle % 360;
			
			var pos:Array = Toolbox.movePoint(0, 0, angle, 0.5);
			vx = pos[0];
			vy = pos[1];
			
			if (time % 45 == 0 ) {
				shootAt(x - pos[0], y - pos[1]);
			}
			
			time += 1;
		}
		
	}

}