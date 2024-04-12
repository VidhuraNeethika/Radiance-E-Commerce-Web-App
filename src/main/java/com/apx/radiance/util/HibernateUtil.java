package com.apx.radiance.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static final SessionFactory SESSION_FACTORY = buildSessionFactory();

    private static SessionFactory buildSessionFactory(){
        try {

            return new Configuration().configure().buildSessionFactory();

        } catch (Exception e){
            throw new ExceptionInInitializerError();
        }
    }

    public static SessionFactory getSessionFactory(){

        return SESSION_FACTORY;

    }

    public static void close(){

        getSessionFactory().close();

    }
}