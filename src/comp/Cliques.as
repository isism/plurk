package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Cliques extends EventDispatcher
	{
		private static const getCliques:String = "/API/Cliques/getCliques";
		private static const getClique:String = "/API/Cliques/getClique";
		private static const createClique:String = "/API/Cliques/createClique";
		private static const renameClique:String = "/API/Cliques/renameClique";
		private static const add:String = "/API/Cliques/add";
		private static const remove:String = "/API/Cliques/remove";
		
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doGetCliques(callback:Function):void {
			PlurkBase.load(getCliques,{},callback);
		}
		/**
		 * 
		 * @param clique_name clique_name: The name of the new clique
		 * @param callback
		 * 
		 */
		public static function doGetClique(clique_name:String, callback:Function):void {
			PlurkBase.load(getClique,{clique_name: clique_name},callback);
		}
		/**
		 * 
		 * @param clique_name clique_name: The name of the new clique
		 * @param callback
		 * 
		 */
		public static function doCreateClique(clique_name:String, callback:Function):void {
			PlurkBase.load(createClique,{clique_name: clique_name},callback);
		}
		/**
		 * 
		 * @param clique_name clique_name: The name of the clique to rename
		 * @param new_name new_name: The name of the new clique
		 * @param callback
		 * 
		 */
		public static function doRenameClique(clique_name:String, new_name:String, callback:Function):void {
			PlurkBase.load(renameClique,{clique_name: clique_name, new_name: new_name},callback);
		}
		/**
		 * 
		 * @param clique_name clique_name: The name of the clique
		 * @param user_id user_id: The user to add to the clique
		 * @param callback
		 * 
		 */
		public static function doAdd(clique_name:String, user_id:uint, callback:Function):void {
			PlurkBase.load(add,{clique_name: clique_name, user_id: user_id},callback);
		}
		/**
		 * 
		 * @param clique_name clique_name: The name of the clique
		 * @param user_id user_id: The user to remove from the clique
		 * @param callback
		 * 
		 */
		public static function doRemove(clique_name:String, user_id:uint, callback:Function):void {
			PlurkBase.load(remove,{clique_name: clique_name, user_id: user_id},callback);
		}
		
		public function Cliques(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}