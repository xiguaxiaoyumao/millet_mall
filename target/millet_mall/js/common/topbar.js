//获取购物车控件
var miniCartTrigger = document.getElementById("J_miniCartTrigger");
var miniCartBtn = document.getElementById("J_miniCartBtn");
var miniCartMenu = document.getElementById("J_miniCartMenu");
var delBtns = miniCartMenu.querySelectorAll(".cart-item .btn-del");
var loading = miniCartMenu.querySelector(".loading");
var msgEmpty = miniCartMenu.querySelector(".msg-empty");
var cartList = miniCartMenu.querySelector(".cart-list");
var cartItems = cartList.getElementsByTagName("li");
var cartTotal = miniCartMenu.querySelector(".cart-total");
var totalPrice = cartTotal.querySelector(".cart-total .price em");

//设置购物车当前状态
setStatus();
function setStatus() {
    if (cartItems.length == 0) {
        msgEmpty.classList.remove("hide");
        cartList.classList.add("hide");
        cartTotal.classList.add("hide");
        miniCartTrigger.classList.remove("topbar-cart-filled");
    } else {
        setTotalPrice();
        setGoodsCount();
        msgEmpty.classList.add("hide");
        cartList.classList.remove("hide");
        cartTotal.classList.remove("hide");
    }
}

//购物车添加鼠标移动事件
miniCartTrigger.onmouseover = miniCartBtnMouseover;
miniCartTrigger.onmouseleave = miniCartBtnMouseleave;

//购物车的鼠标触摸事件
function miniCartBtnMouseover() {
    var msgLastClass = msgEmpty.classList[msgEmpty.classList.length - 1];
    var loadLastClass = loading.classList[loading.classList.length - 1];
    var listLastClass = cartList.classList[cartList.classList.length - 1];
    var totalLastClass = cartTotal.classList[cartTotal.classList.length - 1];

    if (msgLastClass != "hide" || loadLastClass != "hide") {
        miniCartMenu.style = "height : 100px;"
        return;
    }
    if (listLastClass != "hide" && totalLastClass != "hide") {
        miniCartMenu.style = "height : auto;"
        return;
    }
}
function miniCartBtnMouseleave() {
    miniCartMenu.style = "height : 0px;"
}
//购物车添加删除事件
for (var i = 0; i < delBtns.length; i++) {
    delBtns[i].onclick = delLi;
}
//删除购物车项
function delLi() {
    var li = this.parentNode.parentNode;
    cartList.removeChild(li);
    setTotalPrice();
    setGoodsCount();
    if (cartItems.length == 0) {
        setStatus();
    }
    //向服务器请求删除
}

function setTotalPrice() {
    var prices = miniCartMenu.querySelectorAll(".cart-item .price");
    var counts = miniCartMenu.querySelectorAll(".cart-item .price em");
    var sum = 0;
    for (var i = 0; i < prices.length; i++) {
        sum = sum + parseFloat(prices[i].innerHTML)*parseInt(counts[i].innerHTML);
    }
    totalPrice.innerHTML = sum;
}
function setGoodsCount() {
    miniCartBtn.innerText = "购物车" + "(" + cartItems.length + ")";
    cartTotal.querySelector(".total").firstElementChild.innerHTML = cartItems.length;
}

//设置用户信息
var siteUserInfo = document.getElementById("J_siteUserInfo");
var user = siteUserInfo.querySelector(".user");
if (user != null) {
    user.onmouseover = userMouseover;
    user.onmouseleave = userMouseleave;
}
var userMenuWrapper = siteUserInfo.querySelector(".user-menu-wrapper");
function userMouseover() {
    userMenuWrapper.style = "height:160px;";
}
function userMouseleave() {
    userMenuWrapper.style = "height:0px;";
}