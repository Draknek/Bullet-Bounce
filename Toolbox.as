package  
{
	import flash.geom.Point;

	/**
	 * ...
	 * @author William David Hunt
	 */
	public class Toolbox
	{

		public static function randBool(pcent:Number = 50):Boolean {
			if (Toolbox.randInt(0, 100) >= pcent) {
				return true;
			}
			return false;
		}
		
		public static function movePoint(startX:Number, startY:Number, dAngle:Number, distance:Number):Array {
			var rAngle:Number = (dAngle * (Math.PI / 180)); //conversangle from degrees into radians
			var result:Array = [startX,startY];
			result[0] += Math.cos(rAngle) * distance; 
			result[1] -= Math.sin(rAngle) * distance;
			return result;
		}
		
		public static function randInt(start:Number, end:Number):int {
			var rand:Number = Math.floor(Math.random() * (end - start) );
			return int(rand) + start;
		}
		
		public static function randFloat(start:Number, end:Number):int {
			var rand:Number = Math.random() * (end - start);
			return int(rand) + start;
		}
		
		public static function getDistanceNumbers(x1:Number,y1:Number,x2:Number,y2:Number):Number {
			return Math.sqrt( Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2) );
		}
				
		public static function doNowt(...whatever):void {
			//Does fuck all
		}
	}

}