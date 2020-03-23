package hibernate.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "student_detail")
public class StudentDetail implements Serializable {
    public StudentDetail() {
    }

    public StudentDetail(String channel, String hobby) {
        this.channel = channel;
        this.hobby = hobby;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "youtube_channel")
    private String channel;

    @Column(name = "hobby")
    private String hobby;

    @OneToOne(mappedBy = "studentDetail",
            cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private Student student;


    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }


    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    @Override
    public String toString() {
        return "StudentDetail{" +
                "id='" + id + '\'' +
                ", channel='" + channel + '\'' +
                ", hobby='" + hobby + '\'' +
                ", student=" + student +
                '}';
    }
}
