package com.apx.radiance.entity;

import com.apx.radiance.util.AppUtil;
import jakarta.persistence.*;

@Entity
@Table(name = "app_settings")
public class AppSettings extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String name;

    @Column(columnDefinition = "LONGTEXT")
    private String value;

    public AppSettings() {
    }

    public AppSettings(Long id, String name, String value) {
        this.id = id;
        this.name = name;
        this.value = value;
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @PostPersist
    @PostUpdate
    public void updateAppUtil(){
        AppUtil.reload();
    }
}
