package com.controller;

import com.pojo.Cart;
import com.pojo.Goods;
import com.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author zht
 * @date 2020/12/5 12:01
 */
@Controller
public class SuccessTipController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(path = "/init_success_tip")
    public void initSuccessTip(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        //添加购物车的信息
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        for (Cart cart : carts) {
            if (cart.getCart_id() == Integer.parseInt(request.getParameter("cart_id"))) {
                Goods goods = new Goods();
                goods.setGds_id(cart.getGds_id());
                Goods retGoods = goodsService.selectGoodsById(goods);
                request.setAttribute("goods", retGoods);
                request.setAttribute("cart", cart);
            }
        }
        List<Goods> mis = goodsService.selectByMi();
        List<Goods> redMis = goodsService.selectByRedMi();
        List<Goods> recommends = goodsService.selectRecommend();
        String gds_id = request.getParameter("gds_id");
        request.setAttribute("mis", mis);
        request.setAttribute("redMis", redMis);
        request.setAttribute("recommends", recommends);
        request.setAttribute("gds_id",gds_id);

        request.getRequestDispatcher("success_tip.jsp").forward(request, response);
    }
}
