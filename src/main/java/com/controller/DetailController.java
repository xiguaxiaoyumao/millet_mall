package com.controller;

import com.pojo.*;
import com.service.*;
import com.util.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author zht
 * @date 2020/12/2 16:29
 */
@Controller
public class DetailController {
    @Autowired
    private PicService picService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GdstypeService gdstypeService;
    @Autowired
    private CartServece cartServece;
    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping(path = "/init_detail")
    public ModelAndView initDetail(HttpServletRequest request) {
        Integer gds_id = Integer.parseInt(request.getParameter("gds_id"));
        Pic gdsId = new Pic();
        gdsId.setGds_id(gds_id);
        Goods goods = new Goods();
        goods.setGds_id(gds_id);
        Gdstype gdstype = new Gdstype();
        gdstype.setGds_id(gds_id);
        List<Pic> picType = picService.selectPicType(gdsId);
        List<Goods> mis = goodsService.selectByMi();
        List<Goods> redMis = goodsService.selectByRedMi();
        Goods goods1 = goodsService.selectGoodsById(goods);
        List<Gdstype> gdstypes = gdstypeService.selectByGdsId(gdstype);
        Map<String, List<Pic>> map = new HashMap<>();
        for (Pic type : picType) {
            type.setGds_id(gds_id);
            List<Pic> pics = picService.selectPicsByType(type);
            map.put(type.getPic_type(), pics);
        }
        ModelAndView modelAndView = new ModelAndView("detail");
        modelAndView.addObject("mis", mis);
        modelAndView.addObject("redMis", redMis);
        modelAndView.addObject("types", picType);
        modelAndView.addObject("map", map);
        modelAndView.addObject("goods", goods1);
        modelAndView.addObject("gdstypes", gdstypes);
        return modelAndView;
    }

    @RequestMapping(path = "/add_cart")
    @ResponseBody
    public ResponseMessage addCart(@RequestBody Cart cart, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Cart> carts = (List<Cart>) session.getAttribute("carts");
            Map<Integer, Goods> gdsmap = (Map<Integer, Goods>) session.getAttribute("gdsmap");
            cart.setAct_id(user.getAct_id());
            Cart retCart = cartServece.selectCart(cart);
            if (retCart == null) {
                cartServece.addCart(cart);
                cart = cartServece.selectCart(cart);
            } else {
                retCart.setGds_count(retCart.getGds_count() + 1);
                cartServece.updateCart(retCart);
                cart = cartServece.selectCart(retCart);
            }
            Goods goods = new Goods();
            goods.setGds_id(cart.getGds_id());
            carts.remove(cart);
            carts.add(cart);
            gdsmap.put(cart.getGds_id(),goods);
            return ResponseMessage.success().addObject("cart", cart);
        } else {
            Goods goods = new Goods();
            goods.setGds_id(cart.getGds_id());
            Goods goods1 = goodsService.selectGoodsById(goods);
            List<Cart> carts = (List<Cart>) session.getAttribute("carts");
            Map<Integer, Goods> gdsmap = (Map<Integer, Goods>) session.getAttribute("gdsmap");
            if (carts == null && gdsmap == null) {
                carts = new ArrayList<>();
                gdsmap = new HashMap<>();
                Random random = new Random();
                Integer id = random.nextInt(1000) + 1000;
                cart.setAct_id(id);
                cart.setCart_id(id);
                carts.add(cart);
                gdsmap.put(cart.getCart_id(), goods1);
                session.setAttribute("carts", carts);
                session.setAttribute("gdsmap", gdsmap);
            } else {
                //购物车中没有
                boolean flag = true;
                for (Cart car : carts) {
                    System.out.println(car.getGds_id() == cart.getGds_id());
                    System.out.println(car.getGds_color().equals(cart.getGds_color()));
                    System.out.println(car.getGds_type().equals(cart.getGds_type()));
                    if (car.getGds_id() == cart.getGds_id() && car.getGds_color().equals(cart.getGds_color()) && car.getGds_type().equals(cart.getGds_type())) {
                        cart = car;
                        car.setGds_count(car.getGds_count() + 1);
                        flag = false;
                    }
                }
                if (flag) {
                    Random random = new Random();
                    int id = random.nextInt(1000) + 1000;
                    cart.setAct_id(id);
                    cart.setCart_id(id);
                    gdsmap.put(cart.getCart_id(), goods1);
                }
            }
            return ResponseMessage.success().addObject("cart", cart);
        }
    }

    @RequestMapping(path = "/add_favorite")
    @ResponseBody
    public ResponseMessage addFavorite(@RequestBody Favorite favorite, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return ResponseMessage.error();
        } else {
            favorite.setAct_id(user.getAct_id());
            Favorite favorite1 = favoriteService.selectFavorite(favorite);
            if (favorite1 == null) {
                favoriteService.addFavorite(favorite);
            }
            return ResponseMessage.success();
        }
    }
}