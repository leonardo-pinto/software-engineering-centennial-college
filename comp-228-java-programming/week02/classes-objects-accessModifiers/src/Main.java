import centennial.Employee;

import java.util.Scanner;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("Employee ID: ");
        Employee employee = new Employee();

        employee.setId(scanner.nextInt());

        scanner.nextLine();
        System.out.println("Employee Name: ");
        employee.setName(scanner.nextLine());

        System.out.println("Employee Salary: ");
        employee.setSalary(scanner.nextDouble());

        System.out.println("*** Employee Information ***");
        System.out.println("ID: " + employee.getId());
        System.out.println("Name: " + employee.getName());
        System.out.println("Salary: " + employee.getSalary());

        Employee employee1 = new Employee();
        employee1.setAllFields(102, "Pouya", 50000);

        System.out.println("*** Employee Information ***");
        System.out.println("ID: " + employee1.getId());
        System.out.println("Name: " + employee1.getName());
        System.out.println("Salary: " + employee1.getSalary());
    }
}