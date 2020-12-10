package com.interceptor;

import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.User;
import com.service.CartServece;
import com.service.GoodsService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zht
 * @date 2020/12/2 9:24
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private UserService userService;
    @Autowired
    private CartServece cartServece;
    @Autowired
    private GoodsService goodsService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) {
        System.out.println("进入了preHandle方法！！！！");
        //判断session中是否有信息
        HttpSession session = request.getSession();
        User auser = (User) session.getAttribute("user");

        if (auser != null) {
            //购物车
            List<Cart> carts = cartServece.selectCartByActId(auser);
            Map<Cart, Goods> map = new HashMap<>();
            Goods goods = new Goods();
            for (Cart cart : carts) {
                goods.setGds_id(cart.getGds_id());
                Goods goodsById = goodsService.selectGoodsById(goods);
                map.put(cart, goodsById);
            }
            session.setAttribute("carts", carts);
            //有就通过
            return true;
        } else {
            //没有session就获取cookie进行判断
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                //有cookie就通过cookie获取用户信息
                //遍历cookies
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("act_name")) {
                        String userCookie = cookie.getValue();
                        //当cookie中有username才执行
                        //获取用户数据
                        User user = new User();
                        user.setAct_name(userCookie);
                        user = userService.selectByName(user.getAct_name());
                        //登录成功设置session
                        session.setAttribute("user", user);

                        //购物车
                        List<Cart> carts = cartServece.selectCartByActId(user);
                        Map<Integer, Goods> map = new HashMap<>();
                        Goods goods = new Goods();
                        for (Cart cart : carts) {
                            goods.setGds_id(cart.getGds_id());
                            Goods goodsById = goodsService.selectGoodsById(goods);
                            map.put(cart.getCart_id(), goodsById);
                        }
                        session.setAttribute("carts", carts);
                        session.setAttribute("gdsmap", map);
                        return true;
                    }
                }
            }
        }
        return true;
    }
}
