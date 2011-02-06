package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Bullet extends Entity
	{
		public var vx: Number = 0;
		public var vy: Number = 0;
		
		public var oldX:Number = 0;
		public var oldY:Number = 0;
		
		public function Bullet (_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0)
		{
			x = _x;
			y = _y;
			vx = _vx;
			vy = _vy;
			
			oldX = x;
			oldY = y;
			
			layer = -15;
		}
		
		public override function update (): void
		{
			oldX = x;
			oldY = y;
			
			x += vx;
			y += vy;
		}
		
		public override function render (): void
		{
			Draw.linePlus(x, y, x - vx, y - vy, 0xFF0000, 1, 4);
		}
	}
}
