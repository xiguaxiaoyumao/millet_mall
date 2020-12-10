// 闪购倒计时
var round = document.getElementById("round");
var time = document.getElementsByClassName("time");
var flashSaleCountDown = document.getElementById("flashsale-countdown");
setInterval(function () {
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    switch (now.getHours()) {
        case 22:
        case 23:
        case 24:
        case 1: {
            round.innerHTML = 22 + ":00 场";
            hour = (25 - hour);
            minute = 59 - minute;
            second = 59 - second;
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            time[0].innerHTML = hour;
            time[1].innerHTML = minute;
            time[2].innerHTML = second;
            break;
        }
        case 2:
        case 3:
        case 4:
        case 5: {
            round.innerHTML = 02 + ":00 场";
            hour = 5 - hour;
            minute = 59 - minute;
            second = 59 - second;
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            time[0].innerHTML = hour;
            time[1].innerHTML = minute;
            time[2].innerHTML = second;
            break;
        }
        case 6:
        case 7:
        case 8:
        case 9: {
            round.innerHTML = 06 + ":00 场";
            hour = 9 - hour;
            minute = 59 - minute;
            second = 59 - second;
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            time[0].innerHTML = hour;
            time[1].innerHTML = minute;
            time[2].innerHTML = second;
            break;
        }
        case 10:
        case 11:
        case 12:
        case 13: {
            round.innerHTML = 10 + ":00 场";
            hour = 13 - hour;
            minute = 59 - minute;
            second = 59 - second;
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            time[0].innerHTML = hour;
            time[1].innerHTML = minute;
            time[2].innerHTML = second;
            break;
        }
        case 14:
        case 15:
        case 16:
        case 17: {
            round.innerHTML = 14 + ":00 场";
            hour = 17 - hour;
            minute = 59 - minute;
            second = 59 - second;
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            time[0].innerHTML = hour;
            time[1].innerHTML = minute;
            time[2].innerHTML = second;
            break;
        }
        case 18:
        case 19:
        case 20:
        case 21: {
            round.innerHTML = 18 + ":00 场";
            hour = 21 - hour;
            minute = 59 - minute;
            second = 59 - second;
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            time[0].innerHTML = hour;
            time[1].innerHTML = minute;
            time[2].innerHTML = second;
            break;
        }
    }
}, 1000)
function checkTime(num) {
    if (num < 10) {
        num = "0" + num;
    }
    return num;
}
// 分页显示
var swiperWrapper = document.getElementById("swiper-wrapper");
var swiper_flashsale_prev = document.querySelector(".swiper-flashsale-prev");
var swiper_flashsale_next = document.querySelector(".swiper-flashsale-next");
swiper_flashsale_prev.onclick = prev;
swiper_flashsale_next.onclick = next;
var page = 0;
swiper_flashsale_prev.classList.add("swiper-button-disabled");
function prev() {
    if (--page <= 0) {
        page = 0;
        swiper_flashsale_prev.classList.add("swiper-button-disabled");
    }
    else {
        swiper_flashsale_next.classList.remove("swiper-button-disabled");
    }
    var value = 987 * page;
    swiperWrapper.style = "transform: translate3d(-" + value + "px, 0px, 0px); transition-duration: 1000ms;";
}
function next() {
    if (++page >= 2) {
        page = 2;
        swiper_flashsale_next.classList.add("swiper-button-disabled");
    }
    else {
        swiper_flashsale_prev.classList.remove("swiper-button-disabled");
    }
    var value = 987 * page;
    swiperWrapper.style = "transform: translate3d(-" + value + "px, 0px, 0px); transition-duration: 1000ms;";
}