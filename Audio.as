package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.SharedObject;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import net.flashpunk.utils.Key;
	
	public class Audio
	{
		private static var sounds:Object = {}
		
		private static var _mute:Boolean = false;
		private static var so:SharedObject;
		private static var menuItem:ContextMenuItem;
		
		public static function init (o:InteractiveObject):void
		{
			// Setup
			
			so = SharedObject.getLocal("audio", "/");
			
			_mute = so.data.mute;
			
			addContextMenu(o);
			
			if (o.stage) {
				addKeyListener(o.stage);
			} else {
				o.addEventListener(Event.ADDED_TO_STAGE, stageAdd);
			}
			
			// Create sounds
			
			createSound("bounce", "2,,0.28,0.141,0.092,0.78,0.071,-0.469,,,,,,0.043,0.118,,,,1,,,0.112,,0.5");
			createSound("explode", "3,,0.147,0.426,0.52,0.14,,0.199,-0.26,,,,,,,0.304,0.173,-0.177,1,,,,,0.5");
			createSound("playerdie", "3,,0.332,0.39,0.67,0.07,,-0.099,-0.28,,,0.439,0.57,,,0.344,-0.089,-0.018,1,,,,,0.5");
			createSound("playerhit", "3,,0.03,,0.219,0.579,,-0.473,,,,,,,,,,,1,,,0.006,,0.5");
			createSound("beamspam", "0,0.1,0.317,0.032,0.337,0.519,,0.008,,,0.035,0.899,,0.35,-0.88,0.763,0.098,-0.307,0.865,0.16,0.227,0.27,-0.937,0.5");
			createSound("crossshooter", "0,,0.287,0.231,0.152,0.74,0.351,-0.308,-0.032,,,-0.047,,0.471,-0.519,,-0.033,-0.185,1,0.049,0.001,0.043,0.069,0.5");
		}
		
		private static function createSound (name:String, settings:String):SfxrSynth
		{
			sounds[name] = new SfxrSynth;
			sounds[name].setSettingsString(settings);
			sounds[name].cacheMutations(4);
			return sounds[name];
		}
		
		public static function play (sound:String):void
		{
			if (! _mute) {
				sounds[sound].playCachedMutation();
			}
		}
		
		// Getter and setter for mute property
		
		public static function get mute (): Boolean { return _mute; }
		
		public static function set mute (newValue:Boolean): void
		{
			if (_mute == newValue) return;
			
			_mute = newValue;
			
			menuItem.caption = _mute ? "Unmute" : "Mute";
			
			so.data.mute = _mute;
			so.flush();
		}
		
		// Implementation details
		
		private static function stageAdd (e:Event):void
		{
			addKeyListener(e.target.stage);
		}
		
		private static function addContextMenu (o:InteractiveObject):void
		{
			var menu:ContextMenu = o.contextMenu || new ContextMenu;
			
			menu.hideBuiltInItems();
			
			menuItem = new ContextMenuItem(_mute ? "Unmute" : "Mute");
			
			menuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, menuListener);
			
			menu.customItems.push(menuItem);
			
			o.contextMenu = menu;
		}
		
		private static function addKeyListener (stage:Stage):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyListener);
		}
		
		private static function keyListener (e:KeyboardEvent):void
		{
			if (e.keyCode == Key.M) {
				mute = ! mute;
			}
		}
		
		private static function menuListener (e:ContextMenuEvent):void
		{
			mute = ! mute;
		}
	}
}

