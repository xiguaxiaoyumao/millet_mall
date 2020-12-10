package com.service;

import com.mapper.CartMapper;
import com.pojo.Cart;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/3 15:49
 */
@Service
public class CartServece {
    @Autowired
    private CartMapper cartMapper;

    public int addCart(Cart cart) {
        return cartMapper.addCart(cart);
    }

    public Cart selectCart(Cart cart) {
        return cartMapper.selectCart(cart);
    }

    public int updateCart(Cart cart) {
        return cartMapper.updateCart(cart);
    }

    public List<Cart> selectCartByActId(User user) {
        return cartMapper.selectCartByActId(user);
    }

    public int deleteById(Cart cart) {
        return cartMapper.deleteById(cart);
    }

    public Cart selectById(Cart cart) {
        return cartMapper.selectById(cart);
    }
}
