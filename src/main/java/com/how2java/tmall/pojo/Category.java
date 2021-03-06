package com.how2java.tmall.pojo;

public class Category {
    private Integer id;
    private String name;
    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = (name == null ? null : name.trim());//name.trim()去掉name两端的空白字符
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
