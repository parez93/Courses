package hibernate.demo;

import hibernate.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class ReadDemo {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try{
            // Get the student with id=1
            int id = 1;
            session.beginTransaction();
            System.out.println("SELECT new Student...");
            Student student = session.get(Student.class, id);
            System.out.println(student);
            session.getTransaction().commit();

            // Get all students
            session = factory.getCurrentSession();
            session.beginTransaction();
            System.out.println("SELECT all student...");
            List<Student> studentList = session.createQuery("FROM Student").getResultList();
            studentList.forEach(System.out::println);
            session.getTransaction().commit();
        } finally {
            session.close();
            factory.close();
        }

    }


}
