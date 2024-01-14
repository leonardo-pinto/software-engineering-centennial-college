package exercisetwo;

public class PartTimeGameTester implements GameTester {

    private double salary;

    public PartTimeGameTester(double salary) {
        this.salary = salary;
    }

    @Override
    public void generatePayStub() {
        double tax = this.salary * 0.06;
        double netIncome = this.salary - tax;

        System.out.println("*** Paystub - Full Time Gamer Tester ***");
        System.out.println("Gross income: $" + this.salary);
        System.out.println("Net income: $" + netIncome);
    }
}
