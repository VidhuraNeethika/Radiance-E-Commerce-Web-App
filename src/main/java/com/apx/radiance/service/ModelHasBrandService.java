package com.apx.radiance.service;

import com.apx.radiance.entity.ModelHasBrand;
import com.apx.radiance.util.HibernateUtil;
import org.hibernate.Session;

public class ModelHasBrandService {

    public ModelHasBrand getModelHasBrand(Long brandId,Long modelId){

        Session session = HibernateUtil.getSessionFactory().openSession();
        ModelHasBrand modelHasBrand = session.createQuery("select mhb from ModelHasBrand mhb where mhb.brand.id=:brandId and mhb.model.id=:modelId", ModelHasBrand.class)
                .setParameter("brandId", brandId).setParameter("modelId", modelId).uniqueResult();

        return modelHasBrand;
    }

}
