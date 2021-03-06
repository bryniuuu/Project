<?php
namespace Controllers;


class Naped extends Controller
{

    public function getAll($id){

        \Tools\Session::set('idlakier', $id);

        $view = $this->getView('Naped');
        $data = null;
        if(\Tools\Session::is('message'))
            $data['message'] = \Tools\Session::get('message');
        if(\Tools\Session::is('error'))
            $data['error'] = \Tools\Session::get('error');
        $view->getAll($data);
        \Tools\Session::clear('message');
        \Tools\Session::clear('error');
    }
}