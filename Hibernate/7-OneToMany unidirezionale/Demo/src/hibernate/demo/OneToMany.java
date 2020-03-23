package hibernate.demo;

import hibernate.entity.Course;
import hibernate.entity.Review;
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
                .addAnnotatedClass(Review.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();



        try {

            // INSERT
            session.beginTransaction();
            Course course2 = new Course("Angular");
            course2.addReviews(new Review("Good course!!!"));
            session.save(course2);
            session.getTransaction().commit();

            // SELECT

            session = factory.getCurrentSession();
            session.beginTransaction();
            int id = 15;
            Course course = session.get(Course.class, id);
            System.out.println(course);
            course.getReviews().forEach(System.out::println);
            session.getTransaction().commit();



        } finally {
            session.close();
            factory.close();
        }

    }
}
