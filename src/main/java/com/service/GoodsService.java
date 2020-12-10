package com.service;

import com.mapper.GoodsMapper;
import com.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zht
 * @date 2020/11/30 19:26
 */
@Service
public class GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    public List<Goods> selectByMi() {
        return goodsMapper.selectByMi("mi-phone");
    }

    public List<Goods> selectByRedMi() {
        return goodsMapper.selectByRedMi("redmi-phone");
    }

    public List<Goods> selectPhones() {
        return goodsMapper.selectPhones();
    }

    public List<Goods> selectFlashSale() {
        return goodsMapper.selectFlashSale();
    }

    public List<Goods> selectHot() {
        return goodsMapper.selectHot();
    }

    public List<Goods> selectTel() {
        return goodsMapper.selectTel();
    }

    public Goods selectGoodsById(Goods goods) {
        return goodsMapper.selectGoodsById(goods);
    }

    public List<Goods> selectRecommend() {
        return goodsMapper.selectRecommend();
    }
}
