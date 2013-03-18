package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Loaders.XMLLoader;
	
	import Starling.StarlingManager;
	
	import config.ConfigManager;
	
	[SWF(frameRate="60", backgroundColor="#ffffff")]
	public class yunyiAS extends Sprite
	{
		public function yunyiAS()
		{
			addEventListener(Event.ADDED_TO_STAGE,__addToStage);
		}
		
		private function setup():void
		{
			StarlingManager.instance.setup(this.stage);
			
			
			var loader:XMLLoader = LoaderManager.instance.createLoader(createConfigPath(),LoaderType.XML);
			loader.addEventListener(LoaderEvents.COMPLETE,__complete);
			loader.addEventListener(LoaderEvents.PROGRESS,__progress);
			
			stage.addEventListener(Event.ENTER_FRAME,__enterFrame);
		}
		
		private function __complete(event:LoaderEvents):void
		{
			var loader:XMLLoader = event.target as XMLLoader;
			var content:XML = new XML(loader.data);
			var xmllist:XMLList = content..config;
			if(xmllist.length() > 0)
			{
				ConfigManager.instance.xmlPath = xmllist[0].XML_PATH.@value;
				ConfigManager.instance.swfPath = xmllist[0].SWF_PATH.@value;
			}
		}
		
		private function __progress(event:LoaderEvents):void
		{
			var loader:XMLLoader = event.target as XMLLoader;
			trace(loader.url + "----progress----" + loader.progress);
		}
		
		private function __enterFrame(event:Event):void
		{
			LoaderManager.instance.execute();
		}
		
		private function __addToStage(event:Event):void
		{
			setup();
		}
		
		private function createConfigPath():String
		{
			var path:String = "config.xml";
			return path;
		}
	}
}