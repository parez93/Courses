package hibernate.demo;

import hibernate.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class DeleteDemo {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try{
            // Delete the student with id=1
            int id = 1;
            session.beginTransaction();
            System.out.println("SELECT new Student...");
            Student student = session.get(Student.class, id);
            session.delete(student);
            // print them
            List<Student> studentList = session.createQuery("FROM Student").getResultList();
            studentList.forEach(System.out::println);
            session.getTransaction().commit();


            // Update all students
            session = factory.getCurrentSession();
            session.beginTransaction();
            System.out.println("SELECT all student...");
            session.createQuery("DELETE FROM Student WHERE email = 'mailupdate@mail.com'").executeUpdate();
            // print them
            List<Student> studentList2 = session.createQuery("FROM Student").getResultList();
            studentList2.forEach(System.out::println);
            session.getTransaction().commit();
        } finally {
            session.close();
            factory.close();
        }

    }


}
