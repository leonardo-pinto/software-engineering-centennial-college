package exerciseone;

public class ChequingAccount extends Account {

    private static final double interestPercentage = 0;

    public ChequingAccount(int number, String holderName, String address, double balance) {
        super(number, holderName, address, balance);
    }

    public double getInterest() {
        return getBalance() * interestPercentage;
    }

    @Override
    public void printInfo() {
        super.printInfo();
        System.out.println("Account Type: Chequing Account");
        System.out.println("Interest: " + getInterest());
    }
}
