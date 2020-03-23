package hibernate.entity;

import javax.persistence.*;


@Entity
@Table(name = "student")
public class StudentUnidirectional {

    public StudentUnidirectional(String name, String surname, String email) {
        this.name = name;
        this.surname = surname;
    }

    public StudentUnidirectional() {
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "email")
    private String email;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_detail_id")
    private StudentDetailUnidirectional studentDetail;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setStudentDetail(StudentDetailUnidirectional studentDetail) {
        this.studentDetail = studentDetail;
    }

    public StudentDetailUnidirectional getStudentDetail() {
        return studentDetail;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", studentDetail=" + studentDetail +
                '}';
    }
}
