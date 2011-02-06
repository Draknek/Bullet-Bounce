package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Link extends Entity
	{
		public var p1:Player;
		public var p2:Player;
		
		public function Link (_p1:Player, _p2:Player)
		{
			p1 = _p1;
			p2 = _p2;
			
			layer = -9;
		}
		
		public override function update (): void
		{
			x = (p1.x + p2.x)*0.5;
			y = (p1.y + p2.y)*0.5;
			
			var a:Array = [];
			
			world.getClass(Bullet, a);
			
			for each (var b:Bullet in a) {
				// TODO: magic
			}
		}
		
		private function test (b:Bullet): Boolean
		{
			var contact:LineIntersection = new LineIntersection();
			
			var movement: Line = new Line(b.oldX, b.oldY, b.x, b.y);
			var barrier: Line = new Line(p1.x, p1.y, p2.x, p2.y);
			
			var hit: Boolean = false;
			
			var r:Number = 4;
			
			if (r > 0)
			{
				hit = Line.intersectsR(movement, barrier, r, contact);
			}
			else
			{
				hit = Line.intersects(movement, barrier, contact);
			}
			
			if (hit)
			{
				b.x = b.oldX = contact.x;
				b.y = b.oldY = contact.y;
				
				var nx: Number = p2.y - p1.y;
				var ny: Number = p1.x - p2.x;
				
				var nz: Number = Math.sqrt(nx*nx + ny*ny);
				
				nx /= nz;
				ny /= nz;
				
				var speed: Number = b.vx*nx + b.vy*ny;
				
				b.vx -= 2 * nx * speed;
				b.vy -= 2 * ny * speed;
				
				b.x += (1 - contact.t) * b.vx;
				b.y += (1 - contact.t) * b.vy;
				
				return true;
			}
			
			return false;
		}
		
		public override function render (): void
		{
			Draw.linePlus(p1.x, p1.y, p2.x, p2.y, 0xFFFFFF);
		}
	}
}

