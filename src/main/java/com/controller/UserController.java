package com.controller;

import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.User;
import com.service.CartServece;
import com.service.GoodsService;
import com.service.UserService;
import com.util.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zht
 * @date 2020/10/20 17:08
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CartServece cartServece;
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ResponseMessage login(@RequestBody User user, HttpServletResponse response, HttpSession session) {
        User retUser = userService.login(user);
        if (retUser == null) {
        } else {
            session.setAttribute("user", retUser);
            Cookie userCookie = new Cookie("act_name", retUser.getAct_name());
            userCookie.setMaxAge(4 * 7 * 24 * 60 * 60);
            //设置cookie存取路径
            userCookie.setPath("/");
            //将Cookie加到response中
            response.addCookie(userCookie);
            List<Cart> sessCart = (List<Cart>) session.getAttribute("carts");
            if (sessCart != null) {
                for (Cart cart : sessCart) {
                    cart.setAct_id(retUser.getAct_id());
                    Cart cart1 = cartServece.selectCart(cart);
                    if (cart1 != null) {
                        cart1.setGds_count(cart1.getGds_count() + cart.getGds_count());
                        cartServece.updateCart(cart1);
                    } else {
                        cartServece.addCart(cart);
                    }
                }
            }
            //购物车
            List<Cart> carts = cartServece.selectCartByActId(retUser);
            Map<Integer, Goods> map = new HashMap<>();
            Goods goods = new Goods();
            for (Cart cart : carts) {
                goods.setGds_id(cart.getGds_id());
                Goods goodsById = goodsService.selectGoodsById(goods);
                map.put(cart.getCart_id(), goodsById);
            }
            session.setAttribute("carts", carts);
            session.setAttribute("gdsmap", map);
        }
        return retUser != null ? ResponseMessage.success() : ResponseMessage.error();
    }

    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie userCookie = new Cookie("act_name", null);
        userCookie.setMaxAge(0);
        //设置cookie存取路径
        userCookie.setPath("/");
        response.addCookie(userCookie);
        //销毁session
        request.getSession().invalidate();
        response.sendRedirect("/millet_mall/main.jsp");
    }
}
