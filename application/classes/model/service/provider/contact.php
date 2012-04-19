<?php defined('SYSPATH') or die('No direct script access');

/**
 * Model for the service_provider_contact table
 *
 * PHP version 5
 * LICENSE: This source file is subject to GPLv3 license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/licenses/gpl-3.0.html
 * @author      iHub Developer Community
 * @package     saidika - http://github.com/ihub/saidika
 * @category    Models
 * @copyright   iHub - http://www.ihub.co.ke
 * @license     http://www.gnu.org/licenses/gpl-3.0.html GNU General Public License v3 (GPLv3) 
 */

class Model_Service_Provider_Contact extends ORM {
	
	/**
	 * Many-to-one relationship definition
	 * @var array
	 */
	protected $_belongs_to = array('contact_type' => array());
}