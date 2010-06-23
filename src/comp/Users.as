package comp
{
	import com.plurkbridge.PlurkBridge;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Users extends EventDispatcher
	{
		import comp.PlurkBase;

		[Bindable]
		internal static var username:String;
		[Bindable]
		internal static var password:String;

		private static const register:String = "/API/Users/register";
		private static const login:String = "/API/Users/login";
		private static const logout:String = "/API/Users/logout";
		private static const update:String = "/API/Users/update";
		private static const updatePicture:String = "/API/Users/updatePicture";
		
		public static function doLogin(callback:Function):void {
			PlurkBase.load(login, { username: username, password: password }, callback);
		}
		public static function doLogout(callback:Function):void {
			PlurkBase.load(logout,{}, callback);
		}
		

		//		Users
//		/API/Users/register
//			/API/Users/login
//			/API/Users/logout
//			/API/Users/update
//			/API/Users/updatePicture
//		public function Users(target:IEventDispatcher=null)
//		public function Users(Method:String,parameters:Object):void
//		{	
//			switch(Method)
//			{
//				case register:
//				{
////				_userBridge.load(this.register,parameters,
//				}
//			}
//			//TODO: implement function
//			super(target);
//		}
//		public function UserParameters(method:String):Object {
//			var 
//			switch (method)
//			{
//				case register:
//				{
//					
//				}
//			}
//		}
	}
}