<?php defined('SYSPATH') or die('No direct script access'); 

/**
 * Main controller - Loads the landing page for the application
 *
 * PHP version 5
 * LICENSE: This source file is subject to GPLv3 license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/licenses/gpl-3.0.html
 * @author      iHub Developer Community
 * @package     saidika - http://github.com/ihub/saidika
 * @category    Controllers
 * @copyright   iHub - http://www.ihub.co.ke
 * @license     http://www.gnu.org/licenses/gpl-3.0.html GNU General Public License v3 (GPLv3) 
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