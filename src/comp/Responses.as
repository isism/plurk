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
		
		public static function doGet(plurk_id:unit, from_response:int, callback:Function):void {
			PlurkBase.load(get,{plurk_id:plurk_id, from_response:from_response},callback);
		}
		public static function doResponseAdd(plurk_id:uint, content:String, qualifier:String, callback:Function):void {
			PlurkBase.load(responseAdd,{plurk_id: plurk_id, content: content, qualifier: qualifier},callback);
		}
		public static function doResponseDelete(response_id:uint, plurk_id:uint, callback:Function):void {
			PlurkBase.load(responseDelete,{response_id: response_id, plurk_id: plurk_id},callback);
		}
		public function Responses(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}