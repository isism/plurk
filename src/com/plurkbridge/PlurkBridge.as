/*
Copyright (c) 2010 Alif Harsan Pradipto

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/

package com.plurkbridge
{	
	import com.serialization.json.JSON;
	
	import flash.errors.IOError;
	import flash.events.AsyncErrorEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	[Bindable]
	public class PlurkBridge extends EventDispatcher
	{
		private static const BASE_URL:String = "http://www.plurk.com";
		private static const BASE_URL_SECURE:String = "https://www.plurk.com";
		
		private var _isDebug:Boolean;
		private var _loader:URLLoader;
		private var _request:URLRequest;	
		private var _callback:Function;
		
		/**
		 * Constructor
		 * 
		 * @param	isDebug Flag for showing additional process information via trace();
		 */
		public function PlurkBridge(isDebug:Boolean=false):void
		{
			this._isDebug = isDebug;	
			this._loader = new URLLoader();				
			initEventHandler(_loader);		
		}
		
		public function set isDebug(isD:Boolean):void {
			this._isDebug = isD;
			dispatchEvent(new Event("isDebugChange"));
		}
		
		[Bindable(event="isDebugChange")]
		public function get isDebug():Boolean {
			return _isDebug;
		}
		
		/**
		 * Load Plurk API service method.
		 * 
		 * @param	method			Plurk API service method. For example, '/API/Users/login'. Please refer to Plurk API documentation in http://www.plurk.com/API.
		 * @param	parameters		Parameter needed for method call. For example, '{api_key:8fskl8sa79hewk7as80}'. Please refer to Plurk API documentation in http://www.plurk.com/API, on Required/Optional Parameter section in each API service method.
		 * @param	callback		Function called upon completion of Plurk API method call. Will also returning object as parameter with attribute described in Plurk API documentation. Please refer to Plurk API documentation in http://www.plurk.com/API, on Successful/Error Return section in each API service method.
		 * @param	isSecure		Flag to indicate usage of HTTP (false) or HTTPS (true) connection for Plurk API method call.
		 */
		public function load(method:String, parameters:Object, callback:Function, isSecure:Boolean=false):void
		{			
			if (!_loader)
			{
				throw new Error("PlurkBridge have been destroyed. Create new PlurkBridge instance!");			
				return;
			}
			
			this._callback = callback;
			this._request = new URLRequest((isSecure ? BASE_URL_SECURE : BASE_URL) + method);	
			this._request.method = URLRequestMethod.GET;
			var variables:URLVariables = new URLVariables();
			for (var o:String in parameters)
			{
				variables[o] = parameters[o];
			}
			this._request.data = variables;
				
			if (_isDebug) trace("CALL: " + _request.url);
					
			this._loader.load(_request);					
		}
		
		/**
		 * Close the connection, remove all internal event handler, and remove all object used by PlurkBridge so it can be garbage collected.
		 * User will need to create new instance of PlurkBridge again.
		 */
		public function close():void
		{
			_loader.close();
			removeEventHandler(_loader);
			
			_loader = null;
			_request = null;
			_callback = null;
		}
		
		/**
		 * Add all necessary event handler for URLLoader.
		 */
		private function initEventHandler(urlLoader:URLLoader):void
		{
			urlLoader.addEventListener(Event.OPEN, onConnect);
			urlLoader.addEventListener(Event.CLOSE, onClose);
			urlLoader.addEventListener(Event.COMPLETE, onComplete);
			urlLoader.addEventListener(ProgressEvent.PROGRESS,onProgress);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS,onStatus);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);				
			urlLoader.addEventListener(AsyncErrorEvent.ASYNC_ERROR,onAsyncError);	
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);			
		}
		
		/**
		 * Remove all event handler for URLLoader.
		 */
		private function removeEventHandler(urlLoader:URLLoader):void
		{
			urlLoader.removeEventListener(Event.OPEN, onConnect);
			urlLoader.removeEventListener(Event.CLOSE, onClose);
			urlLoader.removeEventListener(Event.COMPLETE, onComplete);
			urlLoader.removeEventListener(ProgressEvent.PROGRESS,onProgress);
			urlLoader.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onStatus);
			urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);				
			urlLoader.removeEventListener(AsyncErrorEvent.ASYNC_ERROR,onAsyncError);	
			urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);			
		}
		
		/**
		 * Dispatch Event upon connecting.
		 * 
		 * @param	event 	Event
		 */	
		private function onConnect(event:Event):void
		{
			dispatchEvent(event);
		}
		
		/**
		 * Dispatch Event upon closing the connection.
		 * 
		 * @param	event 	Event
		 */	
		private function onClose(event:Event):void
		{
			dispatchEvent(event);
		}
		
		/**
		 * Dispatch Event upon completing the call.
		 * Will call callback function that has been set by user.
		 * 
		 * @param	event 	Event
		 */	
		private function onComplete(event:Event):void
		{										
			if (_isDebug) trace("RESULT: "+event.target.data);
			var data:Object = JSON.deserialize(event.target.data);
			_callback(data);
		}
				
		/**
		 * Dispatch progress event.
		 * 
		 * @param	event 	ProgressEvent
		 */		
		private function onProgress(event:ProgressEvent):void
		{
			dispatchEvent(event);
		}
				
		/**
		 * Dispatch HTTP status event.
		 * 
		 * @param	event 	HTTPStatusEvent
		 */
		private function onStatus(event:HTTPStatusEvent):void
		{
			dispatchEvent(event);
		}
		
		/**
		 * Dispatch I/O error event.
		 * If it's native Plurk error (Invalid Login, Plurk not found, etc), it will be handled properly and dispatched to callback function via onComplete().
		 * 
		 * @param	event 	IOErrorEvent
		 */
		private function onIOError(event:IOErrorEvent):void
		{				
			if (_isDebug) trace("ERROR: " + event.target.data);
			try
			{
				onComplete(event);
			}catch (error:Error)
			{
				dispatchEvent(event);
			}
		}
				
		/**
		 * Dispatch asynchronous error event.
		 * 
		 * @param	event 	AsyncErrorEvent
		 */
		private function onAsyncError(event:AsyncErrorEvent):void
		{
			trace("onAsyncError");
			dispatchEvent(event);
		}
		
		/**
		 * Dispatch security error event.
		 * 
		 * @param	event 	SecurityErrorEvent
		 */
		private function onSecurityError(event:SecurityErrorEvent):void
		{
			trace("onSecurityError");
			dispatchEvent(event);
		}
	}
}