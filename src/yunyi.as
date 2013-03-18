package
{
	import flash.display.Sprite;
	
	import Starling.StarlingManager;
	
	[SWF(frameRate="60", backgroundColor="#ffffff")]
	public class yunyi extends Sprite
	{
		public function yunyi()
		{
			setup();
		}
		
		private function setup():void
		{
			StarlingManager.instance.setup(this.stage);
		}
	}
}