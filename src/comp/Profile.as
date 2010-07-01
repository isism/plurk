package comp
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import comp.PlurkBase;
	
	public class Profile extends EventDispatcher
	{
		private static const getOwnProfile:String = "/API/Profile/getOwnProfile";
		private static const getPublicProfile:String = "/API/Profile/getPublicProfile";
		
		
		/**
		 * 
		 * @param callback
		 * 
		 */
		public static function  doGetOwnProfile(callback:Function):void {
			PlurkBase.load(getOwnProfile,{},callback);
		}
		/**
		 * 
		 * @param user_id user_id: The user_id of the public profile. Can be integer (like 34) or nick name (like amix).
		 * @param callback
		 * 
		 */
		public static function doGetPublicProfile(user_id:*,callback:Function):void {
			PlurkBase.load(getPublicProfile,{user_id:user_id},callback);
		}
		
		public function Profile(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}