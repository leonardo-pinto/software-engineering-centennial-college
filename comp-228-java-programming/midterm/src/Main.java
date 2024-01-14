import exerciseone.Account;
import exerciseone.ChequingAccount;
import exerciseone.SavingAccount;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("*** BANKING INFORMATION SYSTEM ***");

        Scanner scanner = new Scanner(System.in);
        List<Account> accountList = new ArrayList<>();

        while (true) {
            System.out.println("1. Add new account");
            System.out.println("2. Show account information");
            System.out.println("3. Close account");
            System.out.println("4. Exit from the application");
            System.out.println();
            System.out.print("Please enter your choice: ");
            int userChoice = scanner.nextInt();
            scanner.nextLine();

            switch(userChoice) {
                case 1:
                    Account newAccount = inputInfo();
                    accountList.add(newAccount);

                    System.out.println("*** New Account Added Successfully ***");
                    System.out.println();
                    break;
                case 2:
                    if (accountList.isEmpty()) {
                        System.out.println("There are no accounts created.");
                    } else {
                        DisplayAccountsNumber(accountList);

                        System.out.println("Enter the account number to check the details");
                        int accountNumber = scanner.nextInt();

                        int accountIndex = findAccountIndex(accountList, accountNumber);

                        if(accountIndex == -1) { // accountIndex remains -1 if account is not found
                            System.out.println("Account not found. Please enter a valid account number");
                        } else {
                            accountList.get(accountIndex).printInfo();
                        }
                        System.out.println();
                        break;
                    }
                case 3:
                if (accountList.isEmpty()) {
                    System.out.println("There are no accounts created.");
                } else {
                    DisplayAccountsNumber(accountList);

                    System.out.println("Enter the account number to be closed");
                    int accountNumber = scanner.nextInt();

                    int accountIndex = findAccountIndex(accountList, accountNumber);

                    if(accountIndex == -1) { // accountIndex remains -1 if account is not found
                        System.out.println("Account not found. Please enter a valid account number");
                    } else {
                        accountList.remove(accountIndex);
                        System.out.println("Account deleted successfully");
                    }
                    System.out.println();
                    break;
                }
                case 4:
                    System.out.println("Thank you for using the application");
                    System.exit(0);
                default:
                    System.out.println("Invalid choice. Please select an option from 1 to 6");
                    break;
            }
        }
    }

    public static void DisplayAccountsNumber(List<Account> accountList){
        System.out.println("*** List of Accounts ***");
        for (Account account: accountList) {
            System.out.println("Number: " + account.getNumber());
        }
    }

    public static Account inputInfo() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter the account information");

        System.out.println("Account number: ");
        int number = scanner.nextInt();
        scanner.nextLine();
        System.out.println("Account holder name: ");
        String holderName = scanner.nextLine();

        System.out.println("Address: ");
        String address = scanner.nextLine();

        System.out.println("Balance: ");
        double balance = scanner.nextDouble();

        System.out.println("Type of account:");
        System.out.println("1. Chequing Account");
        System.out.println("2. Saving Account");
        int accountType = scanner.nextInt();

        if (accountType == 1) {
            return new ChequingAccount(number, holderName, address, balance);
        } else {
            return new SavingAccount(number, holderName, address, balance);
        }
    }

    public static int findAccountIndex (List<Account> accountList, int selectedNumber) {
        int accountIndex = -1; // starts with -1 in case no account matches
        for (int i = 0; i < accountList.size(); i++) {
            if(accountList.get(i).getNumber() == selectedNumber) {
                accountIndex = i;
                break; //
            }
        }
        return accountIndex;
    }


}