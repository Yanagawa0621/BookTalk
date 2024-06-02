package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static final SessionFactory sessionFactory = buildSessionFactory();
    private static final ThreadLocal<Session> sessionThreadLocal = new ThreadLocal<>();

    private static SessionFactory buildSessionFactory() {
        try {
            return new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static Session getSession() {
        return sessionThreadLocal.get();
    }

    public static void setSession(Session session) {
        sessionThreadLocal.set(session);
    }

    public static void removeSession() {
        sessionThreadLocal.remove();
    }
}
