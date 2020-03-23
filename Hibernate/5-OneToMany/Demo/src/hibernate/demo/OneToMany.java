package hibernate.demo;

import hibernate.entity.Course;
import hibernate.entity.Student;
import hibernate.entity.StudentDetail;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class OneToMany {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .addAnnotatedClass(StudentDetail.class)
                .addAnnotatedClass(Course.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();



        try {

            session.beginTransaction();
            int id = 1;
            Student student = session.get(Student.class, id);
            Course course1 = new Course("HB");
            Course course2 = new Course("Java");
            student.addCourse(course1);
            student.addCourse(course2);
            session.save(course1);
            session.save(course2);
            session.getTransaction().commit();

            session = factory.getCurrentSession();
            session.beginTransaction();
            Student student2 = session.get(Student.class, id);
            student2.getCourses().forEach(System.out::println);
            session.getTransaction().commit();

        } finally {
            session.close();
            factory.close();
        }

    }
}
