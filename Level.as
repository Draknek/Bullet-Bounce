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
		public var time:int = 0;
		
		public function Level ()
		{
			add(p1 = new Player(100, 100, 0, 0, true));
			add(p2 = new Player(540,380,0,0, false));
			add(link = new Link(p1, p2));
		}
		
		public override function update (): void
		{
			time++;
			time = time % 2300;
			
			switch(time) {
				case 30:
					add(new BeamSpam(320, 0,0,1));
					break;
				case 600:
					add(new BeamSpam(100, 0,0,1));
					add(new BeamSpam(620, 0,0,1));
					break;
				case 1200:
					add(new BeamSpam(0, 100, 1, 0));
					add(new BeamSpam(640, 380, -1, 0));
					break;
				case 1500:
					add(new CrossShooter(320, 480, 0, -1));
					break;
				case 2010:
					add(new CrossShooter(10, 10, 1, 1));
					break;
				case 2200:
					add(new CrossShooter(630, 470, -1, -1));
					break;
			}
			

			
			super.update();
			
			if (p1.stun > 0 && p2.stun > 0) {
				remove(p1);
				remove(p2);
				remove(link);
			}
		}
		
		public override function render (): void
		{
			super.render();
		}
	}
}

