package index
{
	import index.view.IndexView;

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
//			LoaderManager.instance.createLoader(
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