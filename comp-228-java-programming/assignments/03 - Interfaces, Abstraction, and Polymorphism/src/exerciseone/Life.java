package exerciseone;

public class Life extends Insurance {
    public Life() {
        this.type = "Life";
    }

    @Override
    void setInsuranceCost() {
        this.monthlyCost = 40;
    }

    @Override
    void displayInfo() {
        System.out.println("Insurance Type: " + getType());
        System.out.println("Monthly Cost: $" + getMonthlyCost());
    }
}
