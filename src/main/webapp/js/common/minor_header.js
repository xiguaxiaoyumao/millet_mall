// 悬浮下拉
var userMenuWrapper = document.getElementById("J_userMenuWrapper");
var user = document.getElementById("J_user");
user.onmouseover = function () {
    userMenuWrapper.style.height = "164px";
}
user.onmouseleave = function () {
    userMenuWrapper.style.height = "0px";
}