package com.service;

import com.mapper.OrdMapper;
import com.pojo.Address;
import com.pojo.Ord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zht
 * @date 2020/12/7 21:18
 */
@Service
public class OrdService {
    @Autowired
    private OrdMapper ordMapper;

    public int addOrder(Ord ord) {
        return ordMapper.addOrder(ord);
    }
}
