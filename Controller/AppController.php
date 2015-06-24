<?php

App::uses('CroogoAppController', 'Croogo.Controller');

/**
 * Base Application Controller
 *
 * @package  Croogo
 * @link     http://www.croogo.org
 */
class AppController extends CroogoAppController {
	public $components = array('DebugKit.Toolbar');


	public $helpers = array(
			'Session' => array('className' => 'Afigestion.AfigestionSession')

	);


	public function beforeFilter() {
		parent::beforeFilter();
		$this->Auth->logoutRedirect = array('admin' => false, 'plugin' => 'users', 'controller'=>'users', 'action' => 'login');
	}
}
