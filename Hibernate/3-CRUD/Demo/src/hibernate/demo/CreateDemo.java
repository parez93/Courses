package hibernate.demo;

import hibernate.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class CreateDemo {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try{
            Student student = new Student("Federico", "Parezzan", "mail@mail.com");
            session.beginTransaction();
            System.out.println("INSERT new Student...");
            session.save(student);
            session.getTransaction().commit();
        } finally {
            session.close();
            factory.close();
        }

    }


}
