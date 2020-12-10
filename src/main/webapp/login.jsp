<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/base/reset.css">
    <link rel="stylesheet" href="css/common/minor-footer.css">
    <link rel="stylesheet" href="css/page/login/login.css">
    <link rel="icon" href="img/base/logo-icon.jpg">
    <title>小米账号 - 登录</title>
</head>

<body>
<!-- main-container -->
<div class="main-container">
    <!-- top -->
    <div class="top" style="background-image: url(img/page/login/top-logo.png);"></div>
    <!-- banner -->
    <div class="banner" style="background-image: url(img/page/login/login-background.jpg);">
        <div class="banner-box">
            <a href="javascript:void(0);" class="id-login" id="id-login" onclick="id_login()">账号登录</a>
            <span style="color: #e0e0e0">|</span>
            <a href="javascript:void(0);" class="scan-login" id="scan-login" onclick="scan_login()">扫码登陆</a>
            <div class="id-login-box" id="id-login-box">
                <div id="J_login">
                    <input class="username" type="text" placeholder="邮箱/手机号/小米ID"/>
                    <input class="password" type="password" placeholder="请输入密码"/>
                    <input class="login-button" style="background-color: #F56600; border: none; color: white;"
                           type="button" value="登录"/>
                </div>
                <span class="msg-regist">
                        <a href="javascript:void(0);" style="color: #f56600;">手机短信登陆/注册</a>
                    </span>
                <span class="immediate-regist">
                        <a href="javascript:void(0);" style="color: black;">立即注册</a>
                        <span>|</span>
                        <a href="javascript:void(0);" style="color: black;">忘记密码?</a>
                    </span>
            </div>
            <div class="other-login-logo">
                <img src="img/page/login/other-login-logo.png"/>
            </div>
        </div>
    </div>
    <div class="scan-login-box" id="scan-login-box">
        <img style="margin-left: 63px;" src="img/page/login/qr-code.png"/>
        <p>使用<span style="color:#f56600 ;">小米商城APP</span>扫一扫</p>
        <p>小米手机可打开&lceil;设置&rfloor;&nbsp;&gt;&nbsp;&lceil;小米账号&rfloor;&nbsp;扫码登陆</p>
    </div>
</div>
<!-- minor-footer -->
<div class="minor-footer">
    <ul>
        <li class="left-li">
            <a href="javascript:void(0);">简体</a>
        </li>
        <li>|</li>
        <li>
            <a href="javascript:void(0);">繁体</a>
        </li>
        <li>|</li>
        <li>
            <a href="javascript:void(0);">English</a>
        </li>
        <li>|</li>
        <li>
            <a href="javascript:void(0);">常见问题</a>
        </li>
    </ul>
    <p>小米公司版权所有-京ICP备10046444-<img src="img/common/ghs.png">京公网安备11010802020134号-京ICP证110507号</p>
</div>
<!-- minor-footer end -->

</body>
<script src="js/page/login/login.js"></script>
<script>
    var loginBox = document.getElementById("J_login");
    var loginBtn = loginBox.querySelector(".login-button");
    var usernameInput = loginBox.querySelector(".username");
    var passwordInput = loginBox.querySelector(".password");
    loginBtn.onclick = function () {
        var username = usernameInput.value;
        var password = passwordInput.value;

        //请求数据
        ajax({
            url: '/millet_mall/login',
            type: 'POST',
            dataType: 'json',
            data: {'act_name': username, 'act_password': password},
            success: function (response) {
                response = eval("(" + response + ")");
                //请求成功后执行的代码
                console.log(response);
                if (response.errorCode === "100") {
                    alert("登录成功");
                    window.location = '/millet_mall/init_index';
                }else{
                    alert("账号或者密码错误");
                }
            },
            error: function (status) {
                alert("登录失败");
                //失败后执行的代码
                window.location = '/millet_mall/login.jsp';
            }
        });
    }

    //创建ajax函数
    function ajax(options) {
        console.log(options.type);
        params = JSON.stringify(options.data);
        console.log(params);
        //创建-第一步
        var xhr;
        //非IE6
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            //ie6及其以下版本浏览器
            xhr = ActiveXObject('Microsoft.XMLHTTP');
        }

        //接收-第三步
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                var status = xhr.status;
                if (status >= 200 && status < 300) {
                    options.success && options.success(xhr.responseText);
                } else {
                    options.error && options.error(status);
                }
            }
        }

        //连接和发送-第二步
        if (options.type == 'GET') {
            xhr.open('GET', options.url + '?' + params, true);
            xhr.send(null);
        } else if (options.type == 'POST') {
            xhr.open('POST', options.url, true);
            //设置表单提交时的内容类型
            xhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
            xhr.send(params);
        }
    }
</script>

</html>