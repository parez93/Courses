package hibernate.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "course")
public class Course {

    public Course() {
    }

    public Course(String tile) {
        this.tile = tile;
    }

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "title")
    private String tile;


    @ManyToMany
    @JoinTable(
            name = "",
            joinColumns = @JoinColumn(name ="course_id"),
            inverseJoinColumns = @JoinColumn(name = "student_id")
    )
    private List<Student> student;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTile() {
        return tile;
    }

    public void setTile(String tile) {
        this.tile = tile;
    }

    public List<Student> getStudent() {
        return student;
    }

    public void setStudent(List<Student> student) {
        this.student = student;
    }

    public void addStudent(Student theStudent) {

        if (student == null) {
            student = new ArrayList<>();
        }

        student.add(theStudent);
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", tile='" + tile + '\'' +
                ", student=" + student +
                '}';
    }
}
