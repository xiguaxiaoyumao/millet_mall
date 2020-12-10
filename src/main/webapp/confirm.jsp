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
    <link rel="stylesheet" href="css/page/confirm/confirm.css">
    <link rel="icon" href="img/base/logo-icon.jpg">
    <title>支付订单</title>
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
            <h2>支付订单</h2>
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
<div class="comfirm-page-main">
    <div class="container comfirm-box clearfix">
        <div class="comfirm-context">

            <div id="J_comfirmOrder" class="comfirm-order">
                <div class="section section-order">
                    <div class="order-info clearfix">
                        <div class="fl">
                            <h2 class="title">订单提交成功！去付款咯～</h2>
                            <p class="order-time">
                                    <span>
                                        请在
                                        <span class="pay-time-tip">0 小时 15 分</span>
                                        <span>内完成支付, 超时后将取消订单</span>
                                    </span>
                            </p>
                            <p class="address-info">
                                收货信息：${address.user_name} ${address.phone} ${address.address} ${address.address_detail}
                            </p>
                        </div>
                        <div class="fr">
                            <div class="total">
                                应付总额：
                                <span class="money">
                                        <em>${total_price}</em>
                                        <span>元</span>
                                    </span>
                            </div>
                            <a href="javascript:void(0);" class="show-detail">
                                订单详情
                            </a>
                        </div>
                    </div>
                    <div class="icon-right">√</div>

                    <div class="order-detail" style="height: 0px;">
                        <c:forEach items="${ords}" var="ord">
                            <ul>
                                <li class="clearfix">
                                    <div class="label">订单号：</div>
                                    <div class="content">
                                        <span class="order-num">${ord.ord_id}</span>
                                    </div>
                                </li>
                                <li class="clearfix adress-info">
                                    <div class="label">收货信息：</div>
                                    <div class="content">
                                            ${address.user_name} ${address.phone} ${address.address} ${address.address_detail}
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="label">商品名称：</div>
                                    <div class="content">
                                        <span>${ord.gds_detail}</span>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="label">发票信息：</div>
                                    <div class="content">
                                        电子普通发票 个人
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 确认支付 -->
            <div class="confirm-pay">
                <div class="section section-payment">
                    <div class="cash-title">
                        <div>选择以下支付方式付款</div>
                    </div>
                    <div id="J_paymentBox" class="payment-box">
                        <div class="payment-header clearfix">
                            <h3 class="title">支付平台</h3>
                            <span class="desc"></span>
                        </div>
                        <div class="payment-body">
                            <ul class="clearfix payment-list">
                                <li class="bank">
                                    <img src="img/page/confirm/9a4f743d0bdb5c048ad9803914a4ea83.jpg">
                                </li>
                                <li class="bank">
                                    <img src="img/page/confirm/c66f98cff8649bd5ba722c2e8067c6ca.jpg">
                                </li>
                                <li class="bank">
                                    <img src="img/page/confirm/9ead8cd015b07ca9f363ef9b6dd5e8e2.jpg">
                                </li>
                                <li class="bank alipay">
                                    <img src="img/page/confirm/9fcf10ba01a57b7d08d38b6f4ff3dfa8.jpg">
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div id="J_payBox" class="pay-box">
                        <div class="payment-header clearfix">
                            <h3 class="title">银行借记卡及信用卡</h3>
                            <span class="desc"></span>
                        </div>
                        <div class="payment-body">
                            <ul class="clearfix payment-list">
                                <li class="bank"><img src="img/page/confirm/payOnline_zsyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_gsyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_jsyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_jtyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_nyyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_zgyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_youzheng.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_gfyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_pufa.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_gdyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_xyyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_msyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_shyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_bjnsyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_nbyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_hzyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_shnsyh.png"></li>
                                <li class="bank hide"><img src="img/page/confirm/payOnline_fcyh.png"></li>
                                <li class="more-btn">查看更多</li>
                            </ul>
                        </div>
                    </div>

                    <div class="pay-box payment-box-last">
                        <div class="payment-header clearfix">
                            <h3 class="title">快捷支付</h3>
                            <span class="desc">（支持以下各银行信用卡以及部分银行借记卡）</span>
                        </div>
                        <div class="payment-body">
                            <ul class="clearfix payment-list">
                                <li class="bank"><img src="img/page/confirm/payOnline_zsyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_jtyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_jsyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_gsyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_zxyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_gdyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_zgyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_shncsyyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_jiangsshuyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_xyyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_nyyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_nyyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_hyyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_gfyh.png"></li>
                                <li class="bank"><img src="img/page/confirm/payOnline_bjyh.png"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="confirm-install-content">
                <div class="confirm-install">
                    <div class="section section-installment">
                        <div class="payment-box">
                            <div class="payment-header clearfix">
                                <h3 class="title">分期付款</h3>
                                <span class="desc"></span>
                            </div>
                            <div class="payment-body">
                                <ul class="clearfix payment-list">
                                    <li class="bank">
                                        <img src="img/page/confirm/c924147efb783abb94fde84a07a5e89b.jpg">
                                    </li>
                                    <li class="bank">
                                        <img src="img/page/confirm/f32babec080c5dade34a91f2c8e5e926.jpg">
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div id="cover"></div>
<div class="alipay-dialog" id="J_alipayDialog">
    <div class="dialog-header">
        <span class="dialog-title">支付宝支付</span>
    </div>
    <div class="dialog-body">
        <div class="dialog-inner">
            <div class="code">
                <img src="img/page/confirm/zhbget.png">
            </div>
            <div class="msg">请使用 <span>支付宝</span> 扫一扫 <br> 二维码完成支付</div>
        </div>
    </div>
    <a class="btn-close">×</a>
</div>
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
<script src="js/page/confirm/confirm.js"></script>
</body>

</html>