package com.mapper;

import com.pojo.Favorite;

/**
 * @author zht
 * @date 2020/12/3 15:10
 */
public interface FavoriteMapper {
    public abstract int addFavorite(Favorite favorite);

    public abstract Favorite selectFavorite(Favorite favorite);

}
