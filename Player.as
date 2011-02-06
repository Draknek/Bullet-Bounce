package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Player extends Entity
	{
		[Embed(source='../assets/p1.png')]
		private const P1_IMAGE:Class;

		[Embed(source='../assets/p2.png')]
		private const P2_IMAGE:Class;
		
		public var vx: Number = 0;
		public var vy: Number = 0;
		public var arrowKeys:Boolean;
		
		private var upKey:int;
		private var downKey:int;
		private var leftKey:int;
		private var rightKey:int;
		
		private var image:Image;
		
		private const SPEED:Number = 3;
		
		public function Player (_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0, _arrowKeys:Boolean = true )
		{
			x = _x;
			y = _y;
			vx = _vx;
			vy = _vy;
			
			layer = -10;
			
			arrowKeys = _arrowKeys;
			
			if (arrowKeys) {
					upKey = Key.UP;
					downKey = Key.DOWN;
					leftKey = Key.LEFT;
					rightKey = Key.RIGHT;
			} else {
					upKey = Key.W;
					downKey = Key.S;
					leftKey = Key.A;
					rightKey = Key.D;				
			}
			
			if (_arrowKeys) {
				image = new Image(P1_IMAGE);
			} else {
				image = new Image(P2_IMAGE);
			}
			
			image.centerOO();
			graphic = image;
		}
		
		public override function update (): void
		{
			if (Input.check(upKey)) {
				vy = -SPEED;
			} else if (Input.check(downKey)) {
				vy = SPEED;
			} else {
				vy = 0;
			}
			
			if (Input.check(leftKey)) {
				vx = -SPEED;
			} else if (Input.check(rightKey)) {
				vx = SPEED;
			} else {
				vx = 0;
			}
			
			x += vx;
			y += vy;
		}
		
		//public override function render (): void
		//{
			//Draw.circlePlus(x, y, 20, 0x0000FF);
		//}
	}
}

