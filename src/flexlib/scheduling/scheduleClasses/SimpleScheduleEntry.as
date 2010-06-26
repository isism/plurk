/*

Copyright (c) 2006. Adobe Systems Incorporated.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
  * Neither the name of Adobe Systems Incorporated nor the names of its
    contributors may be used to endorse or promote products derived from this
    software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

@ignore
*/package flexlib.scheduling.scheduleClasses
{	
	import flexlib.scheduling.scheduleClasses.IScheduleEntry;
	
	import mx.charts.chartClasses.NumericAxis;

	/**
	 */	
	public class SimpleScheduleEntry implements IScheduleEntry
	{
		public var label : String;
//		public var label:RichEditableText;
		public var username:String;
		public var qualifier_translated:String;
		public var qualifier:String;
		public var ownerImgUrl:String;
//		public var width:int;
//		private var __width:Number = 250;
		private var _startDate : Date;
		private var _endDate : Date;	
	
		public function get startDate() : Date
		{
			return _startDate;
		}
		
		public function set startDate( value : Date) : void
		{
			_startDate = value;
		}
		
		public function get endDate() : Date
		{
			return _endDate;
		}
		
		public function set endDate( value : Date ) : void 
		{
			_endDate = value;
		}

//		public function get _width() : Number
//		{
//			return __width;
//		}
//		
//		public function set _width( value :Number ) : void 
//		{
//			__width = value;
//		}

		public function toString() : String
		{
			return "[object SimpleScheduleEntry startDate:" + startDate + " endDate:" + endDate + "]";
		}
	}
}