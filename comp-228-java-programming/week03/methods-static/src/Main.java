import centennial.Employee;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {
        Employee.province = "Ontario";

        Employee employee = new Employee(123, "Leonardo", "Progress Avenue", 100000);
        employee.generatePayStub();

        Employee employee1 = new Employee(124, "Pouya", "Progress Avenue");
        Employee.generatePartTimePayStub(15.5, 20, employee1);



        Employee employee2 = new Employee(124, "Pouya", "Progress Avenue");
        Employee.generatePayStubStatic(employee2);
    }
}