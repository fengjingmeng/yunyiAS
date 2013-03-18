package Starling
{
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.EventDispatcher;
	
	import starling.core.Starling;
	
	public class StarlingManager extends EventDispatcher
	{
		private static var _instance:StarlingManager;
		
		private var _starling:Starling;
		private var _stage:Stage;
		
		public function StarlingManager()
		{
			super();
		}
		
		public function setup($stage:Stage,reback:Function):void
		{
			if(_stage)
			{
				return;
			}
			_stage = $stage;
			
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.align = StageAlign.TOP_LEFT;
			
			_starling = new Starling(StarlingStage,_stage)
			_starling.antiAliasing = 1;
			_starling.start();
			
			reback();
		}
		
		public static function get instance():StarlingManager
		{
			if(!_instance)
			{
				_instance = new StarlingManager();
			}
			return _instance;
		}
	}
}