package
{
	import Starling.StarlingManager;
	
	import tinkUIModuleLoader.UIModuleLoaderManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import index.IndexManager;
	
	import tinkLoader.LoaderEvent;
	import tinkLoader.LoaderManager;
	import tinkLoader.LoaderType;
	import tinkLoader.Loaders.XMLLoader;
	import tinkLoader.config.ConfigManager;
	
	[SWF(width="800",height="600", frameRate="60", backgroundColor="#ffffff")]
	public class yunyiAS extends Sprite
	{
		public function yunyiAS()
		{
			addEventListener(Event.ADDED_TO_STAGE,__addToStage);
		}
		
		private function setup():void
		{
			StarlingManager.instance.setup(this.stage,login);
		}
		
		private function login():void
		{
			UIModuleLoaderManager.instance.setup();
			
			
			IndexManager.instance.setup();
		}
		
		private function __complete(event:LoaderEvent):void
		{
			var loader:XMLLoader = event.target as XMLLoader;
			var content:XML = new XML(loader.data);
			var xmllist:XMLList = content..config;
			if(xmllist.length() > 0)
			{
				ConfigManager.instance.xmlPath = xmllist[0].XML_PATH.@value;
				ConfigManager.instance.swfPath = xmllist[0].SWF_PATH.@value;
			}
			setup();
		}
		
		private function __progress(event:LoaderEvent):void
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
			var loader:XMLLoader = LoaderManager.instance.createLoader(createConfigPath(),LoaderType.XML);
			loader.addEventListener(LoaderEvent.COMPLETE,__complete);
			loader.addEventListener(LoaderEvent.PROGRESS,__progress);
			LoaderManager.instance.addLoader(loader);
			
			stage.addEventListener(Event.ENTER_FRAME,__enterFrame);
		}
		
		private function createConfigPath():String
		{
			var path:String = "config.xml";
			return path;
		}
	}
}