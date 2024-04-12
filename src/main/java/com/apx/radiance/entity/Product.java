package com.apx.radiance.entity;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "product")
public class Product extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "model_has_brand_id")
    private ModelHasBrand modelHasBrand;

    private String title;

    private Double price;

    private Integer qty;

    @Column(columnDefinition = "LONGTEXT")
    private String description;

    private boolean active;

    private Double delivery_fee;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Set<Product_Image> product_images = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Set<Cart> cartSet = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Set<Wishlist> wishlistSet = new HashSet<>();

    public Product() {
    }

    public Set<Wishlist> getWishlistSet() {
        return wishlistSet;
    }

    public void setWishlistSet(Set<Wishlist> wishlistSet) {
        this.wishlistSet = wishlistSet;
    }

    public Set<Cart> getCartSet() {
        return cartSet;
    }

    public void setCartSet(Set<Cart> cartSet) {
        this.cartSet = cartSet;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public ModelHasBrand getModelHasBrand() {
        return modelHasBrand;
    }

    public void setModelHasBrand(ModelHasBrand modelHasBrand) {
        this.modelHasBrand = modelHasBrand;
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

    public Set<Product_Image> getProduct_images() {
        return product_images;
    }

    public void setProduct_images(Set<Product_Image> product_images) {
        this.product_images = product_images;
    }
}
