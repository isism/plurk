package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Search extends EventDispatcher
	{
		private static const PlurkSearch:String = "/API/PlurkSearch/search";
		private static const UserSearch:String = "/API/UserSearch/search";
		
		/**
		 * 
		 * @param query The query after Plurks.
		 * @param callback
		 * @param offset offset: A plurk_id of the oldest Plurk in the last search result.
		 * 
		 */
		public static function doPlurkSearch(query:String, callback:Function, offset:String=null):void {
			PlurkBase.load(PlurkSearch,{query: query, offset: offset},callback);			
		}
		/**
		 * 
		 * @param query query: The query after users.
		 * @param callback
		 * @param offset offset: Page offset, like 10, 20, 30 etc.
		 * 
		 */
		public static function doUserSearch(query:String, callback:Function, offset:String=null):void {
			PlurkBase.load(UserSearch,{query: query, offset: offset},callback);			
		}
		
		public function Search(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}