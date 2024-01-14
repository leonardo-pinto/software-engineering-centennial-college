package exerciseone;

public class SavingAccount extends Account {

    private final double interestPercentage = 0.04;

    public SavingAccount(int number, String holderName, String address, double balance) {
        super(number, holderName, address, balance);
    }

    public double getInterest() {
        return getBalance() * interestPercentage;
    }

    @Override
    public void printInfo() {
        super.printInfo();
        System.out.println("Account Type: Saving Account");
        System.out.println("Interest: " + getInterest());
    }
}
