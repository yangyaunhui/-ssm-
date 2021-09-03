package com.xiexin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Shopping {
    private String snme;
    private int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;

    @Override
    public String toString() {
        return "Shopping{" +
                "snme='" + snme + '\'' +
                ", count=" + count +
                ", time=" + time +
                '}';
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getSnme() {
        return snme;
    }

    public void setSnme(String snme) {
        this.snme = snme;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
