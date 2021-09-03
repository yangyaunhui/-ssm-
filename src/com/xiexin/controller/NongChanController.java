package com.xiexin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/api/nong")
public class NongChanController {
    @RequestMapping("/yyds")
    @ResponseBody    //十分常用   servlet多表的 动态参数，就是用map   ajax07 能搞定一切！！
    public Map ajax07(@RequestBody Map map){
        System.out.println("map = " + map);
        Map codemap=new HashMap();
        codemap.put("code",0);
        codemap.put("msg","请求访问成功！");
        codemap.put("data",map);
        return codemap;
    }
    @RequestMapping("/demo")
    @ResponseBody    //十分常用   servlet多表的 动态参数，就是用map   ajax07 能搞定一切！！
    public Map demo03(@RequestBody Map map){
        System.out.println("map = " + map);
        Map codemap=new HashMap();
        codemap.put("code",0);
        codemap.put("msg","请求访问成功！");
        codemap.put("data",map);
        return codemap;
    }
    @RequestMapping("/ds")
    @ResponseBody    //十分常用   servlet多表的 动态参数，就是用map   ajax07 能搞定一切！！
    public Map ds(@RequestBody Map map){
        System.out.println("map = " + map);
        Map codemap=new HashMap();
        codemap.put("code",0);
        codemap.put("msg","请求访问成功！");
        codemap.put("data",map);
        return codemap;
    }
}
