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
		
		public var twoPlayer:Boolean;
		public var keyboard:Boolean;
		
		public var gameOver:Boolean = false;
		
		public function Level (twoPlayer:Boolean = true, keyboard:Boolean = true)
		{
			this.twoPlayer = twoPlayer;
			this.keyboard = keyboard;
			
			if (twoPlayer) {
				add(p1 = new KeyboardPlayer(100, 100, 0, 0, false));
				add(p2 = new KeyboardPlayer(540,380,0,0, true));
			} else {
				if (keyboard) {
					add(p1 = new KeyboardPlayer(320, 300, 0, 0, true));
				} else {
					add(p1 = new MousePlayer());
				}
				
				add(p2 = new FollowPlayer(p1, 320,240));
			}
			
			add(link = new Link(p1, p2));
		}
		
		public override function update (): void
		{
			if (Input.pressed(Key.ESCAPE)) FP.world = new Menu;
			if (Input.pressed(Key.R)) FP.world = new Level(twoPlayer, keyboard);
			
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
			
			if (!gameOver && p1.stun > 0 && p2.stun > 0) {
				Audio.play("playerdie");
				
				gameOver = true;
				
				remove(p1);
				remove(p2);
				remove(link);
				
				var resetText:Text = new Text("Game over\n\nPress R to reset\n\nEsc for main menu", 320, 240, {size: 24, align:"center"});
				
				resetText.centerOO();
				
				addGraphic(resetText, -50);
			}
		}
		
		public override function render (): void
		{
			super.render();
		}
	}
}

