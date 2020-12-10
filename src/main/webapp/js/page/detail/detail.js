//获取轮播控件
var mainLeft = document.getElementById("J_mainLeft");
var lis = mainLeft.querySelectorAll("ol li");
var leftBtn = mainLeft.querySelector(".ban-l");
var rightBtn = mainLeft.querySelector(".ban-r");
var index = 0;
//设置轮播
setInterval(function () {
    var ul = mainLeft.querySelector(".slide-box .show");
    ul.style = "transform:translate(-" + 560 * index + "px,0);";
    setLiColor();
    index++;
    if (index >= 5) {
        index = 0;
    }
}, 4000);

//圆形按钮设置颜色
function setLiColor() {
    for (var i = 0; i < lis.length; i++) {
        if (i == index) {
            lis[i].style = "background-color:#fff;";
        } else {
            lis[i].style = "";
        }
    }
}

//左右按钮添加监听事件
leftBtn.onclick = function () {
    index--;
    if (index < 0) {
        index = 4;
    }
    var ul = mainLeft.querySelector(".slide-box .show");
    ul.style = "transform:translate(-" + 560 * index + "px,0);";
    setLiColor();
}
rightBtn.onclick = function () {
    index++;
    if (index == 5) {
        index = 0;
    }
    var ul = mainLeft.querySelector(".slide-box .show");
    ul.style = "transform:translate(-" + 560 * index + "px,0);";
    setLiColor();
}
//选择颜色
var mianRight = document.getElementById("J_mainRight");
var colorLis = mianRight.querySelectorAll(".option-box .color-option li");
var versionLis = mianRight.querySelectorAll(".option-box .version-option li");
var uls = mainLeft.querySelectorAll("ul");
var totalPrice = mianRight.querySelector(".select-list .total-price");
var selectColor = colorLis[0];
var selectVerson = versionLis[0];

//颜色选择事件
function colorClick() {
    var colorType = this.innerHTML;
    for (var i = 0; i < uls.length; i++) {
        if (uls[i].getAttribute("data-type") == colorType) {
            selectColor = this;
            uls[i].classList.remove("hide");
            uls[i].classList.add("show");
            this.style = "border-color: #ff6700;position: relative;z-index: 2";
        } else {
            uls[i].classList.add("hide");
            uls[i].classList.remove("show");
            colorLis[i].style = "";
        }
    }
}

//颜色按添加监听事件
for (var i = 0; i < colorLis.length; i++) {
    colorLis[i].onclick = colorClick;
}

//版本选择事件
function versonClick() {
    var price = this.getAttribute("data-price");
    totalPrice.innerHTML = "总计" + price + "元";
    for (var i = 0; i < versionLis.length; i++) {
        if (versionLis[i] == this) {
            selectVerson = this;
            this.style = "border-color: #ff6700;position: relative;z-index: 2";
        } else {
            versionLis[i].style = "";
        }
    }
}

//版本按添加监听事件
for (var i = 0; i < versionLis.length; i++) {
    versionLis[i].onclick = versonClick;
}

//加入购物车，喜欢
var saleBtn = mianRight.querySelector(".btn-box .sale-btn");
var likeBtn = mianRight.querySelector(".btn-box .like-btn");

//加入购物车事件
saleBtn.onclick = function () {
    //请求数据
    ajax({
        url: '/millet_mall/add_cart',
        type: 'POST',
        dataType: 'json',
        data: {
            'gds_id': this.getAttribute("data-id"),
            'gds_color': selectColor.innerHTML.trim(),
            'gds_type': selectVerson.innerHTML.trim(),
            'cart_price': selectVerson.getAttribute("data-price"),
            'gds_count': 1
        },
        success: function (response) {
            response = eval("(" + response + ")");
            console.log(response.objectMap.cart.cart_id);
            console.log(response.objectMap.cart.gds_id);
            if (response.errorCode === "100") {
                window.location = '/millet_mall/init_success_tip?cart_id=' + response.objectMap.cart.cart_id + '&gds_id=' + response.objectMap.cart.gds_id;
            } else {
                alert("添加失败");
            }
        },
        error: function (status) {
            alert("请求失败");
        }
    });
}

//添加喜欢
likeBtn.onclick = function () {
    //请求数据
    ajax({
        url: '/millet_mall/add_favorite',
        type: 'POST',
        dataType: 'json',
        data: {
            'gds_id': this.getAttribute("data-id"),
        },
        success: function (response) {
            response = eval("(" + response + ")");
            console.log(response);
            if (response.errorCode === "100") {
                alert("添加成功");
            } else {
                alert("请先登录");
                window.location = "/millet_mall/login.jsp";
            }
        },
        error: function (status) {
            alert("请求失败");
        }
    });
}


//创建ajax函数
function ajax(options) {
    console.log(options.data);
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
