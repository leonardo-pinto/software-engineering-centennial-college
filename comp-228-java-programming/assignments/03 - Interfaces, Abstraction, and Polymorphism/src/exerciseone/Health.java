package exerciseone;

public class Health extends Insurance {

    public Health() {
        this.type = "Health";
    }

    @Override
    void setInsuranceCost() {
        this.monthlyCost = 75;
    }

    @Override
    void displayInfo() {
        System.out.println("Insurance Type: " + getType());
        System.out.println("Monthly Cost: $" + getMonthlyCost());
    }
}
