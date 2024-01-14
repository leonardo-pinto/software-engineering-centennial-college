import thiskeyword.Employee;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Employee employee = new Employee(1, "Leonardo");
        System.out.println(employee);

        Employee employee1 = new Employee();
        System.out.println(employee1);


        // List data structure
        // best practice to create object using interface
        // so its not possible to create instance from class
        List<String> names = new ArrayList<>();
        names.add("Leonardo");

        System.out.println(names.get(0));

        names.remove(0);


    }
}