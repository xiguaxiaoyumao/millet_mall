//加入购物车
var cartGoodsList = document.getElementById("J_cartGoodsList");
var carBar = document.getElementById("J_carBar");

//购物车中商品操作
cartGoodsList.init = function () {
    //选择框
    var checkBoxAll = this.querySelector(".list-head .col-check .check-box-all");
    var checkBoxs = this.querySelectorAll(".item-box .item-row .check-box");
    //选择
    for (var i = 0; i < checkBoxs.length; i++) {
        checkBoxs[i].status = false;
        checkBoxs[i].onclick = selectThis;
        checkBoxs[i].onmouseover = checkMouseover;
        checkBoxs[i].onmouseleave = checkMouseleave;
    }
    //选择全部
    checkBoxAll.status = false;
    checkBoxAll.onclick = selectAll;
    checkBoxAll.onmouseover = checkMouseover;
    checkBoxAll.onmouseleave = checkMouseleave;

    //删除商品
    var removes = this.querySelectorAll(".item-box .item-row .col-action");
    //删除事件
    for (var i = 0; i < removes.length; i++) {
        removes[i].onclick = removeThis;
    }
    //改变商品数量
    var changeGoods = this.querySelectorAll(".col-num .change-goods-num");
    for (var i = 0; i < changeGoods.length; i++) {
        changeGoods[i].init = function () {
            var subBtn = this.querySelector(".sub");
            var plusBtn = this.querySelector(".plus");
            var num = this.querySelector(".goods-num");
            subBtn.onclick = function () {
                var cart = this.parentNode.parentNode.parentNode;
                var cart_id = cart.getAttribute("data-cart-id");
                var value = num.value;
                value--;
                if (value <= 0) {
                    value = 0;
                }
                ajax({
                    url: 'change_count',
                    type: 'POST',
                    dataType: 'json',
                    data: {"cart_id": cart_id, "gds_count": value},
                    success: function (response) {
                        response = eval("(" + response + ")");
                        //请求成功后执行的代码
                        console.log(response);
                        if (response.errorCode === "100") {
                            if (parseInt(value) == 0) {
                                var delBtn = cart.querySelector(".col-action");
                                delBtn.onclick();
                            } else {
                                num.value = value;
                                carBar.getTotal();
                            }
                        }
                    },
                    error: function (status) {
                        alert("操作失败");
                    }
                });
            }
            plusBtn.onclick = function () {
                var cart_id = this.parentNode.parentNode.parentNode.getAttribute("data-cart-id");
                var value = num.value;
                value++;
                ajax({
                    url: 'change_count',
                    type: 'POST',
                    dataType: 'json',
                    data: {"cart_id": cart_id, "gds_count": value},
                    success: function (response) {
                        response = eval("(" + response + ")");
                        //请求成功后执行的代码
                        console.log(response);
                        if (response.errorCode === "100") {
                            num.value = value;
                            carBar.getTotal();
                        }
                    },
                    error: function (status) {
                        alert("操作失败");
                    }
                });
            }
        }
        changeGoods[i].init();
    }

    //选择所有
    function selectAll() {
        if (this.status == false) {
            select(this);
            for (var i = 0; i < checkBoxs.length; i++) {
                select(checkBoxs[i]);
            }
        } else {
            cancelSelect(this);
            for (var i = 0; i < checkBoxs.length; i++) {
                cancelSelect(checkBoxs[i]);
            }
        }
        carBar.getTotal();
    }

    //选择当前
    function selectThis() {
        if (this.status == false) {
            select(this);
        } else {
            cancelSelect(this);
            cancelSelect(checkBoxAll);
        }
        carBar.getTotal();
    }

    //选中和取消选择
    function select(obj) {
        obj.innerHTML = "√";
        obj.style = "background-color:#ff6700;color:#fff";
        obj.status = true;
    }

    function cancelSelect(obj) {
        obj.innerHTML = "";
        obj.style = null;
        obj.status = false;
    }

    //鼠标移入移除
    function checkMouseover() {
        if (this.status == false) {
            this.innerHTML = "√";
        }
    }

    function checkMouseleave() {
        if (this.status == false) {
            this.innerHTML = "";
        }
    }

    //删除商品
    function removeThis() {
        var $this = this;
        var cart_id = $this.parentNode.getAttribute("data-cart-id");
        ajax({
            url: 'delete_cart',
            type: 'POST',
            dataType: 'json',
            data: {"cart_id": cart_id},
            success: function (response) {
                response = eval("(" + response + ")");
                //请求成功后执行的代码
                console.log(response);
                if (response.errorCode === "100") {
                    $this.parentNode.parentNode.removeChild($this.parentNode);
                    carBar.getTotal();
                }
            },
            error: function (status) {
                alert("删除失败");
            }
        });
    }

    var checkoutBtn = carBar.querySelector(".total-price .btn");
    checkoutBtn.onclick = function () {
        var flag = false;
        var list = new Array();
        for (var i = 0; i < checkBoxs.length; i++) {
            if (checkBoxs[i].status == true) {
                flag = true;
                var cart = {"cart_id": checkBoxs[i].parentNode.parentNode.getAttribute("data-cart-id")};
                list.push(cart);
            }
        }
        if (flag == false) {
            alert("请选择");
            return;
        }
        ajax({
            url: 'pre_checkout',
            type: 'POST',
            dataType: 'json',
            data: list,
            success: function (response) {
                response = eval("(" + response + ")");
                //请求成功后执行的代码
                console.log(response);
                if (response.errorCode === "100") {
                    window.location = "init_checkout";
                }
            },
            error: function (status) {
                alert("请求失败");
            }
        });
    }
}
//统计商品
carBar.getTotal = function () {
    //获取商品
    var goodsItems = cartGoodsList.querySelectorAll(".list-body .item-row");
    var totalPrice = this.querySelector(".total-price em");
    var totalNum = this.querySelector(".cart-total .total");
    var selectedNum = this.querySelector(".cart-total .selected");
    var priceSum = 0;
    var totalSum = 0;
    var selectSum = 0;
    //选择数量
    for (var i = 0; i < goodsItems.length; i++) {
        totalSum++;
        if (goodsItems[i].querySelector(".check-box").status == true) {
            selectSum++;
            priceSum += parseInt(goodsItems[i].querySelector(".col-price").innerHTML) * parseInt(goodsItems[i].querySelector(".goods-num").value);
        }
    }
    //显示
    totalPrice.innerHTML = priceSum;
    totalNum.innerHTML = totalSum;
    selectedNum.innerHTML = selectSum;

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

cartGoodsList.init();
carBar.getTotal();