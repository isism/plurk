package events
{
	import flash.events.Event;
	
	public class AddNewResponse extends Event
	{
		public function AddNewResponse(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			//TODO: implement function
//			var bubbles:Boolean = true;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new AddNewResponse(this.type);
		}
	}
}