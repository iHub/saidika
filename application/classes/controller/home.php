<?php defined('SYSPATH') or die('No direct script access'); 

/**
 * Main Controller
 */
class Controller_Home extends Controller_Template {
	
	/**
	 * Name of the template file
	 * @var string
	 */
	public $template = '';
	
	/**
	 * Whether the template should be automatically rendered
	 * @var bool
	 */
	public $auto_render = TRUE;
	
	
	public function before()
	{
		parent::before();
		
		// TODO Set the layout defaults
	}
	
	public function action_index()
	{
		// TODO Render the landing page
	}
}

?>