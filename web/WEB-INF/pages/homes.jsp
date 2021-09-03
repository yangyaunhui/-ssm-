<%--
  Created by IntelliJ IDEA.
  User: TJYSB
  Date: 2021/9/2
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农场购买记录</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <style>
        #one{
            margin: 0 auto;
            width: 280px;
            height: 500px;
        }
        #two{
            margin: 0 auto;
        }
        .box{
            border: 2px solid lavender;
            width: 65px;
            height: 25px;
            text-align: center;
        }
        #nongid{
            width: 90px;
            height: 20px;
            border: 1px solid lightsteelblue;
        }
    </style>
</head>
<body>
<span style="text-align: center">
<div id="one">
     <p style="font-size: 18px">我的农场</p>
 <div id="two">
    农场主ID：<input type="text" id="nongid">  &nbsp;
     金币：1000  <br>
     <p style="text-align: left">   农场主名称：小灰灰</p>
 </div>
    <br>

<div style="margin: 0 auto">
    <p style="font-size: 18px">可购买的种子列表</p>
    <table style="margin: 0 auto">
        <thead>
        <tr>
            <td>名称</td>
            <td>价格</td>
            <td>数量</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <div class="box" style="color: #9F9F9F">
                    水稻
                </div>
            </td>
            <td>
                <div class="box" style="color: #9F9F9F">100</div>
            </td>
            <td><div class="box">1</div></td>
                <td>
                   <a href="#" id="yy" onclick="YY()">购买</a>
                </td>
        </tr>
        <tr>
            <td>
                <div class="box" style="color: #9F9F9F">
                    玉米
                </div>
            </td>
            <td>
                <div class="box" style="color: #9F9F9F">150</div>
            </td>
            <td><div class="box">1</div></td>
                <td>
                   <a href="#" id="demo02">购买</a>
                </td>
        </tr>
        <tr>
            <td>
                <div class="box" style="color: #9F9F9F">
                    马铃薯
                </div>
            </td>
            <td>
                <div class="box" style="color: #9F9F9F">200</div>
            </td>
            <td><div class="box">1</div></td>
                <td>
                   <a href="#" id="demo03">购买</a>
                </td>
        </tr>
        </tbody>
    </table>
</div>
<br>
 <div style="margin-top:20px;margin-bottom: 10px">
     <span align="center" style="font-size: 18px">购买详情记录</span>
     <input type="button" value="查看"> <br>
     <p> </p>
     <table style="margin: 0 auto">
         <thead>
         <tr>
             <td>种子记录 &nbsp;</td>
             <td>购买数量 &nbsp;</td>
             <td>购买时间 &nbsp;</td>
         </tr>
         </thead>
         <tbody id="goods">

         </tbody>

     </table>
 </div>
</div>
    </span>
<script>
    // map传参   翻版的第一种  不常用，要会 map+json 常用
    $("#yy").click(function () {
        var map={
            'snme':"水稻",
            'count':"10",
            'time':"2010-08-18"
        };
        //第一步 构建一个 jquery dom元素
        var trDom=$("<tr><td>水稻</td><td>10</td><td>2010-08-18</td></tr>");  //这叫做构建  jquery的dom元素
        $('#goods').append(trDom);  //追加只会在末尾加

        $.ajax({
            url:"/api/nong/yyds",
            type:"POST",
            dataType:"json",
            data:JSON.stringify(map),
            contentType:"application/json;charset=UTF-8",
            success:function (res) {
                console.log(res)
            }

        });
    });

    // map传参   翻版的第一种  不常用，要会 map+json 常用
    $("#demo02").click(function () {
        var map={
            'snme':"玉米",
            'count':"2",
            'time':"2010-09-28"
        };
        //第一步 构建一个 jquery dom元素
        var trDom=$("<tr><td>玉米</td><td>2</td><td>2010-09-28</td></tr>");  //这叫做构建  jquery的dom元素
        $('#goods').append(trDom);  //追加只会在末尾加

        $.ajax({
            url:"/api/nong/demo",
            type:"POST",
            dataType:"json",
            data:JSON.stringify(map),
            contentType:"application/json;charset=UTF-8",
            success:function (res) {
                console.log(res)
            }

        });
    })

    // map传参   翻版的第一种  不常用，要会 map+json 常用
    $("#demo03").click(function () {
        var map={
            'snme':"马铃薯",
            'count':"15",
            'time':"2020-12-28"
        };
        //第一步 构建一个 jquery dom元素
        var trDom=$("<tr><td>马铃薯</td><td>15</td><td>2020-12-28</td></tr>");  //这叫做构建  jquery的dom元素
        $('#goods').append(trDom);  //追加只会在末尾加

        $.ajax({
            url:"/api/nong/ds",
            type:"POST",
            dataType:"json",
            data:JSON.stringify(map),
            contentType:"application/json;charset=UTF-8",
            success:function (res) {
                console.log(res)
            }

        });
    })
</script>

</body>
</html>
