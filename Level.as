package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Level extends World
	{
		public var p1:Player;
		public var p2:Player;
		public var link:Link;
		
		public function Level ()
		{
			add(p1 = new Player(100, 100));
			add(p2 = new Player(540, 380));
			add(link = new Link(p1, p2));
			
			add(new Enemy(430, 160));
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

