package com.apx.radiance.dto;

import com.apx.radiance.entity.Brand;
import com.apx.radiance.entity.Category;
import com.apx.radiance.entity.Model;
import com.apx.radiance.entity.Product_Image;

import java.util.List;
import java.util.Set;

public class ProductDto {

    private Long productId;

    private String title;

    private Double price;

    private Integer qty;

    private String description;

    private boolean active;

    private Double delivery_fee;

    private Set<Product_Image> images;

    private String createdAt;

    private Long category;

    private Long model;

    private Long brand;

    public ProductDto() {
    }

    public Long getCategory() {
        return category;
    }

    public void setCategory(Long category) {
        this.category = category;
    }

    public Long getModel() {
        return model;
    }

    public void setModel(Long model) {
        this.model = model;
    }

    public Long getBrand() {
        return brand;
    }

    public void setBrand(Long brand) {
        this.brand = brand;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Double getDelivery_fee() {
        return delivery_fee;
    }

    public void setDelivery_fee(Double delivery_fee) {
        this.delivery_fee = delivery_fee;
    }

    public Set<Product_Image> getImages() {
        return images;
    }

    public void setImages(Set<Product_Image> images) {
        this.images = images;
    }
}
