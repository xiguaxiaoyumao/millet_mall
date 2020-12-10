package com.pojo;

/**
 * @author zht
 * @date 2020/12/2 12:58
 */
public class Pic {
    private int pic_id;
    private String pic_dir;
    private String pic_type;
    private int gds_id;

    public int getPic_id() {
        return pic_id;
    }

    public void setPic_id(int pic_id) {
        this.pic_id = pic_id;
    }

    public String getPic_dir() {
        return pic_dir;
    }

    public void setPic_dir(String pic_dir) {
        this.pic_dir = pic_dir;
    }

    public String getPic_type() {
        return pic_type;
    }

    public void setPic_type(String pic_type) {
        this.pic_type = pic_type;
    }

    public int getGds_id() {
        return gds_id;
    }

    public void setGds_id(int gds_id) {
        this.gds_id = gds_id;
    }
}
