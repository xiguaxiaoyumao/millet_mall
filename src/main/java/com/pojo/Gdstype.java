package com.pojo;

/**
 * @author zht
 * @date 2020/12/3 11:40
 */
public class Gdstype {
    private int type_id;
    private String type_name;
    private String type_attribute;
    private float type_price;
    private int gds_id;

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getType_attribute() {
        return type_attribute;
    }

    public void setType_attribute(String type_attribute) {
        this.type_attribute = type_attribute;
    }

    public float getType_price() {
        return type_price;
    }

    public void setType_price(float type_price) {
        this.type_price = type_price;
    }

    public int getGds_id() {
        return gds_id;
    }

    public void setGds_id(int gds_id) {
        this.gds_id = gds_id;
    }
}
