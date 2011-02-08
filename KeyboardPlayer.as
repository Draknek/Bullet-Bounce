package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class KeyboardPlayer extends Player
	{
		public var arrowKeys:Boolean;
		
		private var upKey:int;
		private var downKey:int;
		private var leftKey:int;
		private var rightKey:int;
		
		public function KeyboardPlayer (_x:Number = 0, _y:Number = 0, _vx:Number = 0, _vy:Number = 0, _arrowKeys:Boolean = true )
		{
			super(_x, _y, _vx, _vy, _arrowKeys);
			
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
			oldX = x;
			oldY = y;
			
			if (stun > 0) {
				Image(graphic).alpha = (stun % 30 < 15) ? 0.5 : 1.0;
				
				stun--;
				return;
			}
			
			Image(graphic).alpha = 1.0;
			
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
	}
}

