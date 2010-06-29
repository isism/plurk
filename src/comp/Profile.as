package comp
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import comp.PlurkBase;
	
	public class Profile extends EventDispatcher
	{
		private static const getOwnProfile:String = "/API/Profile/getOwnProfile";
		private static const getPublicProfile:String = "/API/Profile/getPublicProfile";
		
		
		public static function  doGetOwnProfile(callback:Function):void {
			PlurkBase.load(getOwnProfile,{},callback);
		}
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