package exerciseone;

public abstract class Insurance {
    // instance variables
    String type;
    double monthlyCost;

    // getters
    public String getType() {
        return type;
    }

    public double getMonthlyCost() {
        return monthlyCost;
    }

    // methods
    abstract void setInsuranceCost();
    abstract void displayInfo();
}
