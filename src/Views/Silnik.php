<?php

namespace Views;


class Silnik extends View
{
    public function getAll($data = null){
        if(isset($data['message']))
            $this->set('message',$data['message']);
        if(isset($data['error']))
            $this->set('error',$data['error']);
        $model = $this->getModel('Silnik');
        $data = $model->getAll();
        $this->set('silniki', $data['silniki']);

        $model = $this->getModel('Samochod');
        $data = $model->getOne(1);
        $data=$data['samochody'];
        d($data[0]['nazwaModel']);
        if(isset($data['error']))
            $this->set('error', $data['error']);
        $this->render('SilnikGetAll');
    }
}