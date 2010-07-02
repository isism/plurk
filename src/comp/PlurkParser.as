package comp
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import flexlib.scheduling.samples.ScheduleData;
	import flexlib.scheduling.scheduleClasses.BackgroundItem;
	import flexlib.scheduling.scheduleClasses.ColoredScheduleEntry;
	import flexlib.scheduling.scheduleClasses.SimpleScheduleEntry;
	import flexlib.scheduling.util.DateUtil;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.ScrollEvent;
	import mx.events.ScrollEventDirection;
	import mx.formatters.DateFormatter;
	
	import uiDisplay.responseItem;
	
	public class PlurkParser extends EventDispatcher
	{
		[Bindable]
		private static var now:Date = new Date();
		public static function parse(result:Object):ArrayCollection{
			var microData:Object;
			var usersData:Object;
			var TimeOffSet:Number;
			if(result.error_text)
			{
				//Error handler
				//					trace(result.error_text);
				Alert.show(result.error_text);
			}
			else
			{
				//Success
				//					trace(result.user_info.display_name);
				microData = result.plurks;
				usersData = result.plurk_users;
				var addEntryData:ArrayCollection = new ArrayCollection();
				for each (var i:Object in microData) {
					var entry:ColoredScheduleEntry = new ColoredScheduleEntry();
					var now:Date = new Date();
					var postedDateUTC:Date;
					var postedStr:String = i.posted.toString();
					var newPostedStr:String= postedStr.split(" GMT").join("");
					//						Alert.show(newPostedStr);
					//						var postedFormatter:DateFormatter = new DateFormatter();
					//						postedFormatter.formatString = "EEE, DD MMM YYYY JJ:NN:SS";
					var postedDate:Date = DateFormatter.parseDateString(newPostedStr);
					TimeOffSet = now.getTimezoneOffset();
					//						Alert.show(postedDate.toUTCString());
					//						Alert.show(now.toUTCString(),this.TimeOffSet.toString());
					entry.startDate = new Date(postedDate.getTime() - DateUtil.MINUTE_IN_MILLISECONDS*TimeOffSet);
					//						entry.startDate = DateUtil.clearTime(new Date());
					var widthSecond:int = (FlexGlobals.topLevelApplication.measureHTMLText(i.content).width)/15;
					entry.endDate = new Date(entry.startDate.getTime() + DateUtil.MINUTE_IN_MILLISECONDS*(widthSecond +10));
					//						entry.endDate = new Date(entry.startDate.getTime() + DateUtil.MINUTE_IN_MILLISECONDS*20 );
					//						entry.endDate = new Date(entry.startDate.getTime() + DateUtil.HOUR_IN_MILLISECONDS*24 );
					var j:Number = i.owner_id;
					var z:String = j.toString();
					var userProfile:Object= new Object();
					userProfile = usersData[j];
					//						Alert.show([userProfile].length.toString());
					if(userProfile.has_profile_image == 1 && userProfile.avatar == (null||0)){
						//									entry.ownerImgUrl = "http://avatars.plurk.com/"+z+"-small.gif";
						entry.ownerImgUrl = "http://avatars.plurk.com/"+z+"-medium.gif";
					}
					else if(userProfile.has_profile_image == 1 && userProfile.avatar != (null&&0)){
						//									entry.ownerImgUrl = "http://avatars.plurk.com/" + z + "-small" +userProfile.avatar +".gif";
						entry.ownerImgUrl = "http://avatars.plurk.com/" + z+ "-medium" +userProfile.avatar +".gif";
					}
					else if(userProfile.has_profile_image == 0){
						entry.ownerImgUrl = "http://www.plurk.com/static/default_medium.gif";
						//									entry.ownerImgUrl = "http://www.plurk.com/static/default_small.gif";
					}
					
					entry.qualifier = i.qualifier;
					entry.nickName = userProfile.nick_name;
					entry.dispalyName = userProfile.display_name;
					entry.fullName = userProfile.full_name;
					entry.label= i.content;
					entry.plurk_id = i.plurk_id;
					//						entry.label =TextConverter.importToFlow( i.content, TextConverter.TEXT_FIELD_HTML_FORMAT);
					var limited:String = i.limited_to;
					var entryBGcolor:int;
					switch(limited){
						case null:
							entryBGcolor = 0xFFFFFF;
							//white
							break;
						case "|0|":
							entryBGcolor = 0x99CCFF;
							//light blue
							break;
						default:
							entryBGcolor = 0x999999;
							//grey
							break;
					}
					//						entry.width = this.btnNow.measureHTMLText(i.content).width + 50;
					entry.backgroundColor = entryBGcolor;
					addEntryData.addItem(entry);
				}
			}
				return addEntryData;
		}
		
		public static function responsesParse(result:Object):ArrayCollection {
			
			var microResponseData:Object;
			var friendsData:Object;
			var TimeOffSet:Number;
			var readResponsesOffset:uint;
			if(result.error_text)
			{
				//Error handler
				//					trace(result.error_text);
				Alert.show(result.error_text);
			}
			else
			{
				//Success
				//					trace(result.user_info.display_name);
				microResponseData = result.responses;
				friendsData = result.friends;
				readResponsesOffset = result.responses_seen;
				var addEntryData:ArrayCollection = new ArrayCollection();
				for each (var i:Object in microResponseData) {
					var entry:Object = new Object();
//					var entry:responseItem = new responseItem();
//					var entry:ColoredScheduleEntry = new ColoredScheduleEntry();
					var now:Date = new Date();
					var postedDateUTC:Date;
					var postedStr:String = i.posted.toString();
					var newPostedStr:String= postedStr.split(" GMT").join("");
					var postedDate:Date = DateFormatter.parseDateString(newPostedStr);
					TimeOffSet = now.getTimezoneOffset();
					entry.postedLocalDate = new Date(postedDate.getTime() - DateUtil.MINUTE_IN_MILLISECONDS*TimeOffSet);
//					var widthSecond:int = (FlexGlobals.topLevelApplication.measureHTMLText(i.content).width)/15;
//					entry.endDate = new Date(entry.startDate.getTime() + DateUtil.MINUTE_IN_MILLISECONDS*(widthSecond +10));
					var j:Number = i.user_id;
					var z:String = j.toString();
					var userProfile:Object= new Object();
					userProfile = friendsData[j];
					//						Alert.show([userProfile].length.toString());
					if(userProfile.has_profile_image == 1 && userProfile.avatar == (null||0)){
						//									entry.ownerImgUrl = "http://avatars.plurk.com/"+z+"-small.gif";
						entry.ownerImgUrl = "http://avatars.plurk.com/"+z+"-small.gif";
					}
					else if(userProfile.has_profile_image == 1 && userProfile.avatar != (null&&0)){
						//									entry.ownerImgUrl = "http://avatars.plurk.com/" + z + "-small" +userProfile.avatar +".gif";
						entry.ownerImgUrl = "http://avatars.plurk.com/" + z+ "-small" +userProfile.avatar +".gif";
					}
					else if(userProfile.has_profile_image == 0){
						entry.ownerImgUrl = "http://www.plurk.com/static/default_small.gif";
						//									entry.ownerImgUrl = "http://www.plurk.com/static/default_small.gif";
					}
					
					entry.nick_name = userProfile.nick_name;
					entry.display_name = userProfile.display_name;
					entry.date_of_birth = userProfile.date_of_birth;
					entry.uid = userProfile.uid;
					entry.karma = userProfile.karma;
					entry.lang = i.lang;
					entry.qualifier = i.qualifier;
					entry.qualifier_translated = i.qualifier_translated;
					entry.id = i.id;
					entry.user_id = i.user_id;
//					entry.fullName = userProfile.full_name;
					entry.content = i.content;
					entry.plurk_id = i.plurk_id;
					entry.posted = i.posted;
/*					var limited:String = i.limited_to;
					var entryBGcolor:int;
					switch(limited){
						case null:
							entryBGcolor = 0xFFFFFF;
							//white
							break;
						case "|0|":
							entryBGcolor = 0x99CCFF;
							//light blue
							break;
						default:
							entryBGcolor = 0x999999;
							//grey
							break;
					}
					//						entry.width = this.btnNow.measureHTMLText(i.content).width + 50;
					entry.backgroundColor = entryBGcolor; */
					addEntryData.addItem(entry);
				}
			}
			return addEntryData;
		}
		
		public function PlurkParser(target:IEventDispatcher=null)
		{
			//TODO: implement function
			super(target);
		}
	}
}