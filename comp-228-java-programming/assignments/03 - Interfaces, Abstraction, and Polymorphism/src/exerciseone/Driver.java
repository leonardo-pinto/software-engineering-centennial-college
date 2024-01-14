package exerciseone;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Driver {

    static Insurance insuranceFactory(int choice)
    {
        Insurance insurance;
        if (choice == 1) {
            insurance = new Health();
        } else {
            insurance = new Life();
        }
        insurance.setInsuranceCost();
        return insurance;
    }


    public static void main(String[] args) {
        System.out.println("Insurance Application");
        Scanner scanner = new Scanner(System.in);

        Insurance insurance;
        List<Insurance> insuranceList = new ArrayList<Insurance>();

        while (true){
            System.out.println("1. Create insurance");
            System.out.println("2. Display insurance info");
            System.out.println("3. Exit");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.println("Choose the insurance type");
                    System.out.println("1. Health insurance");
                    System.out.println("2. Life insurance");

                    int insuranceType = scanner.nextInt();
                    insurance = insuranceFactory(insuranceType);
                    insuranceList.add(insurance);
                    break;
                case 2:
                    if (insuranceList.isEmpty()) {
                        System.out.println("There are no insurances to display");
                    } else {
                        for (Insurance currInsurance: insuranceList) {
                            currInsurance.displayInfo();
                        }
                    }
                    break;
                case 3:
                    System.out.println("Thank you for using the application");
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice. Please choose and option between 1 and 3");
                    break;
            }
        }
    }
}
