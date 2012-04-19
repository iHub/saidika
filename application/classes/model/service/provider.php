<?php defined('SYSPATH') or die('No direct script access');

/**
 * Model for service_provider
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

class Model_Service_Provider extends ORM {
	
	/**
	 * One-to-many relationship definition
	 * @var array
	 */
	protected $_has_many = array(
		// One service provider can handle multiple emergencies
		'emergencies' => array(
			'through' => 'service_provider_emergency'
		),
		
		// A provider has one or more contacts
		'contacts' => array(
			'through' => 'contact'
		),
		
		// A service provider can be in multiple locations
		'locations' => array(
			'through' => 'service_provider_location'
		),
	);
	
	/**
	 * Overrides the default delete
	 */
	public function delete()
	{
		// Delete locations
		
		// Delete contacts
		
		// Delete emergencies
		
		parent::delete();
	}
	
	/**
	 * Adds a new contact to a service provider
	 *
	 * @param int $id        ID of the service provider
	 * @param array $contact Contact information to be added.
	 */
	public static function add_contact($id, $contact)
	{
		
	}
}