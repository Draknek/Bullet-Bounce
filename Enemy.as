package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Enemy extends Entity
	{
		[Embed(source='../assets/enemy_25_1.png')]
		private const SPRITE:Class;
		
		public var vx: Number = 0;
		public var vy: Number = 0;
		
		public var time:uint = 0;
		
		public var radius:Number = 16;
		protected var image:Image;

		protected var p1:Player;
		
		protected var p2:Player; 
		
		public function Enemy (_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0)
		{
			x = _x;
			y = _y;
			vx = _vx;
			vy = _vy;
			
			image = new Image(SPRITE);
			image.centerOO();
			
			graphic = image;
			
		}
		
		public function hit (b:Bullet): void
		{
			if (world) world.remove(this);
		}
		
		public override function update (): void
		{
			y = (15 * Math.cos(time * -1 * FP.RAD)) + 240 + (180 * Math.sin(time * 1.3 * FP.RAD));
			x = (15 * Math.sin(time * -1 * FP.RAD)) + 320 + (200 * Math.cos(time / 1.5 * FP.RAD));
			
			var a:Array = [];
			world.getClass(Player, a);
			
			time += 1;
			
			if (time % 40 == 0) {
				var p:Player = FP.choose(a);
				shootAt(p.x, p.y);
			}
		}
		
		public function shootAt (tx:Number, ty:Number):void
		{
			var dx:Number = tx - x;
			var dy:Number = ty - y;
			var dz:Number = Math.sqrt(dx*dx + dy*dy);
			
			dx /= dz;
			dy /= dz;
			
			var speed:Number = 4;
			
			world.add(new Bullet(x + dx*(radius+1), y + dy*(radius+1), dx*speed, dy*speed));
		}
	}
}

