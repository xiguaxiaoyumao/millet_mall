package com.pojo;

/**
 * @author zht
 * @date 2020/12/3 14:47
 */
public class Cart {
    private Integer cart_id;
    private Integer act_id;
    private Integer gds_id;
    private String gds_color;
    private String gds_type;
    private Float cart_price;
    private Integer gds_count;

    public Integer getCart_id() {
        return cart_id;
    }

    public void setCart_id(Integer cart_id) {
        this.cart_id = cart_id;
    }

    public Integer getAct_id() {
        return act_id;
    }

    public void setAct_id(Integer act_id) {
        this.act_id = act_id;
    }

    public Integer getGds_id() {
        return gds_id;
    }

    public void setGds_id(Integer gds_id) {
        this.gds_id = gds_id;
    }

    public String getGds_color() {
        return gds_color;
    }

    public void setGds_color(String gds_color) {
        this.gds_color = gds_color;
    }

    public String getGds_type() {
        return gds_type;
    }

    public void setGds_type(String gds_type) {
        this.gds_type = gds_type;
    }

    public Float getCart_price() {
        return cart_price;
    }

    public void setCart_price(Float cart_price) {
        this.cart_price = cart_price;
    }

    public Integer getGds_count() {
        return gds_count;
    }

    public void setGds_count(Integer gds_count) {
        this.gds_count = gds_count;
    }


    @Override
    public String toString() {
        return cart_id + "";
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Cart) {
            if (((Cart) obj).getCart_id() == this.cart_id) {
                return true;
            }
        }
        return false;
    }
}
