package com.apx.radiance.service;

import com.apx.radiance.entity.Product;
import com.apx.radiance.entity.User;
import com.apx.radiance.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ProductService {

    public Product getByProductId(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.get(Product.class, id);
    }

    public Session getHibernateSession(){
        return HibernateUtil.getSessionFactory().openSession();
    }

    public List<Product> getAll(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("select p from Product p",Product.class).getResultList();
    }

    public List<Product> getAll(boolean active){
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("select p from Product p where p.active=:active",Product.class)
                .setParameter("active",active).getResultList();
    }

    public void save(Product product){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(product);
        transaction.commit();
        session.close();
    }

    public void update(Product product){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(product);
        transaction.commit();
        session.close();
    }

    public void delete(Product product){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.remove(product);
        transaction.commit();
        session.close();
    }

    public void delete(Long id){

        Session session = HibernateUtil.getSessionFactory().openSession();
        Product product = session.get(Product.class, id);
        Transaction transaction = session.beginTransaction();
        session.remove(product);

        transaction.commit();
        session.close();
    }

}
