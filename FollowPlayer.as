package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class FollowPlayer extends Player
	{
		public var target:Player;
		
		public function FollowPlayer (p:Player, _x:Number = 0, _y:Number = 0)
		{
			super(_x, _y, 0, 0, false);
			
			target = p;
		}
		
		public override function update (): void
		{
			oldX = x;
			oldY = y;
			
			stun = Math.max(stun, target.stun);
			target.stun = stun;
			
			var dx:Number = target.x - x;
			var dy:Number = target.y - y;
			var dz:Number = FP.distance(dx, dy);
			dx /= dz;
			dy /= dz;
			
			vx += dx * 0.01 * (dz - 100);
			vy += dy * 0.01 * (dz - 100);
			
			vx *= 0.9;
			vy *= 0.9;
			
			x += vx;
			y += vy;
		}
	}
}

