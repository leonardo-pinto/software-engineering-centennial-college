package exerciseone;

import exerciseone.Address;

import java.util.List;

public class Customer {
    private String customerId;
    private String name;
    private String contactNumber;
    private String emailId;
    private List<Address> addressList;

    public Customer() {}

    public Customer(
            String customerId,
            String name,
            String contactNumber,
            String emailId,
            List<Address> addressList
    ) {
        this.customerId = customerId;
        this.name = name;
        this.contactNumber = contactNumber;
        this.emailId = emailId;
        this.addressList = addressList;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public void printCustomerInfo() {
        System.out.println("*** CUSTOMER INFORMATION ***");
        System.out.println("Customer ID: " + customerId);
        System.out.println("Name: " + name);
        System.out.println("Contact Number: " + contactNumber);
        System.out.println("Email ID: " + emailId);
        System.out.println("*** ADDRESSES ***");
        for (Address address: addressList) {
            address.printAddressInfo();
        }
    }
}
