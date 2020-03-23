package hibernate.demo;

import hibernate.entity.Student;
import hibernate.entity.StudentDetail;
import hibernate.entity.StudentDetailUnidirectional;
import hibernate.entity.StudentUnidirectional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class OneToOne {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(StudentUnidirectional.class)
                .addAnnotatedClass(Student.class)
                .addAnnotatedClass(StudentDetail.class)
                .addAnnotatedClass(StudentDetailUnidirectional.class)
                .buildSessionFactory();

        Session session = factory.getCurrentSession();

        try {
            // Caso unidirezionale
            StudentUnidirectional student = new StudentUnidirectional("Federico", "Parezzan", "federico@federico.com");
            StudentDetailUnidirectional studentDetailUnidirectional = new StudentDetailUnidirectional("canale youtube", "calcio");
            student.setStudentDetail(studentDetailUnidirectional);

            session.beginTransaction();
            System.out.println("INSERT new Student...");
            session.save(student);
            session.getTransaction().commit();

            // caso bidirezionale
            session = factory.getCurrentSession();
            session.beginTransaction();
            int id = 1;
            StudentDetail studentDetail = session.get(StudentDetail.class, id);
            studentDetail.getStudent().setStudentDetail(null);
            session.delete(studentDetail);
            session.getTransaction().commit();

        } finally {
            session.close();
            factory.close();
        }

    }
}
