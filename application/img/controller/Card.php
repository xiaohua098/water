<?php
namespace app\img\controller;
use think\Controller;
use think\Db;
use \think\Request;
use think\Session;
class Card extends Com{
    //房卡消耗数
    public function cardExpend(){
      $data=Db::connect('db1')->table('OnlineStreamInfo')->find(1);//连接sqlsrv数据库
      var_dump($data);
    }
    //房卡产出数
    public function cardPunch(){
        $count=17;
        $data=Db::name('expend_card')->paginate($count);
        return renderJson('200','',$data);
    }
    //房卡库存
    public function cardStock(){

    }
}