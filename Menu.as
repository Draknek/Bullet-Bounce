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
			
			var title:Text = new Text("Untitled reflecting shooter thing\n\n(definitely not going to let this\nbe a final title no way)", 0, 0, {align:"center"});
			
			Text.size = 24;
			
			var two:Button = new Button(0, 0, new Text("Start"), function ():void {
				FP.world = new Level(true);
			});
			
			addElements([title, two]);
		}
		
		private function addElements(list:Array):void
		{
			var h:int = 0;
			
			for each (var o:* in list) {
				if (! o) continue;
				h += o.height;
			}
			
			var start:int = 50;
			
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

