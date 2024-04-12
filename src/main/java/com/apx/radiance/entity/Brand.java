package com.apx.radiance.entity;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "brand")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "brand_id")
    private Set<ModelHasBrand> modelHasBrandSet = new HashSet<>();

    public Brand() {
    }

    public Brand(Long id, String name, Set<ModelHasBrand> modelHasBrandSet) {
        this.id = id;
        this.name = name;
        this.modelHasBrandSet = modelHasBrandSet;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<ModelHasBrand> getModelHasBrandSet() {
        return modelHasBrandSet;
    }

    public void setModelHasBrandSet(Set<ModelHasBrand> modelHasBrandSet) {
        this.modelHasBrandSet = modelHasBrandSet;
    }
}
