package centennial;

public class Student {
    public int id;
    public String name;

    public Student(Student student) {
        this.id = student.id;
        this.name = student.name;
    }

    public Student() {
        this.id = 1;
        this.name = "Default name";
    }

    public Student(int id) {
        this.id = id;
    }

    public Student(int id, String name) {
        this.id = id;
        this.name =  name;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
