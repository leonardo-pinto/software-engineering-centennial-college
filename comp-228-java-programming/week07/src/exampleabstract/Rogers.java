package exampleabstract;

public class Rogers extends PhonePlan {

    @Override
    public void setAllValues() {
        planName = "Rogers";
        data = "50GB";
        price = 60;
    }

    @Override
    public void printInfo() {
        System.out.println("Plan name: " + planName);
        System.out.println("Data: " + data);
        System.out.println("Price: " + data);
    }
}
