//地址信息
var checkoutDetail = document.getElementById("J_checkoutDetail");
var resetBtns = checkoutDetail.querySelectorAll(".address-list .address-item .address-info .address-action");
var addBtn = checkoutDetail.querySelector(".add-desc .icon-plus");
var temp = checkoutDetail.querySelector(".address-list .hide");
var resetBtn = null;
var addressItems = checkoutDetail.querySelectorAll(".address-list .address-item");
//地址对话窗口的控件
var addressDialog = document.getElementById("J_addressDialog");
var confirmBtn = addressDialog.querySelector(".dialog-footer .btn-confirm");
var cancelBtn = addressDialog.querySelector(".dialog-footer .btn-cancel");
var btnClose = addressDialog.querySelector(".address-dialog .btn-close");
//对话框中表单
var phoneNameLabel = addressDialog.querySelector("#phone-name-label");
var phoneName = addressDialog.querySelector("#phone-name");
var phoneNumLabel = addressDialog.querySelector("#phone-num-label");
var phoneNum = addressDialog.querySelector("#phone-num");
var addressInfoLabel = addressDialog.querySelector("#address-info-label");
var addressInfo = addressDialog.querySelector("#address-info");
var addressDetailLabel = addressDialog.querySelector("#address-detail-label");
var addressDetail = addressDialog.querySelector("#address-detail");
var addressTagLabel = addressDialog.querySelector("#address-tag-label");
var addressTag = addressDialog.querySelector("#address-tag");
//获取底部地址控件
var footerDetail = document.getElementById("J_footerDetail");
var addressName = footerDetail.querySelector(".selecter-address .address-name");
var addressDesc = footerDetail.querySelector(".address-desc span");
var resetAdress = footerDetail.querySelector(".address-desc a");
var btnPrimary = footerDetail.querySelector(".btn-primary");
//遮盖罩
var cover = document.getElementById("cover");
//添加和修改
addBtn.onclick = showAddDialog;
for (var i = 0; i < resetBtns.length; i++) {
    resetBtns[i].onclick = showResetDialog;
}
//对话窗口中的按钮添加监听事件
confirmBtn.onclick = confirmReset;
cancelBtn.onclick = closeDialog;
btnClose.onclick = closeDialog;
//表单各项添加监听事件
phoneName.onfocus = phoneNameFocus;
phoneName.onblur = phoneNameBlur;
phoneNum.onfocus = phoneNumFocus;
phoneNum.onblur = phoneNumBlur;
addressInfo.onfocus = addressInfoFocus;
addressInfo.onblur = addressInfoBlur;
addressDetail.onfocus = addressDetailFocus;
addressDetail.onblur = addressDetailBlur;
addressTag.onfocus = addressTagFocus;
addressTag.onblur = addressTagBlur;
//每一项地址添加监听事件
for (var i = 0; i < addressItems.length; i++) {
    addressItems[i].onclick = selectAddress;
}

function showResetDialog(e) {
    if (e || e.stopPropagation) {
        e.stopPropagation();
    } else {
        //才用IE的停止事件冒泡的方法
        window.event.CancelBubble = true;
    }
    resetBtn = this;
    addressDialog.style = "display:block;";
    cover.style = "height:" + document.body.clientHeight + "px;display:block";
    getValue(this.parentNode);
    phoneNameBlur();
    phoneNumBlur();
    addressInfoBlur();
    addressDetailBlur();
    addressTagBlur();
}

function closeDialog() {
    cover.style = "display:none;";
    addressDialog.style = "display:none;";
    setVlaueEmpty();
    phoneNameBlur();
    phoneNumBlur();
    addressInfoBlur();
    addressDetailBlur();
    addressTagBlur();
}

function confirmReset() {
    if (resetBtn == null) {
        if (!checkValue()) {
            return;
        }
        var addressInfoPa = temp.cloneNode(true);
        addressInfoPa.classList.remove("hide");
        resetBtn = addressInfoPa.querySelector(".address-info .address-action");
        resetBtn.onclick = showResetDialog;
        addressInfoPa.onclick = selectAddress;
        temp.parentNode.insertBefore(addressInfoPa, addBtn.parentNode.parentNode);
        setValue(addressInfoPa.firstElementChild);

        closeDialog();
        return;
    }
    if (!checkValue()) {
        return;
    }
    var addressInfoPa = resetBtn.parentNode;
    setValue(addressInfoPa);
    closeDialog();
}

function showAddDialog(e) {
    if (e || e.stopPropagation) {
        e.stopPropagation();
    } else {
        //才用IE的停止事件冒泡的方法
        window.event.CancelBubble = true;
    }
    addressDialog.style = "display:block;";
    cover.style = "height:" + document.body.clientHeight + "px;display:block";
}


function phoneNameFocus() {
    phoneNameLabel.style = "top:-8px;left:16px;font-size:12px;color:#ff6700;background-color: #f5f5f5;";
    phoneName.style = "border-color: #ff6700;";
}

function phoneNameBlur() {
    if (phoneName.value != "") {
        phoneNameLabel.style = "top:-8px;left:16px;font-size:12px;color:#000;background-color: #f5f5f5;";
        phoneName.style = "";
        return;
    }
    phoneNameLabel.style = "";
    phoneName.style = "";
}

function phoneNumFocus() {
    phoneNumLabel.style = "top:-8px;left:335px;font-size:12px;color:#ff6700;background-color: #f5f5f5;";
    phoneNum.style = "border-color: #ff6700;";
};

function phoneNumBlur() {
    if (phoneNum.value != "") {
        phoneNumLabel.style = "top:-8px;left:335px;font-size:12px;color:#000;background-color: #f5f5f5;";
        phoneNum.style = "";
        return;
    }
    phoneNumLabel.style = "";
    phoneNum.style = "";
};

function addressInfoFocus() {
    addressInfoLabel.style = "top:-8px;left:16px;font-size:12px;color:#ff6700;background-color: #fff;";
    addressInfo.style = "border-color: #ff6700;";
};

function addressInfoBlur() {
    if (addressInfo.value != "") {
        addressInfoLabel.style = "top:-8px;left:16px;font-size:12px;color:#000;background-color: #fff;";
        addressInfo.style = "";
        return;
    }
    addressInfoLabel.style = "";
    addressInfo.style = "";
};

function addressDetailFocus() {
    addressDetailLabel.style = "top:-8px;left:16px;font-size:12px;color:#ff6700;background-color: #fff;";
    addressDetail.style = "border-color: #ff6700;";
};

function addressDetailBlur() {
    if (addressDetail.value != "") {
        addressDetailLabel.style = "top:-8px;left:16px;font-size:12px;color:#000;background-color: #fff;";
        addressDetail.style = "";
        return;
    }
    addressDetailLabel.style = "";
    addressDetail.style = "";
};

function addressTagFocus() {
    addressTagLabel.style = "top:-8px;left:16px;font-size:12px;color:#ff6700;background-color: #fff;";
    addressTag.style = "border-color: #ff6700;";
};

function addressTagBlur() {
    if (addressTag.value != "") {
        addressTagLabel.style = "top:-8px;left:16px;font-size:12px;color:#000;background-color: #fff;";
        addressTag.style = "";
        return;
    }
    addressTagLabel.style = "";
    addressTag.style = "";
};

function getValue(obj) {
    var addressInfoPa = obj;
    var name = addressInfoPa.querySelector(".name");
    var tel = addressInfoPa.querySelector(".tel");
    var adressCon = addressInfoPa.querySelector(".address-con");
    phoneName.value = name.firstElementChild.innerHTML;
    phoneNum.value = tel.innerHTML;
    addressInfo.value = adressCon.firstElementChild.innerHTML;
    addressDetail.value = adressCon.lastElementChild.innerHTML;
    addressTag.value = name.lastElementChild.innerHTML;
}

function setValue(obj) {
    addressInfoPa = obj;
    var name = addressInfoPa.querySelector(".name");
    var tel = addressInfoPa.querySelector(".tel");
    var adressCon = addressInfoPa.querySelector(".address-con");
    var pohoneNumStr = phoneNum.value.toString();
    var address_id = addressInfoPa.parentNode.getAttribute("data-address-id");
    var address_default = addressInfoPa.parentNode.getAttribute("data-address-default");
    var address = {
        "address_id": address_id,
        "user_name": phoneName.value,
        "phone": phoneNum.value,
        "address": addressInfo.value,
        "address_detail": addressDetail.value,
        "label": addressTag.value,
        "address_default": address_default
    };
    ajax({
        url: 'update_address',
        type: 'POST',
        dataType: 'json',
        data: address,
        success: function (response) {
            response = eval("(" + response + ")");
            //请求成功后执行的代码
            console.log(response);
            if (response.errorCode === "100") {
                name.firstElementChild.innerHTML = phoneName.value;
                pohoneNumStr = pohoneNumStr.substr(0, 3) + "****" + pohoneNumStr.substr(7);
                tel.innerHTML = pohoneNumStr;
                adressCon.firstElementChild.innerHTML = addressInfo.value;
                adressCon.lastElementChild.innerHTML = addressDetail.value;
                name.lastElementChild.innerHTML = addressTag.value;
                addressInfoPa.parentNode.setAttribute("data-address-id", response.objectMap.address.address_id)
                addressInfoPa.parentNode.setAttribute("data-address-default", response.objectMap.address.address_default)
            } else {
                alert("修改失败");
            }
        },
        error: function (status) {
            alert("连接失败");
        }
    });
}

function setVlaueEmpty() {
    resetBtn = null;
    phoneName.value = "";
    phoneNum.value = "";
    addressInfo.value = "";
    addressDetail.value = "";
    addressTag.value = "";
}

function checkValue() {
    if (phoneName.value == "" || phoneNum.value == "" || addressInfo.value == "" || addressDetail.value == "" || addressTag.value == "") {
        return false;
    }
    return true;
}

var address_id = null;

//选择地址
function selectAddress() {
    addressItems = checkoutDetail.querySelectorAll(".address-list .address-item");
    for (var i = 0; i < addressItems.length; i++) {
        if (addressItems[i] != this) {
            addressItems[i].style = "";
        }
    }
    address_id = this.getAttribute("data-address-id");
    this.style = "border-color:#ff6700";
    var name = this.querySelector(".name");
    var tel = this.querySelector(".tel");
    var adressCon = this.querySelector(".address-con");
    addressName.innerHTML = name.innerHTML + tel.innerHTML;
    addressDesc.innerHTML = adressCon.innerHTML;
    resetAdress.innerHTML = "修改";
    btnPrimary.innerHTML = "提交订单"
}

//提交订单事件
btnPrimary.onclick = function () {
    if (this.innerHTML != "提交订单" || address_id == null) {
        return;
    }
    window.location.href = 'init_confirm?address_id='+address_id;
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
        xhr.open('POST', options.url, false);
        //设置表单提交时的内容类型
        xhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
        xhr.send(params);
    }
}