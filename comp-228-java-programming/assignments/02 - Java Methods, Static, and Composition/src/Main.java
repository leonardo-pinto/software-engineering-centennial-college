import exerciseone.Address;
import exerciseone.Customer;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("*** CUSTOMER MANAGEMENT APPLICATION ***");

        Scanner scanner = new Scanner(System.in);
        List<Customer> customerList = new ArrayList<Customer>();

        while (true) {
            System.out.println("1. Add Customer Information with default address");
            System.out.println("2. Add extra address in specific customer");
            System.out.println("3. Remove customer information based on customer id");
            System.out.println("4. Find customer information with all addresses based on customer id");
            System.out.println("5. Display all customer information with all addresses");
            System.out.println("6. Exit from the application");
            System.out.println();
            System.out.print("Please enter your choice: ");
            int userChoice = scanner.nextInt();
            scanner.nextLine();

            switch(userChoice) {
                case 1:
                    System.out.println("Please enter the customer information");
                    System.out.println("ID: ");
                    String customerId = scanner.nextLine();

                    System.out.println("Name: ");
                    String name = scanner.nextLine();

                    System.out.println("Contact Number: ");
                    String contactNumber = scanner.nextLine();

                    System.out.println("Email ID: ");
                    String emailId = scanner.nextLine();

                    List<Address> addressList = new ArrayList<Address>();

                    Address defaultAddress = promptUserAndCreateAddress();
                    addressList.add(defaultAddress);

                    Customer newCustomer = new Customer(customerId, name, contactNumber, emailId, addressList);
                    customerList.add(newCustomer);

                    System.out.println("*** New Customer Added Successfully ***");
                    System.out.println();
                    break;
                case 2:
                    displayCustomerIds(customerList);

                    System.out.println("Enter Customer ID to add an extra address");
                    String id = scanner.nextLine();

                    int customerIndex = findCustomerIndex(customerList, id);

                    if(customerIndex == -1) { // customerIndex is -1 when customer is not found
                        System.out.println("Customer not found. Please enter a valid Customer ID");
                    } else {
                        Address newAddress = promptUserAndCreateAddress();
                        // by using the previous customerIndex, we avoid doing another loop to update the address
                        customerList.get(customerIndex).getAddressList().add(newAddress);
                        System.out.println("New address successfully added to customer " + id);
                    }
                    System.out.println();
                    break;
                case 3:
                    displayCustomerIds(customerList);

                    System.out.println("Enter Customer ID to be removed");
                    String id1 = scanner.nextLine();

                    int customerIndex1 = findCustomerIndex(customerList, id1);

                    if(customerIndex1 == -1) {
                        System.out.println("Customer not found. Please enter a valid Customer ID");
                    } else {
                        // by using the previous customerIndex, we avoid doing another loop to update the address
                        customerList.remove(customerIndex1);
                        System.out.println("Customer " + id1 + " information removed successfully");
                    }
                    System.out.println();
                    break;
                case 4:
                    displayCustomerIds(customerList);

                    System.out.println("Enter Customer ID to be display information");
                    String id2 = scanner.nextLine();

                    int customerIndex2 = findCustomerIndex(customerList, id2);

                    if(customerIndex2 == -1) {
                        System.out.println("Customer not found. Please enter a valid Customer ID");
                    } else {
                        customerList.get(customerIndex2).printCustomerInfo();
                    }
                    System.out.println();
                    break;
                case 5:
                    if (customerList.isEmpty()) {
                        System.out.println("There are no customers registered");
                    } else {
                        for (Customer customer1: customerList) {
                            customer1.printCustomerInfo();
                        }
                    }
                    break;
                case 6:
                    System.out.println("Thank you for using the application");
                    System.exit(0);
                default:
                    System.out.println("Invalid choice. Please select an option from 1 to 6");
                    break;
            }
        }
    }

    public static Address promptUserAndCreateAddress() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("House Number: ");
        String houseNumber = scanner.nextLine();

        System.out.println("Street Name: ");
        String streetName = scanner.nextLine();

        System.out.println("City: ");
        String city = scanner.nextLine();

        System.out.println("Province: ");
        String province = scanner.nextLine();

        System.out.println("Country: ");
        String country = scanner.nextLine();

        System.out.println("Postal Code: ");
        String postalCode = scanner.nextLine();

        return new Address(houseNumber, streetName, city, province, country, postalCode);
    }

    public static void displayCustomerIds(List<Customer> customerList) {
        System.out.println("*** List of Customers ID ***");
        for (Customer customer: customerList) {
            System.out.println("ID: " + customer.getCustomerId());
        }
    }

    public static int findCustomerIndex (List<Customer> customerList, String selectedId) {
        int customerIndex = -1;
        for (int i = 0; i < customerList.size(); i++) {
            if(customerList.get(i).getCustomerId().equals(selectedId)) {
                customerIndex = i; // save index to update address list later
                break; // prevent loop for continue running after a matching id is found
            }
        }
        return customerIndex;
    }
}