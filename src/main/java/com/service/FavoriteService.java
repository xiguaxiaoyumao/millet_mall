package com.service;

import com.mapper.FavoriteMapper;
import com.pojo.Favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zht
 * @date 2020/12/3 15:52
 */
@Service
public class FavoriteService {
    @Autowired
    private FavoriteMapper favoriteMapper;

    public int addFavorite(Favorite favorite) {
        return favoriteMapper.addFavorite(favorite);
    }

    public Favorite selectFavorite(Favorite favorite) {
        return favoriteMapper.selectFavorite(favorite);
    }
}
