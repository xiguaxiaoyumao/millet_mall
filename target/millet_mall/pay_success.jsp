<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/base/reset.css">
    <link rel="stylesheet" href="css/base/clearfix.css">
    <link rel="stylesheet" href="css/common/topbar.css">
    <link rel="stylesheet" href="css/common/herder.css">
    <link rel="stylesheet" href="css/common/recommend_list.css">
    <link rel="stylesheet" href="css/common/footer.css">
    <link rel="stylesheet" href="css/page/pay_success/pay_success.css">
    <link rel="icon" href="img/base/logo-icon.jpg">
    <title>支付成功</title>
</head>

<body>
<!-- topbar -->
<div class="site-topbar">
    <div class="container">
        <div class="topbar-nav">
            <a href="/millet_mall/init_index">小米商城</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">MIUI</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">loT</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">云服务</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">金融</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">有品</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">小爱开放平台</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">政企团购</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">资质证照</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">协议规划</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">下载app</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);">智能生活</a>
            <span class="sep">|</span>
            <a href="javascript:void(0);"> Select Location</a>
        </div>
        <div id="J_miniCartTrigger" class="topbar-cart topbar-cart-filled">
            <a id="J_miniCartBtn" href="javascript:void(0);" class="cart-mini">
                购物车
                <span id="J_cartNum" class="cart-mini-num"></span>
            </a>
            <div id="J_miniCartMenu" class="cart-menu" style="height: 0px;">
                <div class="menu-content">
                    <div class="msg-empty">购物车中还没有商品，赶紧选购吧！</div>
                    <div class="loading hide">
                        <div class="loader"></div>
                    </div>
                    <ul class="cart-list" style="height: auto;">
                        <c:if test="${not empty sessionScope.carts}">
                            <c:forEach items="${sessionScope.carts}" var="cart">
                                <c:set var="goods" value="${sessionScope.gdsmap.get(cart.cart_id)}"
                                       scope="page"></c:set>
                                <li>
                                    <div class="cart-item clearfix">
                                        <a class="thumb" href="/millet_mall/init_detail?gds_id=${goods.gds_id}"
                                           target="_blank">
                                            <img src="img/goods/${goods.gds_def_img}">
                                        </a>
                                        <a class="name" href="/millet_mall/init_detail?gds_id=${goods.gds_id}"
                                           target="_blank">
                                                ${goods.gds_name} ${cart.gds_type} ${cart.gds_color}
                                        </a>
                                        <span class="price">
                                                ${cart.cart_price}元 × <em>${cart.gds_count}</em>
                                    </span>
                                        <a class="btn-del" href="javascript: void(0);">
                                            <em class="iconfont-close">×</em>
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <div class="cart-total clearfix ">
                            <span class="total">
                                共<em></em>件商品
                                <span class="price">
                                    <em></em>元
                                </span>
                            </span>
                        <a href="/millet_mall/init_cart" class="btn-cart">去购物车结算</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="J_siteUserInfo" class="topbar-info">
            <c:if test="${not empty user}">
                <span class="user">
                    <a class="user-name" href="javascript:void(0);" target="_blank">
                        <span class="name">${sessionScope.user.act_name}</span>
                        <i class="iconfont-arrow-down-mini"></i>
                    </a>
                    <div class="user-menu-wrapper" style="height: 0px;">
                        <ul class="user-menu">
                            <li><a href="javascript:void(0);" target="_blank">个人中心</a></li>
                            <li><a href="javascript:void(0);" target="_blank">评价晒单</a></li>
                            <li><a href="javascript:void(0);" target="_blank">我的喜欢</a></li>
                            <li><a href="javascript:void(0);" target="_blank">小米账户</a></li>
                            <li><a id="J_userLogout"
                                   href="javascript:window.location='/millet_mall/logout';">退出登录</a></li>
                        </ul>
                    </div>
                </span>
                <span class="sep">|</span>
                <span class="message">
                <a href="javascript:void(0);">
                    消息通知
                    <i class="J_miMessageTotal"></i>
                </a>
                </span>
                <span class="sep">|</span>
                <a class="link-order" href="javascript:void(0);" target="_blank">我的订单</a>
            </c:if>
            <!-- 未登录 -->
            <c:if test="${empty user}">
                <span>
                    <a href="login.jsp">登录</a>
                </span>
                <span class="sep">|</span>
                <span>
                    <a href="javascript:void(0);">注册</a>
                </span>
                <span class="sep">|</span>
                <span class="message">
                    <a href="javascript:void(0);">
                        消息通知
                        <i class="J_miMessageTotal"></i>
                    </a>
                </span>
            </c:if>
        </div>
    </div>
</div>
<!-- topbar end -->
<!-- header -->
<div class="site-header">
    <div class="container clearfix">
        <div class="header-logo" onclick="javascript:location='/millet_mall/init_index'"
             style="background-image: url(img/base/logo.jpg);"></div>
        <div class="header-nav">
            <ul class="nav-list clearfix" id="J_navList">
                <li class="nav-item" data-type="mi-phone"><a href="javascript:void(0)">小米手机</a></li>
                <li class="nav-item" data-type="redmi-phone"><a href="javascript:void(0);">Redmi红米</a></li>
                <li class="nav-item"><a href="javascript:void(0)">电视</a></li>
                <li class="nav-item"><a href="javascript:void(0);">笔记本</a></li>
                <li class="nav-item"><a href="javascript:void(0);">家电</a></li>
                <li class="nav-item"><a href="javascript:void(0);">路由器</a></li>
                <li class="nav-item"><a href="javascript:void(0);">智能硬件</a></li>
                <li class="nav-item"><a href="javascript:void(0);">服务</a></li>
                <li class="nav-item"><a href="javascript:void(0);">社区</a></li>
            </ul>
        </div>
        <form id="J_searchForm" class="header-search">
            <input type="text" placeholder="电视" value="">
            <div class="btn" style="background-image: url(img/common/search.jpg);"></div>
        </form>
    </div>
    <!-- 下拉框 -->
    <div id="J_navMenu" class="header-nav-menu" style="display: none; height: 0px;">
        <div class="container">
            <ul class="children-list clearfix">
                <c:forEach items="${requestScope.mis}" var="mi">
                    <li class="first" data-type="${mi.gds_class}">
                        <a href="init_detail?gds_id=${mi.gds_id}"
                           target="_blank">
                            <div class="figure figure-thumb">
                                <img src="img/goods/${mi.gds_def_img}" alt="${mi.gds_name}">
                            </div>
                            <div class="title">${mi.gds_name}</div>
                            <p class="price">${mi.gds_price}元起</p>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach items="${requestScope.redMis}" var="redmi">
                    <li class="first" data-type="${redmi.gds_class}">
                        <a href="init_detail?gds_id=${redmi.gds_id}"
                           target="_blank">
                            <div class="figure figure-thumb">
                                <img src="img/goods/${redmi.gds_def_img}" alt="${redmi.gds_name}">
                            </div>
                            <div class="title">${redmi.gds_name}</div>
                            <p class="price">${redmi.gds_price}元起</p>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!-- 下拉框 end -->
</div>
<!-- header end -->
<!-- pay_success -->
<div class="page-main">
    <div class="container pay-success-box clearfix">
        <div class="succ">
            <h2 class="title">支付成功</h2>
            <p class="price">
                <em>5609</em>
                元
            </p>
            <a href="javascript:void(0);" class="btn">查看订单详情</a>
            <p class="state">
                小米公司不会以任何理由要求您提供银行卡信息或支付额外费用<br>
                请谨防钓鱼链接或诈骗电话。
                <a href="javascript:void(0);">了解详情></a>
            </p>
        </div>
        <div class="info">
            <ul>
                <li class="clearfix">
                    <div class="label">订单编号：</div>
                    <div class="content">5201022706849493</div>
                </li>
                <li class="clearfix">
                    <div class="label">收货信息：</div>
                    <div class="content">
                        张海涛 180****6641<br>
                        湖南 株洲市天元区 泰山路街道88号湖南工业大学新校区东苑四栋
                        <p>* 在“订单详情页”你可以确认收货地址或者更改收货地址</p>
                    </div>
                </li>
                <li class="clearfix">
                    <div class="label">商品名称：</div>
                    <div class="content">小米记事本 单品（黑色）</div>
                </li>
                <li class="clearfix">
                    <div class="label">发票信息：</div>
                    <div class="content">电子普通发票 个人</div>
                </li>
            </ul>
            <div class="app-code">
                <img src="img/page/pay_success/app-code.png" alt="">
                通过小米商城app
                <br>
                随时跟踪订单
            </div>
        </div>

    </div>
</div>
<!-- pay_success end -->
<!-- cart-recommend -->
<div class="container">
    <div class="cart-recommend">
        <h2 class="recommend-title">
            <span>买购物车中商品的人还买了</span>
        </h2>
        <div class="recommend-goods">
            <ul id="J_recommendList" class="recommend-list clearfix">
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
                <li class="recommend-item">
                    <a href="javascript:void(0);">
                        <img src="img/page/cart/recommend-goods.jpg">
                        <div class="goods-name">黑鲨游戏 Type-C 耳机</div>
                        <div class="goods-price">99元</div>
                        <div class="goods-tips">4049人好评</div>
                    </a>
                    <div class="recommend-action">
                        <a href="javascript:void(0);" class="recommend-btn">加入购物车</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- cart-recommend end -->
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
<!-- end -->
<script src="js/common/topbar.js"></script>
<script src="js/common/header.js"></script>
<script src="js/common/recommend_list.js"></script>
<script src="js/page/pay_success/pay_success.js"></script>
</body>

</html>