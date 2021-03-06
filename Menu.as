package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Menu extends World
	{
		public function Menu ()
		{
			Text.size = 32;
			
			var title:Text = new Text("Beautiful Bullet Bounce", 0, 0, {align:"center"});
			
			Text.size = 24;
			
			var oneMouse:Button = new Button(0, 0, new Text("One player (mouse)"), function ():void {
				FP.world = new Level(false, false);
			});
			var oneKeys:Button = new Button(0, 0, new Text("One player (arrows)"), function ():void {
				FP.world = new Level(false, true);
			});
			var two:Button = new Button(0, 0, new Text("Two player (WASD/arrows)"), function ():void {
				FP.world = new Level(true);
			});
			
			Text.size = 16;
			
			var credits:Text = new Text("Created by Alan Hazelden and William David Hunt");
			
			addElements([title, oneMouse, oneKeys, two, credits]);
		}
		
		private function addElements(list:Array):void
		{
			var h:int = 0;
			
			for each (var o:* in list) {
				if (! o) continue;
				h += o.height;
			}
			
			var start:int = 0;
			
			var padding:int = Number(FP.height - start - h) / (list.length + 1);
			
			var y:int = start + padding;
			
			for each (o in list) {
				if (! o) continue;
				o.x = (FP.width - o.width) * 0.5;
				o.y = y;
				
				if (o is Entity) add(o);
				else if (o is Graphic) addGraphic(o);
				
				y += padding + o.height;
			}
		}
		
		public override function update ():void
		{
			Input.mouseCursor = "auto";
			
			super.update();
		}
		
		public override function end (): void
		{
			Input.mouseCursor = "auto";
		}
	}
}

