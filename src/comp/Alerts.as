package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Alerts extends EventDispatcher
	{
		private static const getActive:String = "/API/Alerts/getActive"; 
		private static const getHistory:String = "/API/Alerts/getHistory";
		private static const addAsFan:String = "/API/Alerts/addAsFan";
		private static const addAllAsFan:String = "/API/Alerts/addAllAsFan";
		private static const addAllAsFriends:String = "/API/Alerts/addAllAsFriends";
		private static const addAsFriend:String = "/API/Alerts/addAsFriend";
		private static const denyFriendship:String = "/API/Alerts/denyFriendship";
		private static const removeNotification:String = "/API/Alerts/removeNotification";
		
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doGetActive(callback:Function):void {
			PlurkBase.load(getActive,{},callback);
		}
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doGetHistory(callback:Function):void {
			PlurkBase.load(getHistory,{},callback);
		}
		/**
		 * 
		 * @param user_id user_id: The user_id that has asked for friendship.
		 * @param callback
		 * 
		 */
		public static function doAddAsFan(user_id:uint, callback:Function):void {
			PlurkBase.load(addAsFan,{user_id: user_id},callback);
		}
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doAddAllAsFan(callback:Function):void {
			PlurkBase.load(addAllAsFan,{},callback);
		}
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doAddAllAsFriends(callback:Function):void {
			PlurkBase.load(addAllAsFriends,{},callback);
		}
		/**
		 * 
		 * @param user_id user_id: The user_id that has asked for friendship.
		 * @param callback
		 * 
		 */
		public static function doAddAsFriend(user_id:uint, callback:Function):void {
			PlurkBase.load(addAsFriend,{user_id: user_id},callback);
		}
		/**
		 * 
		 * @param user_id user_id: The user_id that has asked for friendship.
		 * @param callback
		 * 
		 */
		public static function doDenyFriendship(user_id:uint, callback:Function):void {
			PlurkBase.load(denyFriendship,{user_id: user_id},callback);
		}
		/**
		 * 
		 * @param user_id user_id: The user_id that the current user has requested friendship for.
		 * @param callback
		 * 
		 */
		public static function doRemoveNotification(user_id:uint, callback:Function):void {
			PlurkBase.load(removeNotification,{user_id: user_id},callback);
		}
		public function Alerts(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}