package com.controller;

import com.pojo.Goods;
import com.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author zht
 * @date 2020/11/30 19:30
 */
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/init_index")
    public ModelAndView initIndex() {
        List<Goods> mis = goodsService.selectByMi();
        List<Goods> redMis = goodsService.selectByRedMi();
        List<Goods> phones = goodsService.selectPhones();
        List<Goods> flashSales = goodsService.selectFlashSale();
        List<Goods> hots = goodsService.selectHot();
        List<Goods> tels = goodsService.selectTel();
        for (Goods phone : phones) {
            String string = phone.getGds_describe();
            String[] split = string.split("/", 3);
            phone.setGds_describe(split[0] + "/" + split[1]);
        }
        for (Goods flash : flashSales) {
            String string = flash.getGds_describe();
            String[] split = string.split("/", 2);
            flash.setGds_describe(split[0]);
        }
        for (Goods hot : hots) {
            String string = hot.getGds_describe();
            String[] split = string.split("/", 3);
            hot.setGds_describe(split[0] + "/" + split[1]);
        }
        for (Goods tel : tels) {
            String string = tel.getGds_describe();
            String[] split = string.split("/", 3);
            tel.setGds_describe(split[0] + "/" + split[1]);
        }
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("mis", mis);
        modelAndView.addObject("redMis", redMis);
        modelAndView.addObject("phones", phones);
        modelAndView.addObject("flashSales", flashSales);
        modelAndView.addObject("hots", hots);
        modelAndView.addObject("tels", tels);
        return modelAndView;
    }
}
