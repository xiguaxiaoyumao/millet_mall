<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/base/reset.css">
    <link rel="stylesheet" href="css/base/clearfix.css">
    <link rel="stylesheet" href="css/common/minor_header.css">
    <link rel="stylesheet" href="css/common/recommend_list.css">
    <link rel="stylesheet" href="css/common/footer.css">
    <link rel="stylesheet" href="css/page/cart/cart.css">
    <link rel="icon" href="img/base/logo-icon.jpg">
    <title>我的购物车</title>
</head>

<body>
<!-- minor-header -->
<div class="site-header">
    <div class="container clearfix">
        <div class="header-logo">
            <a class="logo" href="init_index"
               style="background-image: url(img/base/logo.jpg);background-repeat: no-repeat;"></a>
        </div>
        <div class="header-title">
            <h2>我的购物车</h2>
        </div>
        <div class="site-topbar">
            <div class="topbar-info">
                    <span id="J_user" class="user">
                        <a href="javascript:void(0);" class="user-name">
                            <span class="name">${user.act_name}</span>
                        </a>
                        <div class="user-menu-wrapper" id="J_userMenuWrapper" style="height: 0px;">
                            <ul class="user-menu">
                                <li><a href="javascript:void(0);">个人中心</a></li>
                                <li><a href="javascript:void(0);">评价晒单</a></li>
                                <li><a href="javascript:void(0);">我的喜欢</a></li>
                                <li><a href="javascript:void(0);">小米账户</a></li>
                                <li><a href="/millet_mall/logout">退出登录</a></li>
                            </ul>
                        </div>
                    </span>
                <span class="sep">|</span>
                <a class="my-order" href="javascript:void(0);">我的订单</a>
            </div>
        </div>
    </div>
</div>
<!-- minor-header end -->
<!-- cart -->
<div class="cart-page">
    <div class="container">
        <div class="cart-wrap">
            <div id="J_cartGoodsList" class="cart-goods-list">
                <div class="list-head clearfix">
                    <div class="col col-check">
                        <div class="check-box-all"></div>
                        全选
                    </div>
                    <div class="col col-img"></div>
                    <div class="col col-name">商品名称</div>
                    <div class="col col-price">单价</div>
                    <div class="col col-num">数量</div>
                    <div class="col col-total">小计</div>
                    <div class="col col-action">操作</div>
                </div>
                <div class="list-body">
                    <div class="list-item">
                        <div class="item-box">
                            <div class="item-table">
                                <c:forEach items="${sessionScope.carts}" var="cart">
                                    <c:set var="goods" value="${sessionScope.gdsmap.get(cart.cart_id)}"
                                           scope="page"></c:set>
                                    <div class="item-row clearfix" data-cart-id="${cart.cart_id}">
                                        <div class="col col-check">
                                            <div class="check-box"></div>
                                        </div>
                                        <div class="col col-img">
                                            <a href="/millet_mall/init_detail?gds_id=${goods.gds_id}">
                                                <img src="img/goods/${goods.gds_def_img}" width="80px" height="80px">
                                            </a>
                                        </div>
                                        <div class="col col-name">
                                            <h3 class="name">
                                                <a href="/millet_mall/init_detail?gds_id=${goods.gds_id}">
                                                        ${goods.gds_name} ${cart.gds_type} ${cart.gds_color}
                                                </a>
                                            </h3>
                                        </div>
                                        <div class="col col-price">${cart.cart_price}元</div>
                                        <div class="col col-num">
                                            <div class="change-goods-num clearfix">
                                                <div class="sub">-</div>
                                                <input type="text" class="goods-num" value="${cart.gds_count}" disabled>
                                                <div class="plus">+</div>
                                            </div>
                                        </div>
                                        <div class="col col-total">5599元</div>
                                        <div class="col col-action">
                                            <div class="remove">×</div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="J_carBar" class="cart-bar clearfix">
                    <div class="section-left">
                        <a href="javascript:void(0);" class="back-shopping">继续购物</a>
                        <span class="cart-total">
                                共
                                <i class="total"></i>
                                件，已选择
                                <i class="selected"></i>
                                件
                            </span>
                    </div>
                    <span class="total-price">
                            合计:
                            <em></em>
                            元
                            <a href="javascript:void(0);" class="btn">去结算</a>
                    </span>
                </div>
            </div>
        </div>
        <div class="cart-recommend">
            <h2 class="recommend-title">
                <span>买购物车中商品的人还买了</span>
            </h2>
            <div class="recommend-goods">
                <ul id="J_recommendList" class="recommend-list clearfix">
                    <c:forEach items="${recommends}" var="recommend">
                        <li class="recommend-item">
                            <a href="javascript:void(0);">
                                <img src="img/goods/${recommend.gds_def_img}">
                                <div class="goods-name">${recommend.gds_name}</div>
                                <div class="goods-price">${recommend.gds_price}元</div>
                                <div class="goods-tips">4049人好评</div>
                            </a>
                            <div class="recommend-action">
                                <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- cart end -->
<!-- footer -->
<div class="footer">
    <!-- maintain -->
    <div class="maintain center">
        <ul>
            <li><a href="javascript:void(0);">预约维修服务</a><span class="sep">|</span></li>
            <li><a href="javascript:void(0);">7天无理由退货</a><span class="sep">|</span></li>
            <li><a href="javascript:void(0);">15天免费换货</a><span class="sep">|</span></li>
            <li><a href="javascript:void(0);">满150包邮</a><span class="sep">|</span></li>
            <li><a href="javascript:void(0);">520余家售后网点</a></li>
        </ul>
    </div>
    <!-- service -->
    <div class="service center">
        <div class="service-left">
            <dl>
                <dt><a href="javascript:void(0);">帮助中心</a></dt>
                <dd><a href="javascript:void(0);">账户管理</a></dd>
                <dd><a href="javascript:void(0);">购物指南</a></dd>
                <dd><a href="javascript:void(0);">订单操作</a></dd>
            </dl>
            <dl>
                <dt><a href="javascript:void(0);">服务支持</a></dt>
                <dd><a href="javascript:void(0);">售后政策</a></dd>
                <dd><a href="javascript:void(0);">自助服务</a></dd>
                <dd><a href="javascript:void(0);">相关下载</a></dd>
            </dl>
            <dl>
                <dt><a href="javascript:void(0);">线下门店</a></dt>
                <dd><a href="javascript:void(0);">小米之家</a></dd>
                <dd><a href="javascript:void(0);">服务网点</a></dd>
                <dd><a href="javascript:void(0);">授权体验店</a></dd>
            </dl>
            <dl>
                <dt><a href="javascript:void(0);">关于小米</a></dt>
                <dd><a href="javascript:void(0);">了解小米</a></dd>
                <dd><a href="javascript:void(0);">加入小米</a></dd>
                <dd><a href="javascript:void(0);">投资者关系</a></dd>
            </dl>
            <dl>
                <dt><a href="javascript:void(0);">关注我们</a></dt>
                <dd><a href="javascript:void(0);">新浪微博</a></dd>
                <dd><a href="javascript:void(0);">官方微信</a></dd>
                <dd><a href="javascript:void(0);">联系我们</a></dd>
            </dl>
            <dl>
                <dt><a href="javascript:void(0);">特色服务</a></dt>
                <dd><a href="javascript:void(0);">F码通道</a></dd>
                <dd><a href="javascript:void(0);">礼物码</a></dd>
                <dd><a href="javascript:void(0);">防伪查询</a></dd>
            </dl>
        </div>
        <div class="service-right">
            <h4>400-100-5678</h4>
            <p>周一至周日 8:00-18:00 </p>
            <p>(仅收市话费)</p>
            <a href="javascript:void(0);">联系客服</a>
        </div>
    </div>
    <!-- copyright -->
    <div class="copyright center">
        <div class="logo" style="background-image: url(img/base/logo.jpg);"></div>
        <div class="co-nav">
            <a href="javascript:void(0);">小米商城</a><span>|</span>
            <a href="javascript:void(0);">MIUI</a><span>|</span>
            <a href="javascript:void(0);">米家</a><span>|</span>
            <a href="javascript:void(0);">米聊</a><span>|</span>
            <a href="javascript:void(0);">多看</a><span>|</span>
            <a href="javascript:void(0);">游戏</a><span>|</span>
            <a href="javascript:void(0);">路由器</a><span>|</span>
            <a href="javascript:void(0);">米粉卡</a><span>|</span>
            <a href="javascript:void(0);">政企服务</a><span>|</span>
            <a href="javascript:void(0);">小米天猫店</a><span>|</span>
            <a href="javascript:void(0);">隐私政策</a><span>|</span>
            <a href="javascript:void(0);">问题反馈</a><span>|</span>
            <a href="javascript:void(0);">廉政举报</a><span>|</span>
            <a href="javascript:void(0);">Select Region</a><br>
            <p>@mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2017]1530-131号 <br>
                违法和不良信息举报电话: 185-0130-1238, 本网站所列数据,除特殊说明,所有数据均出自我司实验室测试</p>
        </div>
        <div class="co-img">
            <img src="img/common/truste.png">
            <img src="img/common/v-logo-1.png">
            <img src="img/common/v-logo-2.png">
            <img src="img/common/v-logo-3.png">
            <img src="img/common/v-logo-4.png">
        </div>
    </div>
    <!-- motto -->
    <div class="motto center">
        <h4>探索黑科技,小米为发烧而生! </h4>
    </div>
</div>
<!-- footer end -->
<script src="js/common/minor_header.js"></script>
<script src="js/page/cart/cart.js"></script>
<script src="js/common/recommend_list.js"></script>
</body>

</html>