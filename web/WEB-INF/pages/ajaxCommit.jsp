<%--
  Created by IntelliJ IDEA.
  User: ASD
  Date: 2021/9/2
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<html>
<head>
    <title>总结springmvc之ajax和mvc收参数 非常重要</title>
</head>
<body>
<div>
    <input type="button" value="ajax的01中传参数 k-结构或对象" id="ajax01">
    <input type="button" value="ajax的02中传参数 对象" id="ajax02">
    <input type="button" value="ajax的03中传参数 数组或者集合" id="ajax03">
    <input type="button" value="ajax的04中传参数 传json对象" id="ajax04">
    <input type="button" value="ajax的05中传参数 传多个对象" id="ajax05">
    <input type="button" value="ajax的06中传参数 批量对象传参" id="ajax06">
    <input type="button" value="ajax的07中传参数 map传参" id="ajax07">
    <input type="button" value="ajax的08中传参数 对象+常用类型 混合 带参数的分页查询" id="ajax08">

</div>
<script>
    $(function () {
        $("#ajax01").click(function () {
            $.ajax({
                url:"/api/admin/regByBean",
                type:"POST",
                data:{
                    'adminName':'zhangsan',
                    'adminPwd':'123456789',
                    'adminTime':'2010-09-08 23:09:08'
                },
                dataType:'JSON',
                success:function (res) {
                    console.log(res)
                }
            });
        });
        $("#ajax02").click(function () {
            var adminInfo={};
            adminInfo.adminName='zhangsan';
            adminInfo.adminPwd='123456789';
            adminInfo.adminTime='2010-09-08 23:09:08';
            $.ajax({
                url:"/api/admin/regByBean",
                type:"POST",
                data:adminInfo,
                dataType:'JSON',
                success:function (rs) {
                    console.log(rs)
                }
            })

        });
        // ajax传数组或者集合，应用范围是批量删除，比如ids[]={3,5,6,2}
        $("#ajax03").click(function () {
            var ids = new Array();
            ids.push(3);
            ids.push(6);
            ids.push(8);
            ids.push(80);
            //把数组使用ajax传递
            $.ajax({
                url:"/api/admin/ajax03",
                type:'POST',
                data:{'ids':ids},
                dataType:'JSON',
                success:function (res) {
                    console.log(res)
                }
            })
        });
        $("#ajax04").click(function () {
            //json对象 浏览器中看到请求是带颜色的
            var adminInfo={
                adminName:"小乔",
                adminTime:"2020-09-08 12:09:34",
                adminPwd:"987090",
                loverList:[
                    {
                        name:"小薛",
                        age:18
                    },
                    {
                        name:"大乔",
                        age:19
                    },
                    {
                        name:"孙尚香",
                        age:20
                    },
                ],
                aiHao:[4,9,13]
            };
            //var 出来的对象，他是一个对象，如果直接传输，www-urlxxx传递的
            //为什么转为json对象，因为普通的请求是很多个K-v结构，后台获取特别麻烦，所以就需要把复杂的对象转换成json对象
            //后台接收就方便多了，前后端项目，一般都是json传递
            $.ajax({
                url:"/api/admin/ajax04",
                type:"POST",
                // data:adminInfo,  //普通的k-v结构请求方式是：Content-Type: application/x-www-form-urlencoded; charset=UTF-8
                data:JSON.stringify(adminInfo),//变为json对象后，就需要Content-Type更改为application/json;charset=UTF-8
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                success:function (rs) {
                    console.log(rs)
                }
            });
        });
        $("#ajax05").click(function () { //不常见,因为发货单,上面收货人的对象,下面是产品对象
            $.ajax({
                url:'/api/admin/ajax05',
                type:'post',
                dataType:'json',
                data:{
                    'lover.name':'小灰灰',
                    'lover.age':18,
                    'dog.dogId':1002,
                    'dog.dogSex':'男',
                },
                success:function (res) {
                    console.log(res)
                }
            });
        });
        $("#ajax06").click(function () {
           var loverList = [];
            for (var i = 0; i < 5; i++) {
                var lover = {
                    name:"灰灰"+i,
                    age:18
                }
                loverList.push(lover)
            }
            //多个对象,就属于复杂的,复杂用json
            $.ajax({
                url:'/api/admin/ajax06',
                //type:'GET', get请求是无法传输json协议和json数据的
                //get请求没音方法体,无法传输json数据
                type:'post',
                data:JSON.stringify(loverList),
                dataType:'json',
                contentType:"application/json;charset=UTF-8",
                success:function (r) {
                    console.log(r)
                }
            });
        });
        $("#ajax07").click(function () {
            var map = {
                'adminName':'zhangsan',
                'adminPwd':'123456789',
                'adminTime':'2010-09-08 23:09:08'
            }
            $.ajax({
               url:'/api/admin/ajax07',
               type:'post',
               dataType:'json',
               data:JSON.stringify(map),
                success:function (res) {
                    console.log(res)
                },
                contentType:"application/json;charset=utf-8"
            });
        });
        $("#ajax08").click(function () {
            $.ajax({
               url:'/api/admin/ajax08',
               type:'post',
               data:{ //4个kv是三个参数,name和age是lover对象
                   'name':'凯撒',
                   'age':20,
                   'pageSize':5,
                   'page':2
               } ,
                dataType:'json',
                success:function (r) {
                   console.log(r)
                }
            });
        })
    });
</script>

</body>
</html>
