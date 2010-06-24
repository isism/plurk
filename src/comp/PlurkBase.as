package comp
{
	public class PlurkBase
	{
		import com.plurkbridge.PlurkBridge;
		public static const API_KEY:String = "6yx2VCMDFrRIjRkHLlDbss45xQJJaGCn";
		private static var _plurkBridge:PlurkBridge = new PlurkBridge();
		public static function load (method:String,  params:Object,  callback:Function, isSecure:Boolean=false):void {
			for  (var key:String in params) {
				if (params[key] == null) {
					delete params[key];
				}
			}
			params.api_key = API_KEY;
			_plurkBridge.load(method, params, callback,isSecure);
		} 
	}
}