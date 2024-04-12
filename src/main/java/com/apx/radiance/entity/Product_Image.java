package com.apx.radiance.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "product_imgs")
public class Product_Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String path_01;

    private String path_02;

    private String path_03;

    private String path_04;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public Product_Image() {
    }

    public Product_Image(Long id, String path_01, String path_02, String path_03, String path_04, Product product) {
        this.id = id;
        this.path_01 = path_01;
        this.path_02 = path_02;
        this.path_03 = path_03;
        this.path_04 = path_04;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath_01() {
        return path_01;
    }

    public void setPath_01(String path_01) {
        this.path_01 = path_01;
    }

    public String getPath_02() {
        return path_02;
    }

    public void setPath_02(String path_02) {
        this.path_02 = path_02;
    }

    public String getPath_03() {
        return path_03;
    }

    public void setPath_03(String path_03) {
        this.path_03 = path_03;
    }

    public String getPath_04() {
        return path_04;
    }

    public void setPath_04(String path_04) {
        this.path_04 = path_04;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
