package com.toxa.webstore5.model.repository;


import com.toxa.webstore5.config.RepositoryConfig;
import com.toxa.webstore5.model.entity.Items;
import com.toxa.webstore5.model.entity.Users;
import com.toxa.webstore5.model.entity.UsersProfile;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class Repository {

    @Autowired
    public SessionFactory sessionFactory = RepositoryConfig.sessionFactory();

    public List<Users> getAllUsers(){
        Session session = sessionFactory.openSession();
        List<Users> result = session.createCriteria(Users.class).setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
        session.close();
        return result;
    }

    public List<Items> getAllItems(){
        Session session = sessionFactory.openSession();
        List<Items>  result = session.createCriteria(Items.class).setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
        session.close();
        return result;
    }

    public Users getUser(int id){
        Session session = sessionFactory.openSession();
        Users users = (Users) session.createCriteria(Users.class).add(Restrictions.eq("id", id)).uniqueResult();
        session.close();
        return users;
    }

    public Users getUser(String email){
        Session session = sessionFactory.openSession();
        Users users = (Users) session.createCriteria(Users.class).add(Restrictions.eq("email", email)).uniqueResult();
        session.close();
        return users;
    }

    public Items getItem(int id){
        Session session = sessionFactory.openSession();
        Items item = (Items) session.createCriteria(Items.class).add(Restrictions.eq("id", id)).uniqueResult();
        session.close();
        return item;
    }

    public void addItem(Items item){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(item);
        session.getTransaction().commit();
        session.close();
    }

    public void addUser(Users user){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();
    }

    public void addItemToUser(Items item, Users user){
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        item.getUsers().add(user);

        session.update(item);
        session.getTransaction().commit();
        session.close();
    }

    public boolean setProfileAsUser(Users user){
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        user.getUsersProfile().add(getUserProfile(1));

        session.update(user);
        session.getTransaction().commit();
        session.close();
        return true;
    }

    public UsersProfile getUserProfile(int id){
        Session session = sessionFactory.openSession();
        UsersProfile usersProfile = (UsersProfile) session.createCriteria(UsersProfile.class).add(Restrictions.eq("id", id)).uniqueResult();
        session.close();
        return usersProfile;
    }

}
