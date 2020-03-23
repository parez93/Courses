package hibernate.solution;

import hibernate.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class Esercizio1 {

    public static void main(String[] args) {
        SessionFactory factory = retrieveFactory();

    try{
        Session session = retrieveConnection(factory);
        Employee employee = new Employee("Federico", "Parezzan", "Reply");
        saveObj(employee, session);

        Session session2 = retrieveConnection(factory);
        getObj(1, session2);

        Session session3 = retrieveConnection(factory);
        getObjByCompany("Reply", session3);


        Session session4 = retrieveConnection(factory);
        deleteObj(1, session4);
    }finally {
        factory.close();
    }

    }

    // (4)
    private static SessionFactory retrieveFactory(){
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Employee.class)
                .buildSessionFactory();
        return factory;
    }

    // (4)
    private static Session retrieveConnection(SessionFactory factory){
        Session session = factory.getCurrentSession();
        return session;
    }

    // (5)
    private static void saveObj(Employee employee, Session session){
        try {
            session.beginTransaction();
            System.out.println("INSERT new Employee...");
            session.save(employee);
            printAllDB(session);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println("saveObj failed: " + e);
        }
    }

    // (6)
    private static void getObj(int id, Session session){
        try {
            session.beginTransaction();
            System.out.println("SELECT new Employee...");
            Employee employee = session.get(Employee.class, id);
            System.out.println(employee);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println("getObj failed: " + e);
        }
    }

    // (7)
    private static void getObjByCompany(String company, Session session){
        try {
            session.beginTransaction();
            System.out.println("SELECT new Employee...");
            List<Employee> employeeList = session.createQuery("FROM Employee WHERE company = '" + company + "'").getResultList();
            printAllDB(session);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println("getObjByCompany failed: " + e);
        }
    }

    // (8)
    private static void deleteObj(int id, Session session){
        try {
            session.beginTransaction();
            System.out.println("DELETE new Employee...");
            Employee employee = session.get(Employee.class, id);
            session.delete(employee);
            printAllDB(session);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println("deleteObj failed: " + e);
        }
    }

    private static void printAllDB(Session session){
        List<Employee> studentList = session.createQuery("FROM Employee").getResultList();
        studentList.forEach(System.out::println);
    }
}
