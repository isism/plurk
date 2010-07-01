package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Polling extends EventDispatcher
	{
		private static const getPlurks:String="/API/Polling/getPlurks";
		private static const getUnreadCount:String="/API/Polling/getUnreadCount";
		
		public static function doGetPlurks(offset:String,callback:Function,limit:String=null):void{
//		public static function doGetPlurks(offset:String,callback:Function,limit:uint=NaN):void{
			PlurkBase.load(getPlurks,{offset:offset,limit:limit},callback);
		}
		public static function doGetUnreadCount(callback:Function):void{
			PlurkBase.load(getUnreadCount,{},callback);
		}
		public function Polling(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}