package exerciseone;

public class Address {
    private String houseNumber;
    private String streetName;
    private String city;
    private String province;
    private String country;
    private String postalCode;

    public Address() {}

    public Address(
            String houseNumber,
            String streetName,
            String city,
            String province,
            String country,
            String postalCode
    ) {
        this.houseNumber = houseNumber;
        this.streetName = streetName;
        this.city = city;
        this.province = province;
        this.country = country;
        this.postalCode = postalCode;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public void printAddressInfo(){
        System.out.println("House Number: " + houseNumber);
        System.out.println("Street Name: " + streetName);
        System.out.println("City: " + city);
        System.out.println("Province: " + province);
        System.out.println("Country: " + country);
        System.out.println("Postal Code: " + postalCode);
    }
}
