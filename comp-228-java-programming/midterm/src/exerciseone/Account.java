package exerciseone;

public class Account {
    private int number;
    private String holderName;
    private String address;
    private double balance;

    public Account(int number, String holderName, String address, double balance) {
        this.number = number;
        this.holderName = holderName;
        this.address = address;
        this.balance = balance;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getHolderName() {
        return holderName;
    }

    public void setHolderName(String holderName) {
        this.holderName = holderName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public void printInfo() {
        System.out.println("Number: " + number);
        System.out.println("Holder Name: " + holderName);
        System.out.println("Address: " + address);
        System.out.println("Balance: " + balance);
    }

    // toString method created based on requirements, but it was not used
    @Override
    public String toString() {
        return  "Number=" + number +
                ", HolderName='" + holderName + '\'' +
                ", Address='" + address + '\'' +
                ", Balance=" + balance +
                '}';
    }
}
