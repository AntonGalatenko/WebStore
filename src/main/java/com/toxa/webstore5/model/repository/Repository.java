package com.toxa.webstore5.model.repository;


import com.toxa.webstore5.config.RepositoryConfig;
import com.toxa.webstore5.model.entity.Items;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class Repository {

    @Autowired
    public SessionFactory sessionFactory = RepositoryConfig.sessionFactory();

    public List<Items> getAllItems(){
        Session session = sessionFactory.openSession();
        List<Items>  result = session.createCriteria(Items.class).setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
        session.close();
        return result;
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


}
