<?php
namespace app\img\controller;
use think\Controller;
use think\Db;
use \think\Request;
use think\Session;
class Message extends Controller{
    public function  msgAdd(){
    	if(Request::instance()->isPost()){
    		$data=Request::instance()->post();
    		$data['add_time']=time();
	    	Db::transaction(function(){
			   Db::name('message')->find(1);
			   Db::name('message')->delete(1);
			});
			return renderJson('200','事务执行成功！');
    	}
    }
}