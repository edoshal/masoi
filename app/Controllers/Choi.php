<?php

namespace App\Controllers;

class Choi extends BaseController
{
	public function index($name)
	{
		$data['title'] = $name;
		$data['name'] = "choi";
		$data['room'] = $name;
		return view('choi', $data);
	}
	//--------------------------------------------------------------------

}
