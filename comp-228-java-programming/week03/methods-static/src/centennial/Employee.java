package centennial;

public class Employee {
    private int id;
    private String name;
    private String address;
    public static String province;
    private double salary;

    public Employee(int id, String name, String address, double salary) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.salary = salary;
    }

    public Employee(int id, String name, String address) {
        this.id = id;
        this.name = name;
        this.address = address;
    }

    private static double calculateFederalTax(double salary) {
        double federalTax;

        if (salary <= 40000) {
            federalTax = salary * 0.1;
        } else if (salary <= 60000) {
            federalTax = salary * 0.15;
        } else {
            federalTax = salary * 0.2;
        }

        return federalTax;
    }

    private static double calculateProvinceTax(double salary) {
       double provinceTax;
            if (salary <= 24000) {
                provinceTax = salary * 0.16;
            } else if (salary <= 35000) {
                provinceTax = salary * 0.27;
            } else {
                provinceTax = salary * 0.39;
            }

        return provinceTax;
    }

    public void generatePayStub() {
        double provinceTax = calculateProvinceTax(salary);
        double federalTax = calculateFederalTax(salary);
        double netSalary = salary - (provinceTax + federalTax);

        System.out.println("*** PAY STUB ***");
        System.out.println("Name: " + name);
        System.out.println("Salary: " + salary);
        System.out.println("Province Tax: " + provinceTax);
        System.out.println("Federal Tax: " + federalTax);
        System.out.println("Net Salary: " + netSalary);
    }

    public static void generatePartTimePayStub(double payRate, int workingHours, Employee employee) {
        double actualSalary = payRate * workingHours;
        double provinceTax = calculateProvinceTax(actualSalary);
        double federalTax = calculateFederalTax(actualSalary);
        double netSalary = actualSalary - (provinceTax + federalTax);

        System.out.println("*** PAY STUB PART TIME***");
        System.out.println("Name: " + employee.name);
        System.out.println("Salary: " + actualSalary);
        System.out.println("Province Tax: " + provinceTax);
        System.out.println("Federal Tax: " + federalTax);
        System.out.println("Net Salary: " + netSalary);
    }

    private static double calculateTaxByProvince(double salary, String province) {
        double finalTax = 0;
        if (province == "ON") {
            finalTax = calculateTaxOntario(salary);
        } else if (province == "AB") {
            finalTax = calculateTaxAlberta(salary);
        }

        return finalTax;
    }

    private static double calculateTaxOntario(double salary) {
        double provinceTax;
        if (salary <= 24000) {
            provinceTax = salary * 0.16;
        } else if (salary <= 35000) {
            provinceTax = salary * 0.27;
        } else {
            provinceTax = salary * 0.39;
        }

        return provinceTax;
    }

    private static double calculateTaxAlberta(double salary) {
        double provinceTax;
        if (salary <= 24000) {
            provinceTax = salary * 0.16;
        } else if (salary <= 35000) {
            provinceTax = salary * 0.27;
        } else {
            provinceTax = salary * 0.39;
        }

        return provinceTax;
    }

    public static void generatePayStubStatic(Employee employee) {
        double provinceTax = calculateTaxByProvince(employee.salary, Employee.province); //province is not static
        // double federalTax = calculateFederalTax(salary);
        double netSalary = employee.salary - provinceTax;
    }
}
