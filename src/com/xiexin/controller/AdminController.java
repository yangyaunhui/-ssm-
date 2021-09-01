package com.xiexin.controller;

import com.xiexin.bean.AdminInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/api/admin")
public class AdminController {
//注册成功后,如果是单体项目---就要跳转到登录页,这个跳转是后台的转发,重定向
//总之是后台负责跳转,携带数据的跳转页面的
//如果是新型的项目,即前后端分离的,那么后台只负责返回给前端json数据
//跳转是前端处理的,前端根据后台返回code代码,进行跳转
//如果前端负责跳转,它会起一个好听的名字,叫做路由
//什么是前后端分离 即:项目上的分离 和 数据上的分离
//项目上的分离:前端一个项目,后台一个项目,2个项目,它们的认证是token/jwt+redis
//数据上的分离:还是一个项目,只不过前后端用json来交互数据
//很少用jstl/el表达式来写项目.它们的认证是session
//layui在ssm框架中的使用,其实就是数据上的分离,也可以项目上的分离
//那么它及时json交互的,哪门后台只需要给它返回json数据就可以了
// 以前在servlet中,resp.getWriter().print(new JSONObject.tostring(map)) 输出json
//现在mvc框架高级了...
//adminName: admin 以前收参数 req.getParamter("adminName)
//adminPwd: 123456
//adminPwdR: 123456
    //第一种收参方式:数据类型接收参数!!!!!!
    @RequestMapping("/reg")
    @ResponseBody //这个注解就是返回给前端的json数据
    public Map reg(String adminName,String adminPwd,String adminPwdR,String adminTime){
        System.out.println("adminPwdR = " + adminPwdR);
        System.out.println("adminTime = " + adminTime);
        Map codeMap = new HashMap();
        if (!adminPwd.equals(adminPwdR)) {
            codeMap.put("code","4401");
            codeMap.put("msg","你输入的密码和重复密码不一致,注册失败");
            return codeMap;
        }
       if (adminName.length()<=0){
           codeMap.put("code","4402");
           codeMap.put("msg","adminName表单填写完整");
           return codeMap;
       }
        if (adminPwd.length()<=0){
            codeMap.put("code","4402");
            codeMap.put("msg","adminPwd表单填写完整");
            return codeMap;
        }
        if (adminPwdR.length()<=0){
            codeMap.put("code","4402");
            codeMap.put("msg","adminPwdR表单填写完整");
            return codeMap;
        }
        codeMap.put("code",0);
        codeMap.put("msg","注册成功");
        return codeMap;
    }

    //传统版本的不反悔json,跳转使用转发或者重定向
    @RequestMapping("/regForm")
    public String regForm(String adminName,String adminPwd){
        System.out.println("adminName = " + adminName);
        System.out.println("adminPwd = " + adminPwd);
        //注册成功跳转到登录页
        return "loginForm";
    }

    //springMVC第二种收参方式,实体类收参数
    @RequestMapping("/regByBean")
    @ResponseBody
    public Map regByBean(AdminInfo adminInfo){
        System.out.println("adminInfo = " + adminInfo);
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("msg","注册成功");
        return codeMap;
    }
}
