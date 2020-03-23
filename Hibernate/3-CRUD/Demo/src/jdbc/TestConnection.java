package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/student_tracker?useSSL=false&serverTimezone=UTC";
        String user = "admin";
        String psw = "admin";

        try{
            Connection connection = DriverManager.getConnection(url, user, psw);
            System.out.println("Connection retrieved!");
        } catch(Exception e){
            e.printStackTrace();
            System.out.println("Connection error!");
        }

    }

}
