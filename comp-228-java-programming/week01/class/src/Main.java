import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        System.out.print("Centennial");
        System.out.println(" College");
        System.out.println("Welcome to my class");


        Scanner scan = new Scanner(System.in);
        System.out.println("Please enter your name");
        String name = scan.nextLine();
        System.out.println("Please enter your age");
        int age = scan.nextInt();

        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
    }
}
