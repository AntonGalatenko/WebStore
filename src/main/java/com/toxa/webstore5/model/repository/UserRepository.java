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

import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class UserRepository {

    @Autowired
    public SessionFactory sessionFactory = RepositoryConfig.sessionFactory();

    public List<Users> getAllUsers(){
        Session session = sessionFactory.openSession();
        List<Users> result = session.createCriteria(Users.class).
                createCriteria("usersProfile", "s").
                add(Restrictions.or(Restrictions.eq("type", "USER"), Restrictions.eq("type", "PRO-USER"))).
                setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).
                list();
        session.close();
        return result;
    }

    public List<Users> getAllAdmins(){
        Session session = sessionFactory.openSession();
        List<Users> result = session.createCriteria(Users.class).
                createCriteria("usersProfile", "s").
                add(Restrictions.eq("type", "ADMIN")).
                setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).
                list();
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

//        item.getUsers().add(user);

        user.getItems().add(item);
        session.merge(user);
        session.getTransaction().commit();

        session.close();
    }

    public void deleteItemOfUser(Items item, Users user){
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Set<Items>itemsSet = user.getItems();
        Iterator<Items> it = itemsSet.iterator();

        while (it.hasNext()){
            Items items = it.next();
            if(items.getId() == (item.getId())){
                it.remove();
                break;
            }

        }

        user.setItems(itemsSet);
        session.merge(user);
        session.getTransaction().commit();

        session.close();
    }

    public UsersProfile getUserProfile(String type){
        Session session = sessionFactory.openSession();
        UsersProfile usersProfile = (UsersProfile) session.createCriteria(UsersProfile.class).add(Restrictions.eq("type", type)).uniqueResult();
        session.close();
        return usersProfile;
    }

    /*public boolean setProfileAsUser(Users user){
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        user.setUsersProfile(getUserProfile(1));

        session.update(user);
        session.getTransaction().commit();
        session.close();
        return true;
    }*/


}
