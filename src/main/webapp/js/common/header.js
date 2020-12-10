//获取表单控件
var searchForm = document.getElementById("J_searchForm");
var searchText = searchForm.querySelector("input");
var searchBtn = searchForm.querySelector("div");

//开启搜索框类容滚动
var arr = ["电视", "手机", "个护", "耳机"];
var length = arr.length;
var i = 0;
setInterval(function () {
    searchText.placeholder = arr[i % length];
    i++;
}, 3000);

//搜索
searchBtn.onclick = function () {
    if (searchText.value != "") {
        console.log(searchText.value);
    } else {
        console.log(searchText.placeholder);
    }
}
/* 悬浮下拉 */
var navList = document.getElementById("J_navList");
var navItems = navList.getElementsByTagName("li");
var navMenu = document.getElementById("J_navMenu");
var menuItems = navMenu.querySelectorAll("ul li");
//为所有导航项添加监听事件
for (var i = 0; i < navItems.length; i++) {
    navItems[i].onmouseover = itemMouserover;
    navItems[i].onmouseleave = itemMouserleave;

}
//为下拉框添加监听事件
navMenu.onmouseover = itemMouserover;
navMenu.onmouseleave = itemMouserleave;

function itemMouserover() {
    var type = this.getAttribute("data-type");
    if (type != undefined && type == "mi-phone") {
        setProduct(type);
    }
    if (type != undefined && type == "redmi-phone") {
        setProduct(type);
    }
    navMenu.style = "display: block; transition: all .3s ease .3s; height : 229px;";
}
function itemMouserleave() {
    navMenu.style = "display: block; height : 0px;";
}
function setProduct(type) {
    var first = 0;
    for (var i = 0; i < menuItems.length; i++) {
        if (menuItems[i].getAttribute("data-type") == type) {
            menuItems[i].classList.remove("hide");
            if (first == 0) {
                menuItems[i].classList.add("first");
                first++;
            }
        }
        else {
            menuItems[i].classList.add("hide");
            menuItems[i].classList.remove("first");
        }
    }
}