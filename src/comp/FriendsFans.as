package comp
{
	import comp.PlurkBase;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class FriendsFans extends EventDispatcher
	{
		private static const getFriendsByOffset:String = "/API/FriendsFans/getFriendsByOffset";
		private static const getFansByOffset:String = "/API/FriendsFans/getFansByOffset";
		private static const getFollowingByOffset:String = "/API/FriendsFans/getFollowingByOffset";
		private static const becomeFriend:String = "/API/FriendsFans/becomeFriend";
		private static const removeAsFriend:String = "/API/FriendsFans/removeAsFriend";
		private static const becomeFan:String = "/API/FriendsFans/becomeFan";
		private static const setFollowing:String = "/API/FriendsFans/setFollowing";
		private static const getCompletion:String = "/API/FriendsFans/getCompletion";
		
		/**
		 * 
		 * @param user_id
		 * @param callback
		 * @param offset offset: The offset, can be 10, 20, 30 etc.
		 * 
		 */
		public static function doGetFriendsByOffset(user_id:uint, callback:Function, offset:String=null):void {
			PlurkBase.load(getFriendsByOffset,{user_id: user_id, offset: offset},callback);
		}
		/**
		 * 
		 * @param user_id
		 * @param callback
		 * @param offset offset: The offset, can be 10, 20, 30 etc.
		 * 
		 */
		public static function doGetFansByOffset(user_id:uint, callback:Function, offset:String=null):void {
			PlurkBase.load(getFansByOffset,{user_id: user_id, offset: offset},callback);
		}
		/**
		 * 
		 * @param callback
		 * @param offset offset: The offset, can be 10, 20, 30 etc.
		 * 
		 */
		public static function doGetFollowingByOffset(callback:Function, offset:String=null):void {
			PlurkBase.load(getFollowingByOffset,{offset: offset},callback);
		}
		/**
		 * 
		 * @param friend_id friend_id: The ID of the user you want to befriend.
		 * @param callback
		 * 
		 */
		public static function doBecomeFriend(friend_id:uint, callback:Function):void {
			PlurkBase.load(becomeFriend,{friend_id: friend_id},callback);
		}
		/**
		 * 
		 * @param friend_id friend_id: The ID of the user you want to remove
		 * @param callback
		 * 
		 */
		public static function doRemoveAsFriend(friend_id:uint, callback:Function):void {
			PlurkBase.load(removeAsFriend,{friend_id: friend_id},callback);
		}
		/**
		 * 
		 * @param fan_id fan_id: The ID of the user you want to become fan of
		 * @param callback
		 * 
		 */
		public static function doBecomeFan(fan_id:uint, callback:Function):void {
			PlurkBase.load(becomeFan,{fan_id: fan_id},callback);
		}
		/**
		 * 
		 * @param user_id user_id: The ID of the user you want to follow/unfollow.
		 * @param follow follow: true if the user should be followed, and false if the user should be unfollowed.
		 * @param callback
		 * 
		 */
		public static function doSetFollowing(user_id:uint, follow:Boolean, callback:Function):void {
			PlurkBase.load(setFollowing,{user_id: user_id, follow: follow},callback);
		}
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function doGetCompletion(callback:Function):void {
			PlurkBase.load(getCompletion,{},callback);
		}
		public function FriendsFans(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}