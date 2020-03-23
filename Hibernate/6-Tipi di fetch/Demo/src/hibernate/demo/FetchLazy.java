package hibernate.demo;

import hibernate.entity.Course;
import hibernate.entity.Student;
import hibernate.entity.StudentDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class FetchLazy {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .addAnnotatedClass(StudentDetail.class)
                .addAnnotatedClass(Course.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try {
            // GET + GETTER
            session.beginTransaction();
            int id = 1;
            Student student = session.get(Student.class, id);
            student.getCourses().forEach(System.out::println);
            session.getTransaction().commit();
            session.close();
            student.getCourses().forEach(System.out::println);


            // HQL
            session = factory.getCurrentSession();
            session.beginTransaction();
            Query<Student> query = session.createQuery("SELECT i " +
                    "FROM Student i " +
                    "JOIN FETCH i.courses " +
                    "WHERE i.id = :id_student", Student.class);

            query.setParameter("id_student", id);

            Student student2 = query.getSingleResult();
            session.getTransaction().commit();
            session.close();
            student2.getCourses().forEach(System.out::println);

        } finally {
            factory.close();
        }

    }
}
