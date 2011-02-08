package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Player extends Entity
	{
		[Embed(source='../assets/p1.png')]
		public const P1_IMAGE:Class;

		[Embed(source='../assets/p2.png')]
		public const P2_IMAGE:Class;
		
		public var vx: Number = 0;
		public var vy: Number = 0;
		
		public var image:Image;
		
		public var radius:Number = 8;
		
		public var oldX:Number = 0;
		public var oldY:Number = 0;
		
		public var stun:Number = 0;
		
		public function Player (_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0, _p1:Boolean = true )
		{
			x = _x;
			y = _y;
			vx = _vx;
			vy = _vy;
			
			oldX = 0;
			oldY = 0;
			
			layer = -10;
			
			if (_p1) {
				image = new Image(P1_IMAGE);
			} else {
				image = new Image(P2_IMAGE);
			}
			
			image.centerOO();
			graphic = image;
		}
		
		public function hit (b:Bullet): void
		{
			if (stun <= 0) {
				stun = 120;
			}
		}
	}
}

