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
		
		public var bullets:Array = [];
		
		public function Link (_p1:Player, _p2:Player)
		{
			p1 = _p1;
			p2 = _p2;
			
			layer = -11;
		}
		
		public override function update (): void
		{
			x = (p1.x + p2.x)*0.5;
			y = (p1.y + p2.y)*0.5;
			
			var b:Bullet;
			
			var a:Array = [];

			world.getClass(Bullet, a);
			
			for each (b in a) {
				catchTest(b);
				//mirrorTest(b);
			}
			
			var dx:Number = p2.x - p1.x;
			var dy:Number = p2.y - p1.y;
			var dz:Number = FP.distance(dx, dy);
			
			dx /= dz;
			dy /= dz;
			
			var speed:Number = 5;
			
			var vx:Number = -dy * speed;
			var vy:Number = dx * speed;
			
			for (var i:int = 0; i < bullets.length; i++) {
				b = bullets[i];
				b.vx -= 1;
				
				if (b.vx < 0) {
					b.vx = vx * b.x;
					b.vy = vy * b.x;
				
					var t:Number = b.y;
				
					b.x = b.oldX = FP.lerp(p1.x, p2.x, t) + b.vx;
					b.y = b.oldY = FP.lerp(p1.y, p2.y, t) + b.vy;
				
					world.add(b);
					
					bullets.splice(i, 1);
					
					i--;
				}
			}
		}
		
		private function catchTest (b:Bullet): void
		{
			var now:Number = Line.Signed2DTriArea(p1.x, p1.y, p2.x, p2.y, b.x, b.y);
			var then:Number = Line.Signed2DTriArea(p1.oldX, p1.oldY, p2.oldX, p2.oldY, b.oldX, b.oldY);
			
			now = (now < 0) ? -1 : 1;
			then = (then < 0) ? -1 : 1;
			
			var dx:Number = p2.x - p1.x;
			var dy:Number = p2.y - p1.y;
			var dzSq:Number = dx*dx + dy*dy;
			
			var t:Number = dx * (b.x - p1.x) + dy * (b.y - p1.y);
			
			if (t < 0 || t > dzSq) {
				return;
			}
			
			if (now != then) {
				world.remove(b);
				
				b.x = then;
				b.y = t / dzSq;
				b.vx = 10;
				
				bullets.push(b);
			}
		}
		
		private function mirrorTest (b:Bullet): Boolean
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
			
			for each (var b:Bullet in bullets) {
				var t:Number = b.y;
				
				var x:Number = FP.lerp(p1.x, p2.x, t);
				var y:Number = FP.lerp(p1.y, p2.y, t);
				
				Draw.circlePlus(x, y, 2, 0xFF0000);
			}
		}
	}
}

