package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Level extends World
	{
		public function Level ()
		{
			add(new Player(300, 300, 0, 0, true));
			add(new Player(400,400,0,0, false));
		}
		
		public override function update (): void
		{
			super.update();
		}
		
		public override function render (): void
		{
			super.render();
		}
	}
}

