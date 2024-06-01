package util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
    private static StandardServiceRegistry registry;
    private static final SessionFactory sessionFactory = createSessionFactory();

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    private static SessionFactory createSessionFactory() {
        try {
            // Create registry
            registry = new StandardServiceRegistryBuilder().configure().build();

            // Create SessionFactory
            SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();

            return sessionFactory;
        } catch (Exception e) {
            e.printStackTrace();
            // Destroy registry in case of failure
            if (registry != null) {
                StandardServiceRegistryBuilder.destroy(registry);
            }
            throw new ExceptionInInitializerError("Initial SessionFactory creation failed: " + e);
        }
    }

    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
}
