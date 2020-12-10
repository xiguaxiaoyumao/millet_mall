package com.service;

import com.mapper.PicMapper;
import com.pojo.Pic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/2 13:04
 */
@Service
public class PicService {
    @Autowired
    private PicMapper picMapper;

    public List<Pic> selectPicType(Pic pic) {
        return picMapper.selectPicType(pic);
    }

    public List<Pic> selectPicsByType(Pic pic) {
        return picMapper.selectPicsByType(pic);
    }
}
