package com.service;

import com.mapper.GdstypeMapper;
import com.pojo.Gdstype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/3 11:50
 */
@Service
public class GdstypeService {
    @Autowired
    private GdstypeMapper gdstypeMapper;

    public List<Gdstype> selectByGdsId(Gdstype gds_id) {
        return gdstypeMapper.selectByGdsId(gds_id);
    }
}
