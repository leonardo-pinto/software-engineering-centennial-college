import exampleabstract.Bell;
import exampleabstract.PhonePlan;
import exampleabstract.Rogers;
import exampleinterface.Circle;
import exampleinterface.Shape;
import exampleinterface.Square;

import java.awt.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
//        Shape circle = new Circle(10);
//        Shape square = new Square(10);
//
//        System.out.println("Circle area: " + circle.calculateArea());
//        System.out.println("Circle perimeter: " + circle.calculatePerimeter());
//
//        System.out.println("Square area: " + square.calculateArea());
//        System.out.println("Square perimeter: " + square.calculatePerimeter());
        Scanner scan = new Scanner(System.in);
        while (true) {
            try {
                System.out.println("Enter your choice");

                int choice = scan.nextInt();

                if (choice >= 1 && choice <= 2) {
                    factoryMethod(choice);
                } else if (choice == 5) {
                    System.exit(0);
                } else {
                    System.out.println("Invalid choice.");
                }
            } catch (Exception e) {
                System.out.println("Please insert a number");
            }
        }
    }

    static void factoryMethod(int choice) {
        PhonePlan phonePlan;
        if (choice == 1) {
            phonePlan = new Rogers();
        } else {
            phonePlan = new Bell();
        }
        phonePlan.setAllValues();
        phonePlan.printInfo();
    }
}