package comp
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Image;
	
	public class Timeline extends EventDispatcher
	{
		import comp.PlurkBase;
		import comp.Users;
		
		private static const getPlurk:String = "/API/Timeline/getPlurk";
		private static const getPlurks:String = "/API/Timeline/getPlurks";
		private static const getUnreadPlurks:String = "/API/Timeline/getUnreadPlurks";
		private static const plurkAdd:String = "/API/Timeline/plurkAdd";
		private static const plurkDelete:String = "/API/Timeline/plurkDelete";
		private static const plurkEdit:String = "/API/Timeline/plurkEdit";
		private static const mutePlurks:String = "/API/Timeline/mutePlurks";
		private static const unmutePlurks:String = "/API/Timeline/unmutePlurks";
		private static const markAsRead:String = "/API/Timeline/markAsRead";
		private static const uploadPicture:String = "/API/Timeline/uploadPicture";
		
		public function Timeline(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
//			Timeline
//			/API/Timeline/getPlurk
//				/API/Timeline/getPlurks
//				/API/Timeline/getUnreadPlurks
//				/API/Timeline/plurkAdd
//				/API/Timeline/plurkDelete
//				/API/Timeline/plurkEdit
//				/API/Timeline/mutePlurks
//				/API/Timeline/unmutePlurks
//				/API/Timeline/markAsRead
//				/API/Timeline/uploadPicture
		}
		public static function doGetPlurk(plurk_id:Number,callback:Function):void {
			PlurkBase.load(getPlurk,{plurk_id: plurk_id},callback);
		}
		public static function doGetPlurks(callback:Function, offset:Date = null, limit:String = null, filter:String = null):void {
//			var params:Object = {};
//			if (filter) { params.filter = filter }
			PlurkBase.load(getPlurks, {offset: offset, limit: limit, filter: filter}, callback);
		}
		public static function doGetUnreadPlurks(callback:Function, offset:Date= null, limit:String = null):void {
			PlurkBase.load(getUnreadPlurks,{offset: offset, limit: limit},callback);
		}
		
		/** 
		 * This is the typical format of a simple multiline documentation comment 
		 * for the doPlurkAdd() method. 
		 * 
		 * <p>This is the second paragraph of the main description 
		 * of the <code>doPlurkAdd</code> method. 
		 * Notice that you do not use the paragraph tag in the 
		 * first paragraph of the description.</p> 
		 *  
		 * @content content The Plurk's text. 
		 * @qualifier qualifier The Plurk's qualifier, must be in English. 
		 * @limited_to limited_to Limit the plurk only to some users (also known as private plurking). limited_to should be a JSON list of friend ids, e.g. limited_to of [3,4,66,34] will only be plurked to these user ids. If limited_to is [0] then the Plurk is privatley posted to the poster's friends.
		 * @no_comments no_comments  If set to 1, then responses are disabled for this plurk. If set to 2, then only friends can respond to this plurk.
		 * @lang lang The plurk's language.
		 * 
		 * @return A value of <code>true</code> means this;  
		 * <code>false</code> means that. 
		 * 
		 * @see someOtherMethod 
		 */ 
		public static function doPlurkAdd(content:String, qualifier:String, callback:Function, limited_to:Array=null, no_comments:String=null, lang:String = null):void {
			PlurkBase.load(plurkAdd,{content: content, qualifier: qualifier, limited_to: limited_to,no_comments: no_comments, lang: lang},callback);
		}
		public static function doPlurkDelete(plurk_id:Number, callback:Function):void {
			PlurkBase.load(plurkDelete,{plurk_id: plurk_id},callback);
		}
		
		public static function doPlurkEdit(content: String, plurk_id:Number, callback:Function):void {
			PlurkBase.load(plurkEdit,{content: content, plurk_id: plurk_id},callback);
		}
		public static function doMutePlurks(ids:Array, callback:Function):void {
			PlurkBase.load(mutePlurks,{ids: ids},callback);
		}
		public static function doUnmutePlurks(ids:Array, callback:Function):void {
			PlurkBase.load(unmutePlurks,{ids: ids},callback);
		}
		public static function doMarkAsRead(ids:Array, callback:Function):void {
			PlurkBase.load(markAsRead,{ids: ids},callback);
		}
		public static function doUploadPicture(image:Image, callback:Function):void {
			PlurkBase.load(uploadPicture,{image: image},callback);
		}
	}
}