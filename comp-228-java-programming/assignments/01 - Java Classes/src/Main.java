import exerciseone.Player;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to the Player Records System!");

        System.out.println("How many players would you like to record?");
        int numberOfPlayers = scanner.nextInt();

        scanner.nextLine();

        Player[] players = new Player[numberOfPlayers];

        for(int index = 0; index < numberOfPlayers; index++) {
            // Player object is initially created with default constructed and inserted into players list
            players[index] = new Player();
            System.out.println("New Default Player Created Successfully");
            // player information is displayed using the toString method
            System.out.println(players[index]);

            // for each user input, player property is updated using the corresponding setter
            System.out.println("Enter Player ID: ");
            players[index].setId(scanner.nextLine());

            System.out.println("Enter Player Name: ");
            players[index].setName(scanner.nextLine());

            System.out.println("Enter Player Country: ");
            players[index].setCountry(scanner.nextLine());

            System.out.println("Enter Player Date of Birth (MM/DD/YYYY): ");
            players[index].setDateOfBirth(scanner.nextLine());

            System.out.println("Enter Player Number of Games Played: ");
            players[index].setNumberOfGamesPlayed(scanner.nextInt());
            scanner.nextLine();
        }

        System.out.println("*** Player Records Data ***");
        for (Player player : players) {
            System.out.println(player);
        }
    }
}