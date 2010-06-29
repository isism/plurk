package comp
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	
	public class Realtime extends EventDispatcher
	{	
		private static const getUserChannel:String = "/API/Realtime/getUserChannel";
		
		public static function doGetUserChannel(callback:Function):void {
			PlurkBase.load(getUserChannel,{},callback);
		}
		
		public function Realtime(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}