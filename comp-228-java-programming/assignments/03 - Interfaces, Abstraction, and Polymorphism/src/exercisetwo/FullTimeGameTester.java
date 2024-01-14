package exercisetwo;

public class FullTimeGameTester implements GameTester {

    private double salary;

    public FullTimeGameTester(double salary) {
        this.salary = salary;
    }

    @Override
    public void generatePayStub() {
        double tax = this.salary * 0.13;
        double netIncome = this.salary - tax;

        System.out.println("*** Paystub - Full Time Gamer Tester ***");
        System.out.println("Gross income: $" + this.salary);
        System.out.println("Net income: $" + netIncome);
    }
}
