package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Blocks extends EventDispatcher
	{
		private static const get:String = "/API/Blocks/get"; 
		private static const block:String = "/API/Blocks/block";
		private static const  unblock:String = "/API/Blocks/unblock";
		
		/**
		 * 
		 * @param callback
		 * @param offset offset: What page should be shown, e.g. 0, 10, 20.
		 * 
		 */
		public static function doGet(callback:Function, offset:String=null):void {
			PlurkBase.load(get,{},callback);
		}
		
		/**
		 * 
		 * @param user_id user_id: The id of the user that should be blocked.
		 * @param callback
		 * 
		 */
		public static function doBlock(user_id:uint, callback:Function):void {
			PlurkBase.load(block,{user_id: user_id},callback);
		}
		
		/**
		 * 
		 * @param user_id user_id: The id of the user that should be unblocked.
		 * @param callback
		 * 
		 */
		public static function doUnBlock(user_id:uint, callback:Function):void {
			PlurkBase.load(unblock,{user_id: user_id},callback);
		}
		public function Blocks(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}