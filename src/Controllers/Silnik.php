<?php
namespace Controllers;


class Silnik extends Controller
{

    public function getAll($id){

        \Tools\Session::set('idmodel', $id);
        $model = $this->getModel('Samochod');
        $data = $model->getOne($id);
        $data=$data['samochody'];

        \Tools\Session::set('nazwaModel', $data[0]['nazwaModel']);

        $view = $this->getView('Silnik');
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