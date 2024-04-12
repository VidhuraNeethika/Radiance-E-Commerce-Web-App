package com.apx.radiance;

import com.apx.radiance.entity.AppSettings;
import com.apx.radiance.util.Encryption;
import com.apx.radiance.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RunDB {

    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();

//        AppSettings settings = new AppSettings();
//        settings.setName("app_name");
//        settings.setValue("radiance");
//
//        Transaction transaction = session.beginTransaction();
//
//        session.persist(settings);
//        transaction.commit();

    }

}
