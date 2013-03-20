package index.view
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	import tinkComponent.ComponentFactory;
	
	public class IndexView extends Sprite
	{
		private var _bg:Image;
		
		public function IndexView()
		{
			super();
			initView();
		}
		
		private function initView():void
		{
			_bg = ComponentFactory.instance.createComponentByStylename("yunyi.index.indexview");
			addChild(_bg);
		}
		
		public function show():void
		{
			
		}
	}
}