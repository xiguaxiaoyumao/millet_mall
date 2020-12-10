package com.mapper;

import com.pojo.Cart;
import com.pojo.User;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/3 14:56
 */
public interface CartMapper {
    public abstract int addCart(Cart cart);

    public abstract Cart selectCart(Cart cart);

    public abstract int updateCart(Cart cart);

    public abstract List<Cart> selectCartByActId(User user);

    public abstract int deleteById(Cart cart);

    public abstract Cart selectById(Cart cart);
}
