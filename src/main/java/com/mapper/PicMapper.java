package com.mapper;

import com.pojo.Pic;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/2 13:00
 */
public interface PicMapper {
    public abstract List<Pic> selectPicType(Pic pic);
    public abstract List<Pic> selectPicsByType(Pic pic);
}
