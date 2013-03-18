package index
{
	/**
	 *主页C  
	 * @author Demon-Tink
	 * 
	 */	
	public class IndexManager
	{
		private static var _instance:IndexManager;
		
		private var _model:IndexModel;
		
		public function IndexManager()
		{
			_model = new IndexModel();
		}
		
		public function setup():void
		{
			
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