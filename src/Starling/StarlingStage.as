package Starling
{
	import index.IndexManager;
	
	import starling.display.Sprite;

	public class StarlingStage extends Sprite
	{
		public function StarlingStage()
		{
			super();
			setup();
		}
		
		private function setup():void
		{
			trace("Starling sucess!");
			IndexManager.instance.setup();
		}
	}
}