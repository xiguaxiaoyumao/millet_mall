package com.mapper;

import com.pojo.Goods;

import java.util.List;

/**
 * @author zht
 * @date 2020/11/30 19:11
 */
public interface GoodsMapper {
    public abstract List<Goods> selectByMi(String Mi);
    public abstract List<Goods> selectByRedMi(String redMi);
    public abstract List<Goods> selectPhones();
    public abstract List<Goods> selectFlashSale();
    public abstract List<Goods> selectHot();
    public abstract List<Goods> selectTel();
    public abstract Goods selectGoodsById(Goods goods);
    public abstract List<Goods> selectRecommend();
}
