var recommendList = document.getElementById("J_recommendList");

//商品推荐
recommendList.init = function () {
    var addCartBtns = this.querySelectorAll(".recommend-action");
    for (var i = 0; i < addCartBtns.length; i++) {
        addCartBtns[i].onclick = addCart;
    }
    //加入购物车
    function addCart() {
        console.log("加入购物车");
    }
}

recommendList.init();