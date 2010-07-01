package comp
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Emoticons extends EventDispatcher
	{	
		import comp.PlurkBase;
		
		private static const get:String = "/API/Emoticons/get";
		
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doGet(callback:Function):void {
			PlurkBase.load(get,{},callback);
		}
		
		
		public function Emoticons(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}