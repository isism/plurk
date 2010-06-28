package events
{
	import flash.events.Event;
	
	public class AddNewPlurk extends Event
	{
		public function AddNewPlurk(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			//TODO: implement function
//			var bubbles:Boolean = true;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new AddNewPlurk(this.type);
		}
	}
}