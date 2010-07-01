package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Polling extends EventDispatcher
	{
		private static const getPlurks:String="/API/Polling/getPlurks";
		private static const getUnreadCount:String="/API/Polling/getUnreadCount";
		
		/**
		 * 
		 * @param offset offset: Return plurks newer than offset, formatted as 2009-6-20T21:55:34.
		 * @param callback
		 * @param limit limit: The max number of plurks to be returned (default 50).
		 * 
		 */
		public static function doGetPlurks(offset:String,callback:Function,limit:String=null):void{
//		public static function doGetPlurks(offset:String,callback:Function,limit:uint=NaN):void{
			PlurkBase.load(getPlurks,{offset:offset,limit:limit},callback);
		}
		/**
		 * 
		 * @param callback
		 * 
		 */
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