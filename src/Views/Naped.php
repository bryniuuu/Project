<?php

namespace Views;


class Naped extends View
{
    public function getAll($data = null){
        if(isset($data['message']))
            $this->set('message',$data['message']);
        if(isset($data['error']))
            $this->set('error',$data['error']);


        $model = $this->getModel('Samochod');
        $data = $model->getAll();
        $this->set('samochody', $data['samochody']);

        $model = $this->getModel('Silnik');
        $data = $model->getAll();
        $this->set('silniki', $data['silniki']);

        $model = $this->getModel('Skrzynia');
        $data = $model->getAll();
        $this->set('skrzynie', $data['skrzynie']);

        $model = $this->getModel('Lakier');
        $data = $model->getAll();
        $this->set('lakiery', $data['lakiery']);

        $model = $this->getModel('Reflektor');
        $data = $model->getAll();
        $this->set('reflektory', $data['reflektory']);

        $model = $this->getModel('Kola');
        $data = $model->getAll();
        $this->set('kola', $data['kola']);

        $model = $this->getModel('Naped');
        $data = $model->getAll();
        $this->set('napedy', $data['napedy']);

        $this->set('sciezka',\Config\Website\Config::$subdirimage);


        if(isset($data['error']))
            $this->set('error', $data['error']);
        $this->render('NapedGetAll');
    }
}