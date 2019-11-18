package io.github.Dev.lang;



import io.github.Dev.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.Optional;

public class LangRepository {
    List<Lang> findAll()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        List<Lang> result = session.createQuery("from Lang", Lang.class).list();

        transaction.commit();
        session.close();
        return result;
    }
    public Optional<Lang> findbyId(Integer id)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Lang result = session.get(Lang.class, id);
        transaction.commit();
        session.close();
        return Optional.ofNullable(result);
    }
}
