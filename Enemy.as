package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Enemy extends Entity
	{
		public var vx: Number = 0;
		public var vy: Number = 0;
		
		public var time:uint = 0;
		
		public function Enemy (_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0)
		{
			x = _x;
			y = _y;
			vx = _vx;
			vy = _vy;
		}
		
		public override function update (): void
		{
			x += vx;
			y += vy;
			
			if (time % 240 == 0) {
				shootAt(100, 200);
			} else if (time % 240 == 120) {
				shootAt(440, 380);
			}
			time += 1;
			
		}
		
		public function shootAt (tx:Number, ty:Number):void
		{
			var dx:Number = tx - x;
			var dy:Number = ty - y;
			var dz:Number = Math.sqrt(dx*dx + dy*dy);
			
			dx *= 5/dz;
			dy *= 5/dz;
			
			world.add(new Bullet(x, y, dx, dy));
		}
		
		public override function render (): void
		{
			Draw.circlePlus(x, y, 10, 0xFF0000);
		}
	}
}

