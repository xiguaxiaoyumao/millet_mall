package com.controller;

import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.User;
import com.service.CartServece;
import com.service.GoodsService;
import com.util.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author zht
 * @date 2020/12/7 21:57
 */
@Controller
public class CartController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CartServece cartServece;


    @RequestMapping(path = "/init_cart")
    public ModelAndView initCart(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("cart");
        if (user == null) {
            modelAndView.setViewName("login");
            return modelAndView;
        }
        List<Goods> recommends = goodsService.selectRecommend();
        modelAndView.addObject("recommends", recommends);
        return modelAndView;
    }

    @RequestMapping(path = "/delete_cart")
    @ResponseBody
    public ResponseMessage deleteCart(@RequestBody Cart cart, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        if (user == null) {
            carts.remove(cart);
        } else {
            carts.remove(cart);
            cartServece.deleteById(cart);
        }
        return ResponseMessage.success();
    }

    @RequestMapping(path = "/change_count")
    @ResponseBody
    public ResponseMessage changeCount(@RequestBody Cart cart, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        if (user == null) {
            for (Cart cart1 : carts) {
                if (cart1.getCart_id() == cart.getCart_id()) {
                    cart1.setGds_count(cart.getGds_count());
                    break;
                }
            }
        } else {
            for (Cart cart1 : carts) {
                if (cart1.getCart_id() == cart.getCart_id()) {
                    cart1.setGds_count(cart.getGds_count());
                    int i = cartServece.updateCart(cart1);
                    if (i == 0) {
                        return ResponseMessage.error();
                    }
                }
                break;
            }
        }
        return ResponseMessage.success();
    }
}
