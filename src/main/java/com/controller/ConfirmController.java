package com.controller;

import com.pojo.*;
import com.service.AddressService;
import com.service.CartServece;
import com.service.GoodsService;
import com.service.OrdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zht
 * @date 2020/12/10 13:32
 */
@Controller
public class ConfirmController {
    @Autowired
    private CartServece cartServece;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private OrdService ordService;

    @RequestMapping(path = "/init_confirm")
    public ModelAndView initConfirm(HttpServletRequest request, HttpSession session) {
        Integer address_id = Integer.parseInt(request.getParameter("address_id"));
        List<Cart> pre_checkouts = (List<Cart>) session.getAttribute("pre_checkouts");
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        ModelAndView modelAndView = new ModelAndView("confirm");
        //创建订单
        Address address = new Address();
        double total_price = 0;
        List<Ord> ords = new ArrayList<>();
        for (Cart pre_checkout : pre_checkouts) {
            Cart cart = cartServece.selectById(pre_checkout);
            Goods goods = new Goods();
            goods.setGds_id(cart.getGds_id());
            goods = goodsService.selectGoodsById(goods);
            address.setAddress_id(address_id);
            address = addressService.selectByAddressId(address);
            Ord ord = new Ord();
            ord.setGds_id(cart.getGds_id());
            ord.setGds_detail(goods.getGds_name() + " " + cart.getGds_color() + " " + cart.getGds_type());
            ord.setGds_count(cart.getGds_count());
            ord.setGds_total_price(cart.getCart_price() * cart.getGds_count());
            ord.setPhone(address.getPhone());
            ord.setAddress(address.getAddress() + " " + address.getAddress_detail());
            ord.setOrd_status("未支付");
            ordService.addOrder(ord);
            total_price = total_price + ord.getGds_total_price();
            ords.add(ord);
            //购物车异移除提交订单商品
            carts.remove(cart);
            //数据库移除提交订单的商品
            cartServece.deleteById(cart);
        }
        session.removeAttribute("pre_checkouts");
        modelAndView.addObject("ords", ords);
        modelAndView.addObject("total_price", total_price);
        modelAndView.addObject("address", address);
        return modelAndView;
    }
}
