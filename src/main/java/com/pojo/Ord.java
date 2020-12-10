package com.pojo;

/**
 * @author zht
 * @date 2020/12/7 20:55
 */
public class Ord {
    private String ord_id;
    private Integer gds_id;
    private String gds_detail;
    private Integer gds_count;
    private Float gds_total_price;
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    private String address;
    private String ord_status;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrd_status() {
        return ord_status;
    }

    public void setOrd_status(String ord_status) {
        this.ord_status = ord_status;
    }

    public String getOrd_id() {
        return ord_id;
    }

    public void setOrd_id(String ord_id) {
        this.ord_id = ord_id;
    }

    public Integer getGds_id() {
        return gds_id;
    }

    public void setGds_id(Integer gds_id) {
        this.gds_id = gds_id;
    }

    public String getGds_detail() {
        return gds_detail;
    }

    public void setGds_detail(String gds_detail) {
        this.gds_detail = gds_detail;
    }

    public Integer getGds_count() {
        return gds_count;
    }

    public void setGds_count(Integer gds_count) {
        this.gds_count = gds_count;
    }

    public Float getGds_total_price() {
        return gds_total_price;
    }

    public void setGds_total_price(Float gds_total_price) {
        this.gds_total_price = gds_total_price;
    }

}
