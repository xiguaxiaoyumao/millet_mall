package com.mapper;

import com.pojo.Gdstype;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/3 11:44
 */
public interface GdstypeMapper {
    public List<Gdstype> selectByGdsId(Gdstype gdstype);
}
