
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/res/layui-v2.5.6/layui/css/layui.css">
    <script src="/res/layui-v2.5.6/layui/layui.js"></script>
</head>
<body>
<div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>注册</legend>
    </fieldset>
    <form class="layui-form" action="" onsubmit="return false">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="adminName"  class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="adminPwd"  class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">重置密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="adminPwdR"  class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="adminTime" id="adminTime" placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">爱好</label>
            <div class="layui-input-block">
                <input type="checkbox" name="hobby" title="听音乐">
                <input type="checkbox" name="hobby" title="阅读" checked="">
                <input type="checkbox" name="hobby" title="玩游戏">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">就业城市</label>
            <div class="layui-input-inline">
                <select name="city">
                    <option value="">请选择</option>
                    <option value="浙江">浙江</option>
                    <option value="上海">上海</option>
                    <option value="杭州">杭州</option>
                </select>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">是否专升本</label>
                <div class="layui-input-block">
                    <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="是|否">
                </div>
            </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="regBtn">立即注册</button>
                <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['form','layer','jquery','laydate'],function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var laydate = layui.laydate;

        //日期选择器
        laydate.render({
            elem: '#adminTime'
            ,type: 'datetime'
        });

        form.on('submit(regBtn)',function (data) {
            //layer.msg(JSON.stringify(data.field));
            $.ajax({
                //url:'/api/admin/reg',
                url:'/api/admin/regByBean',
                type:'POST',
                data:data.field,
                dataType:'json',
                success:function (res) {
                    console.log(res)
                    if (res.code==0){
                        window.location.href="pages/login"
                    }
                    if (res.code==4401){
                        layer.msg("你输入的密码和重复密码不一致,注册失败")
                    } else{
                        layer.msg("先写完整表单")
                    }
                }
            });
        });
    });
</script>

</body>
</html>
