package com.xinyiglass.xygdev.controller;

import java.util.ArrayList;




import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.TextMessage;

import xygdev.commons.core.BaseController;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.util.TypeConvert;

import com.xinyiglass.xygdev.websocket.SystemWebSocketHandler;

/**
 * 服务端推送消息给用户
 */
@Controller
@RequestMapping("/admin")
public class AdminController   extends BaseController {
    
	@Bean
    public SystemWebSocketHandler systemWebSocketHandler() {
        return new SystemWebSocketHandler();
    }
	
	//http://192.168.88.123:8080/XYG_WEBDEV_SAMPLE/admin/sendMessage.do
	@RequestMapping("/sendMessage.do")
	public String sendMessage(){
		return "webSocket";
	}
	
	@RequestMapping("/auditing.do")
    public void auditing() throws Exception{
        PlsqlRetValue rs=new PlsqlRetValue();
        System.out.println("user_id:"+getPara("USER_IDS"));
        System.out.println("message:"+getPara("MESSAGE"));
        if(TypeConvert.isNullValue(getPara("MESSAGE"))){
            rs.setRetcode(2);
            rs.setErrbuf("消息不允许为空！");
        }else{
            String message=getPara("MESSAGE");
        	if(!TypeConvert.isNullValue(getPara("USER_IDS"))){
                ArrayList<Long> userIdList=new ArrayList<Long>();
                for(String userIdStr:getPara("USER_IDS").split(",")){
                	userIdList.add(Long.parseLong(userIdStr));
                    System.out.println("user_id:"+Long.parseLong(userIdStr));
                }
                systemWebSocketHandler().sendMessageToUsers(userIdList, new TextMessage(message));
        	}else{//发送给所有人
        		systemWebSocketHandler().sendMessageToUsers( new TextMessage(message));
        	}
            rs.setRetcode(0);
            rs.setErrbuf("发送成功！");
        }
        this.renderStr(rs.toJsonStr());
    }
}
