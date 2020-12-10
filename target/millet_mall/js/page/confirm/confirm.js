//显示详情和隐藏详情
var comfirmOrder = document.getElementById("J_comfirmOrder");
var showDetailBtn = comfirmOrder.querySelector(".fr .show-detail");
var adressInfoP = comfirmOrder.querySelector(".fl .address-info");
var orderDetail = comfirmOrder.querySelector(".order-detail");
var len = orderDetail.querySelector("ul").length;
var flag1 = 0;//隐藏详情
showDetailBtn.onclick = function () {
    flag1 == 0 ? flag1 = 1 : flag1 = 0;
    if (flag1 == 1) {
        adressInfoP.classList.add("hide");
        orderDetail.style = "height:" + 165 * len + "px;"
    } else {
        adressInfoP.classList.remove("hide");
        orderDetail.style = "height:0px;"
    }
}
//支付宝支付
var cover = document.getElementById("cover");
var alipayDialog = document.getElementById("J_alipayDialog");
var closeBtn = alipayDialog.querySelector(".btn-close");
var paymentBox = document.getElementById("J_paymentBox");
var alipayBtn = paymentBox.querySelector(".payment-list .alipay");
alipayBtn.onclick = function () {
    alipayDialog.style = "display:block;";
    cover.style = "height:" + document.body.clientHeight + "px;display:block";
    setTimeout(function () {
        window.location.href = 'pay_success.jsp';
    }, 3000);
}
closeBtn.onclick = function () {
    alipayDialog.style = "display:none;";
    cover.style = "";
}
//更多支付方式和收起更多支付方式
var payBox = document.getElementById("J_payBox");
var banks = payBox.querySelectorAll(".payment-body .payment-list .bank");
var moreBtn = payBox.querySelector(".payment-body .payment-list .more-btn");
var flag2 = 0;//没有全部显示的状态
moreBtn.onclick = function () {
    flag2 == 0 ? flag2 = 1 : flag2 = 0;
    if (flag2 == 1) {
        for (var i = 0; i < banks.length; i++) {
            if (i > 10) {
                banks[i].classList.remove("hide");
            }
        }
        this.innerHTML = "收起更多";
    } else {
        for (var i = 0; i < banks.length; i++) {
            if (i > 10) {
                banks[i].classList.add("hide");
            }
        }
        this.innerHTML = "查看更多";
    }
}