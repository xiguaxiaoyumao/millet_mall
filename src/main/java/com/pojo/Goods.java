package com.pojo;

/**
 * @author zht
 * @date 2020/11/30 19:09
 */
public class Goods {
    private int gds_id;
    private String gds_name;
    private float gds_price;
    private String gds_describe;
    private String gds_def_img;
    private int gds_inventory;
    private String gds_class;

    public String getGds_class() {
        return gds_class;
    }

    public void setGds_class(String gds_class) {
        this.gds_class = gds_class;
    }

    public int getGds_id() {
        return gds_id;
    }

    public void setGds_id(int gds_id) {
        this.gds_id = gds_id;
    }

    public String getGds_name() {
        return gds_name;
    }

    public void setGds_name(String gds_name) {
        this.gds_name = gds_name;
    }

    public float getGds_price() {
        return gds_price;
    }

    public void setGds_price(float gds_price) {
        this.gds_price = gds_price;
    }

    public String getGds_describe() {
        return gds_describe;
    }

    public void setGds_describe(String gds_describe) {
        this.gds_describe = gds_describe;
    }

    public String getGds_def_img() {
        return gds_def_img;
    }

    public void setGds_def_img(String gds_def_img) {
        this.gds_def_img = gds_def_img;
    }

    public int getGds_inventory() {
        return gds_inventory;
    }

    public void setGds_inventory(int gds_inventory) {
        this.gds_inventory = gds_inventory;
    }
}
