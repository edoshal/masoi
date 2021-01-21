<?php

namespace App\Models;

use CodeIgniter\Model;

class MasoiModel extends Model
{

    // Đăng ký tài khoản
    function JoinGame($username, $room)
    {
        $session = \Config\Services::session();
        $db      = \Config\Database::connect();

        $builder = $db->table('game');
        $builder->where('room', $room);
        $builder->where('lastping >= now() - interval 30 second');
        $builder->selectCount('id');
        $query = $builder->get();
        $value = $query->getRow()->id;

        $builder2 = $db->table('game');
        if ($value == 0) {
            $data = [
                'username' => $username,
                'room'  => $room,
                'isAdmin'  => TRUE
            ];
        } else {
            $data = [
                'username' => $username,
                'room'  => $room,
                'isAdmin'  => FALSE
            ];
        }
        $builder2->insert($data);
        $session->set("id", $db->insertID());
        $session->set("username", $username);
    }

    // get list member
    function GetListMember($room)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('game');
        $builder->where('room', $room);
        $builder->where('lastping >= now() - interval 10 second');

        $query = $builder->get();

        return $query->getResult();
    }

    // isAdmin
    function IsAdmin()
    {
        $session = \Config\Services::session();
        $db      = \Config\Database::connect();
        $builder = $db->table('game');
        $builder->where('id', $session->get("id"));
        $query = $builder->get();
        $session->set("isadmin", $query->getRow()->isAdmin);
        $session->set("room", $query->getRow()->room);
    }
    //ping status
    function Ping()
    {
        $session = \Config\Services::session();
        $db      = \Config\Database::connect();
        $builder = $db->table('game');
        $builder->set('lastping', date('Y-m-d H:i:s'));
        $builder->where('id', $session->get("id"));
        $builder->update();
    }


    //ping status
    function SetRole($uid, $role)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('game');
        $builder->set('role', $role);
        $builder->where('id', $uid);
        $builder->update();
    }

    //ping status
    function GetMyRole()
    {
        $session = \Config\Services::session();
        $db      = \Config\Database::connect();
        $builder = $db->table('game');
        $builder->select('name');
        $builder->join('role', 'game.role = role.id');
        $builder->where('game.id', $session->get("id"));
        $query = $builder->get();
        return $query->getRow()->name;
    }
}
