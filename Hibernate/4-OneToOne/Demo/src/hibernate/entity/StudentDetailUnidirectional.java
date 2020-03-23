package hibernate.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "student_detail")
public class StudentDetailUnidirectional implements Serializable {
    public StudentDetailUnidirectional() {
    }

    public StudentDetailUnidirectional(String channel, String hobby) {
        this.channel = channel;
        this.hobby = hobby;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private String id;

    @Column(name = "youtube_channel")
    private String channel;

    @Column(name = "hobby")
    private String hobby;

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
                '}';
    }
}
