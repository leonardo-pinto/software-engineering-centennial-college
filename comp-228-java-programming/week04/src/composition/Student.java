package composition;

public class Student {
    private int studentId;
    private String name;
    private Address address;

    public Student(int studentId, String name, Address address) {
        this.studentId = studentId;
        this.name = name;
        this.address = address;
    }
}
