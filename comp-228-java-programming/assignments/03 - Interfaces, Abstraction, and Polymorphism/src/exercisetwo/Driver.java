package exercisetwo;

import java.util.Scanner;

public class Driver {

    static GameTester factoryGameTester(int choice, double salary) {
        GameTester gameTester;
        if (choice == 1) {
            gameTester = new FullTimeGameTester(salary);
        } else {
            gameTester = new PartTimeGameTester(salary);
        }
        return gameTester;
    }

    public static void main(String[] args) {
        System.out.println("Game Tester Application");
        Scanner scanner = new Scanner(System.in);

        GameTester gameTester;
        while (true) {
            System.out.println("Enter your choice to create a Game Tester");
            System.out.println("1. Full Time Game Tester");
            System.out.println("2. Part Time Game Tester");
            System.out.println("3. Exit application");

            int choice = scanner.nextInt();

            if (choice == 1 || choice == 2) {
                System.out.println("Enter the game tester salary");
                double salary = scanner.nextDouble();
                gameTester = factoryGameTester(choice, salary);
                gameTester.generatePayStub();
            } else if (choice == 3) {
                System.out.println("Thank you for using the application");
                System.exit(0);
            } else {
                System.out.println("Invalid choice. Please enter a number between 1 and 3");
            }
        }
    }
}
