package com.apx.radiance.service;

import com.apx.radiance.dto.AuthDto;
import com.apx.radiance.entity.User;
import com.apx.radiance.util.HibernateUtil;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserService {

    public User getById(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.get(User.class, id);
    }

    public User getByEmail(String email) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            User user = session.createQuery("select u from User u where u.username=:email", User.class).setParameter("email", email).uniqueResult();
            return user;
        }catch (NoResultException e){
            return null;
        }
    }

    public void save(User user){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(user);
        transaction.commit();
    }

    public AuthDto getUserByUsername(String username){

        Session session = HibernateUtil.getSessionFactory().openSession();

        User user = session.createQuery("select u from User u where u.username=:username", User.class).setParameter("username", username).uniqueResult();

        return new AuthDto(user.getUsername(),user.getPassword().toString());

    }

}
