package index
{
	import tinkUIModuleLoader.UIModuleLoaderEvent;
	import tinkUIModuleLoader.UIModuleLoaderManager;
	
	import index.view.IndexView;
	
	import tinkLoader.LoaderManager;
	
	import tinkUIModuleLoader.UIModuleNames;

	/**
	 *主页C  
	 * @author Demon-Tink
	 * 
	 */	
	public class IndexManager
	{
		private static var _instance:IndexManager;
		
		private var _model:IndexModel;
		private var _view:IndexView;
		
		private var _loadComplete:Boolean;
		
		public function IndexManager()
		{
			_model = new IndexModel();
		}
		
		public function setup():void
		{
			if(_loadComplete)
			{
				_view = new IndexView();
				_view.show();
			}
			else
			{
				UIModuleLoaderManager.instance.addUIModule(UIModuleNames.INDEX_VIEW);
				UIModuleLoaderManager.instance.model.addEventListener(UIModuleLoaderEvent.COMPLETE,__complete);
				UIModuleLoaderManager.instance.model.addEventListener(UIModuleLoaderEvent.ERROR,__error);
			}
		}
		
		private function __complete(event:UIModuleLoaderEvent):void
		{
			UIModuleLoaderManager.instance.model.removeEventListener(UIModuleLoaderEvent.COMPLETE,__complete);
			UIModuleLoaderManager.instance.model.removeEventListener(UIModuleLoaderEvent.ERROR,__error);
			
			_loadComplete = true;
			setup();
		}
		
		private function __error(event:UIModuleLoaderEvent):void
		{
			UIModuleLoaderManager.instance.model.removeEventListener(UIModuleLoaderEvent.COMPLETE,__complete);
			UIModuleLoaderManager.instance.model.removeEventListener(UIModuleLoaderEvent.ERROR,__error);
		}
		
		public function get model():IndexModel
		{
			return _model;
		}
		
		public static function get instance():IndexManager
		{
			if(!_instance)
			{
				_instance = new IndexManager();
			}
			return _instance;
		}
	}
}