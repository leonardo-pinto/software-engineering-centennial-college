import centennial.Student;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {
        Student student = new Student();

        System.out.println("*** Student Info ***");
        System.out.println(student.id);
        System.out.println(student.name);

        Student student1 = new Student(1);
        System.out.println("*** Student Info ***");
        System.out.println(student1.id);
        System.out.println(student1.name);

        Student student2 = new Student(2, "Leonardo");
        System.out.println("*** Student Info ***");
        System.out.println(student2.id);
        System.out.println(student2.name);

        Student student3 = new Student(student);
        System.out.println("*** Student Info ***");
        System.out.println(student3);

    }
}