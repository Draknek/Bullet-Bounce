package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class MousePlayer extends Player
	{
		public function MousePlayer ()
		{
			super(Input.mouseX, Input.mouseY, 0, 0, true);
		}
		
		public override function update (): void
		{
			oldX = x;
			oldY = y;
			
			vx = Input.mouseX - x;
			vy = Input.mouseY - y;
			
			vx *= 0.6;
			vx *= 0.6;
			
			x += vx;
			y += vy;
		}
	}
}

