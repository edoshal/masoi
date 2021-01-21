<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;


class Api extends BaseController
{

	use ResponseTrait;
	public function index()
	{
		die();
	}

	//đăng nhập
	public function login()
	{
		$request = \Config\Services::request();
		$username = $request->getVar('username');
		$room = $request->getVar('room');


		$masoiModel = new \App\Models\MasoiModel();
		$masoiModel->JoinGame($username, $room);
		$masoiModel->IsAdmin();
	}

	//ping
	public function ping()
	{
		$request = \Config\Services::request();
		$room = $request->getVar('room');

		$masoiModel = new \App\Models\MasoiModel();
		$masoiModel->Ping();
		return $this->respond($masoiModel->GetListMember($room));
	}

	//ping
	public function GetRole()
	{
		$masoiModel = new \App\Models\MasoiModel();
		return $this->respond($masoiModel->GetMyRole());
	}

	//generate role
	public function generate()
	{
		$request = \Config\Services::request();
		$roles = $request->getVar("roles");
		$room = $request->getVar('room');
		$masoiModel = new \App\Models\MasoiModel();
		$listMember = $masoiModel->GetListMember($room);
		shuffle($listMember);
		// if(count($listMember) < 6) return;
		$numSoi = ceil(count($listMember) / 3);
		if ($numSoi >= 3 && count($listMember) < 9) $numSoi = 2;
		$numPhuthuy = in_array("phuthuy", $roles) ? 1 : 0;
		$numThosan = in_array("thosan", $roles) ? 1 : 0;
		$numBaove = in_array("baove", $roles) ? 1 : 0;
		$numTientri = in_array("tientri", $roles) ? 1 : 0;

		for ($x = 0; $x < count($listMember); $x++) {
			if ($numSoi > 0) {
				$masoiModel->SetRole($listMember[$x]->id, 1);
				$numSoi--;
			} else if ($numPhuthuy > 0) {
				$masoiModel->SetRole($listMember[$x]->id, 2);
				$numPhuthuy--;
			} else if ($numThosan > 0) {
				$masoiModel->SetRole($listMember[$x]->id, 3);
				$numThosan--;
			} else  if ($numBaove > 0) {
				$masoiModel->SetRole($listMember[$x]->id, 4);
				$numBaove--;
			} else if ($numTientri > 0) {
				$masoiModel->SetRole($listMember[$x]->id, 5);
				$numTientri--;
			} else {
				$masoiModel->SetRole($listMember[$x]->id, 6);
			}
		}
	}
	//--------------------------------------------------------------------

}
