//获取选项卡和按钮
var homeHd = document.getElementById("J_homeHd");
var hotPage = document.getElementById("J_hotPage");
var telPage = document.getElementById("J_telPage");
var hotBtn = homeHd.querySelectorAll("ul li a", null)[0];
var telBtn = homeHd.querySelectorAll("ul li a", null)[1];

//切换选项卡
hotBtn.onmouseover = function () {
    hotBtn.style = "color: #ff6700; border-bottom: 2px solid #ff6700;";
    telBtn.style = "";
    hotPage.classList.remove("hide");
    telPage.classList.add("hide");
}
telBtn.onmouseover = function () {
    telBtn.style = "color: #ff6700; border-bottom: 2px solid #ff6700;";
    hotBtn.style = "";
    hotPage.classList.add("hide");
    telPage.classList.remove("hide");
}
//转发按钮
var hotForwardBtn = hotPage.querySelector(".more-product");
var telForwardBtn = telPage.querySelector(".more-product");
//请求转发
hotForwardBtn.onclick = function () {
    console.log("转发到更多热门");
}
telForwardBtn.onclick = function () {
    console.log("转发到更多电视音影");
}