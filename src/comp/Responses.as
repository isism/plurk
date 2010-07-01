package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Responses extends EventDispatcher
	{
		private static const get:String = "/API/Responses/get";
		private static const responseAdd:String = "/API/Responses/responseAdd";
		private static const responseDelete:String ="/API/Responses/responseDelete";
		
		/**
		 * 
		 * @param plurk_id plurk_id: The plurk that the responses belong to.
		 * @param from_response from_response: Only fetch responses from an offset - could be 5, 10 or 15.
		 * @param callback
		 * 
		 */
		public static function doGet(plurk_id:unit, from_response:int, callback:Function):void {
			PlurkBase.load(get,{plurk_id:plurk_id, from_response:from_response},callback);
		}
		/**
		 * 
		 * @param plurk_id plurk_id: The plurk that the responses should be added to.
		 * @param content content: The response's text.
		 * @param qualifier qualifier: The Plurk's qualifier, must be in English.
		 * @param callback
		 * 
		 */
		public static function doResponseAdd(plurk_id:uint, content:String, qualifier:String, callback:Function):void {
			PlurkBase.load(responseAdd,{plurk_id: plurk_id, content: content, qualifier: qualifier},callback);
		}
		/**
		 * 
		 * @param response_id response_id: The id of the response to delete.
		 * @param plurk_id plurk_id: The plurk that the response belongs to.
		 * @param callback
		 * 
		 */
		public static function doResponseDelete(response_id:uint, plurk_id:uint, callback:Function):void {
			PlurkBase.load(responseDelete,{response_id: response_id, plurk_id: plurk_id},callback);
		}
		/**
		 * 
		 * @param target
		 * 
		 */
		public function Responses(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}