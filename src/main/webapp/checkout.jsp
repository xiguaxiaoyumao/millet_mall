<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/base/reset.css">
    <link rel="stylesheet" href="css/base/clearfix.css">
    <link rel="stylesheet" href="css/common/minor_header.css">
    <link rel="stylesheet" href="css/common/footer.css">
    <link rel="stylesheet" href="css/page/checkout/checkout.css">
    <link rel="icon" href="img/base/logo-icon.jpg">
    <title>确认订单</title>
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
            <h2>确认订单</h2>
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
<!-- checkout-page-main -->
<div class="checkout-page-main">
    <div class="container clearfix">
        <div id="J_checkoutDetail" class="checkout-detail">
            <div class="detail-section address-detail">
                <div class="address-header">
                        <span class="header-title">
                            收货地址
                        </span>
                </div>
                <div class="address-list">
                    <div class="address-item hide" data-address-id="-1" data-address-default="0">
                        <div class="address-info">
                            <div class="name">
                                <div style="display: inline;"></div>
                                <span></span>
                            </div>
                            <div class="tel"></div>
                            <div class="address-con">
                                <span class="info"></span>
                                <span class="detail-info"></span>
                            </div>
                            <div class="address-action">
                                <span>修改</span>
                            </div>
                        </div>
                    </div>
                    <c:if test="${defaultAddress!=null}">
                        <div class="address-item" data-address-id="${defaultAddress.address_id}"
                             data-address-default="${defaultAddress.address_default}">
                            <div class="address-info">
                                <div class="name">
                                    <div style="display: inline;">${defaultAddress.user_name}</div>
                                    <span>${defaultAddress.label}</span>
                                </div>
                                <div class="tel">${defaultAddress.phone}</div>
                                <div class="address-con">
                                    <span class="info">${defaultAddress.address}</span>
                                    <span class="detail-info">${defaultAddress.address_detail}</span>
                                </div>
                                <div class="address-action">
                                    <span>修改</span>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:forEach items="${addresses}" var="address">
                        <div class="address-item" data-address-id="${address.address_id}"
                             data-address-default="${address.address_default}">
                            <div class="address-info">
                                <div class="name">
                                    <div style="display: inline;">${address.user_name}</div>
                                    <span>${address.label}</span>
                                </div>
                                <div class="tel">${address.phone}</div>
                                <div class="address-con">
                                    <span class="info">${address.address}</span>
                                    <span class="detail-info">${address.address_detail}</span>
                                </div>
                                <div class="address-action">
                                    <span>修改</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="add-item">
                        <div class="add-desc">
                            <div class="icon-plus">+</div>
                            <span>添加新地址</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="detail-section">
                <div class="detail-header">商品及优惠券</div>
                <div class="goods-list">
                    <c:forEach items="${carts}" var="cart">
                        <c:set var="goods" value="${map.get(cart.cart_id)}"></c:set>
                        <div class="good-item">
                            <div class="item-desc good-img">
                                <img src="img/goods/${goods.gds_def_img}" width="38px" height="38px">
                            </div>
                            <div class="item-desc good-name">
                                <a href="init_detail?gds_id=${goods.gds_id}">
                                        ${goods.gds_name} ${cart.gds_type} ${cart.gds_color}
                                </a>
                            </div>
                            <div class="item-desc price-box">
                                <div class="item-desc good-price">${cart.cart_price}元 x <em>${cart.gds_count}</em></div>
                                <div class="item-desc good-status"></div>
                                <div class="item-desc good-total">${cart.cart_price*cart.gds_count}元</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="detail-section">
                <div class="section-options section-shipment">
                    <div class="options-desc options-header">
                        <div class="title">配送方式</div>
                    </div>
                    <div class="options-desc options-body">
                        <div class="options-list">
                            <div class="options-item selected">快递配送（运费 10 元）</div>
                        </div>
                    </div>
                </div>
                <div class="section-options section-invoice">
                    <div class="options-desc options-header">
                        <div class="title">发票</div>
                    </div>
                    <div class="options-desc options-body">
                        <div class="options-list">
                            <div class="options-item selected">电子普通发票</div>
                            <div class="options-item selected">个人</div>
                            <div class="options-item selected">商品明细</div>
                            <a class="options-item selected" href="javascript:void(0);">修改&nbsp;&gt;</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="detail-section count-detail">
                <div class="section-discount">
                    <div class="discount-coupon">
                        <a href="javascript:void(0);">
                            <div></div>
                            <span>使用优惠券</span>
                        </a>
                    </div>
                    <div class="position-box">
                        <a href="javascript:void(0);">
                            <div></div>
                            <span>使用小米礼品卡</span>
                        </a>
                    </div>
                </div>
                <div class="section-bill">
                    <div class="bill-item">
                        <div class="bill-name">商品件数：</div>
                        <div class="bill-money">${totalCount}件</div>
                    </div>
                    <div class="bill-item">
                        <div class="bill-name">商品总价：</div>
                        <div class="bill-money">${totalPrice}元</div>
                    </div>
                    <div class="bill-item">
                        <div class="bill-name">运费：</div>
                        <div class="bill-money">10元</div>
                    </div>
                    <div class="bill-item total-price">
                        <div class="bill-name">应付总额：</div>
                        <div class="bill-money">
                            <em>${totalPrice+10}元</em>元
                        </div>
                    </div>
                </div>
            </div>
            <div class="detail-section footer-detail clearfix" id="J_footerDetail">
                <div class="footer-address">
                    <div class="selecter-address">
                        <div class="address-name"></div>
                        <div class="address-desc">
                            <span></span>
                            <a></a>
                        </div>
                    </div>
                </div>
                <div class="handle-action">
                    <div class="operating-button">
                        <a href="javascript:void(0);" class="btn-primary">去结算</a>
                        <a href="init_cart" class="btn-return">返回购物车</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="J_addressDialog" class="address-dialog">
    <div class="dialog-header">
        <span class="dialog-title">修改收货地址</span>
    </div>
    <div class="dialog-body">
        <div class="address-add">
            <div class="item">
                <label id="phone-name-label" for="phone-name">姓名</label>
                <input type="text" id="phone-name" value="" autocomplete="off" required>
                <label id="phone-num-label" for="phone-num">手机号码</label>
                <input type="text" id="phone-num" value="" autocomplete="off" required>
            </div>
            <div class="item">
                <label id="address-info-label" for="address-info">收货地址</label>
                <input id="address-info" type="text" value="" autocomplete="off" required>
            </div>
            <div class="item">
                <label id="address-detail-label" for="address-detail">详细地址</label>
                <textarea id="address-detail" autocomplete="off" required></textarea>
            </div>
            <div class="item">
                <label id="address-tag-label" for="address-tag">地址标签</label>
                <input id="address-tag" value="" autocomplete="off" required>
            </div>
        </div>
    </div>
    <div class="dialog-footer">
        <button class="btn-confirm">确认</button>
        <button class="btn-cancel">取消</button>
    </div>
    <a class="btn-close">×</a>
</div>
<div id="cover"></div>
<!-- end -->
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
<script src="js/page/checkout/checkout.js"></script>
</body>

</html>