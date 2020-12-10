//获取banner中控件
var banner = document.getElementById("J_banner");
var slideshow = banner.querySelector(".slideshow");
var liBtns = banner.querySelectorAll("ol li");
var lastBtn = banner.querySelector(".ban-l");
var nextBtn = banner.querySelector(".ban-r");
var slideshowList =
    [
        'img/page/index/slideshow-1.jpg',
        'img/page/index/slideshow-2.jpg',
        'img/page/index/slideshow-3.jpg',
        'img/page/index/slideshow-4.jpg',
        'img/page/index/slideshow-5.jpg'
    ];
//自动轮播
var index = 0;  //当前图片索引
var lenght = slideshowList.length;
setInterval(() => {
    slideshow.src = slideshowList[index];
    setLiBtns();
    index++;
    if (index == lenght) {
        index = 0;
    }
}, 3000);
//设置圆形按钮状态
function setLiBtns() {
    for (var i = 0; i < 5; i++) {
        if (i == index) {
            liBtns[i].style = "background-color: #fff;";
        } else {
            liBtns[i].style = "background-color: #3d3838;";
        }
    }
}
//为圆点按钮添加监听事件
for (var i = 0; i < lenght; i++) {
    liBtns[i].onclick = liBtnClick;
}
function liBtnClick() {
    for (var i = 0; i < lenght; i++) {
        if (liBtns[i] == this) {
            index = i;
            slideshow.src = slideshowList[index];
            setLiBtns();
        }
    }
}
//矩阵按钮添加监听事件
nextBtn.onclick = nextImg;
lastBtn.onclick = lastImg;
function nextImg() {
    index++;
    if (index >= lenght) {
        index = 0;
    }
    slideshow.src = slideshowList[index];
    setLiBtns();
}
function lastImg() {
    index--;
    if (index <= 0) {
        index = lenght - 1;
    }
    slideshow.src = slideshowList[index];
    setLiBtns();
}