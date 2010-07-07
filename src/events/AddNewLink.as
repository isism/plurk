package events
{
	import flash.events.Event;
	
	public class AddNewLink extends Event
	{
		public function AddNewLink(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			//TODO: implement function
//			var bubbles:Boolean = true;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new AddNewLink(this.type);
		}
	}
}