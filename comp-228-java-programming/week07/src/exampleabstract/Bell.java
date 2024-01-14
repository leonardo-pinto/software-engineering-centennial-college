package exampleabstract;

public class Bell extends  PhonePlan {
    @Override
    public void setAllValues() {
        planName = "Bell";
        data = "70GB";
        price = 80;
    }

    @Override
    public void printInfo() {
        System.out.println("Plan name: " + planName);
        System.out.println("Data: " + data);
        System.out.println("Price: " + data);
    }
}
