package com.controller;

import com.pojo.Address;
import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.User;
import com.service.AddressService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zht
 * @date 2020/12/9 17:58
 */
@Controller
public class CheckoutController {
    @Autowired
    private CartServece cartServece;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private AddressService addressService;

    @RequestMapping(path = "/pre_checkout")
    @ResponseBody
    public ResponseMessage preCheckout(@RequestBody List<Cart> pre_checkouts, HttpSession session) {
        session.setAttribute("pre_checkouts", pre_checkouts);
        return ResponseMessage.success();
    }

    @RequestMapping(path = "/init_checkout")
    public ModelAndView initCheckOut(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("checkout");
        List<Cart> pre_checkouts = (List<Cart>) session.getAttribute("pre_checkouts");
        //获取购物车数据
        List<Cart> carts = new ArrayList<>();
        Map<Integer, Goods> map = new HashMap<>();
        for (Cart pre_checkout : pre_checkouts) {
            Cart cart = cartServece.selectById(pre_checkout);
            Goods goods = new Goods();
            goods.setGds_id(cart.getGds_id());
            goods = goodsService.selectGoodsById(goods);
            carts.add(cart);
            map.put(cart.getCart_id(), goods);
        }
        Double totalPrice = new Double(0);
        Integer totalCount = new Integer(0);
        for (Cart cart : carts) {
            totalPrice = totalPrice + cart.getGds_count() * cart.getCart_price();
            totalCount = totalCount + cart.getGds_count();
        }
        //获取地址信息
        User user = (User) session.getAttribute("user");
        Address address = new Address();
        address.setAct_id(user.getAct_id());
        //查默认
        address.setAddress_default(1);
        List<Address> addresses = addressService.selectByActId(address);
        Address defaultAddress = null;
        if (addresses.size() != 0) {
            defaultAddress = addresses.get(0);
            StringBuilder stringBuilder = new StringBuilder(defaultAddress.getPhone());
            stringBuilder.replace(3, 7, "****");
            defaultAddress.setPhone(stringBuilder.toString());
        }
        //查其他非默认地址
        address.setAddress_default(0);
        addresses = addressService.selectByActId(address);
        for (Address address1 : addresses) {
            StringBuilder stringBuilder = new StringBuilder(address1.getPhone());
            stringBuilder.replace(3, 7, "****");
            address1.setPhone(stringBuilder.toString());
        }
        modelAndView.addObject("defaultAddress", defaultAddress);
        modelAndView.addObject("addresses", addresses);
        modelAndView.addObject("totalPrice", totalPrice);
        modelAndView.addObject("totalCount", totalCount);
        modelAndView.addObject("carts", carts);
        modelAndView.addObject("map", map);
        return modelAndView;
    }

    @RequestMapping(path = "/update_address")
    @ResponseBody
    public ResponseMessage updateAddress(@RequestBody Address address, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (address.getAddress_id() == -1) {
            address.setAct_id(user.getAct_id());
            address.setAddress_default(0);
            int i = addressService.insertAddress(address);
            if (i == 1) {
                return ResponseMessage.success().addObject("address", address);
            } else {
                return ResponseMessage.error();
            }
        } else {
            address.setAct_id(user.getAct_id());
            int i = addressService.updateAddressById(address);
            if (i == 1) {
                return ResponseMessage.success().addObject("address", address);
            } else {
                return ResponseMessage.error();
            }
        }
    }
}
