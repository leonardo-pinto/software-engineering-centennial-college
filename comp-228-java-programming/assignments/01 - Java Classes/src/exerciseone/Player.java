package exerciseone;

public class Player {
    private String id;
    private String name;
    private String country;
    private String dateOfBirth;
    private int numberOfGamesPlayed;

    // Parameterless constructors creates a Player with default values
    public Player() {
        this.id = "Default ID";
        this.name = "Default Name";
        this.country = "Default Country";
        this.dateOfBirth = "Default Date of Birth";
        this.numberOfGamesPlayed = 0;
    }

    public Player(String id) {
        this.id = id;
    }

    public Player(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public Player(String id, String name, String country) {
        this.id = id;
        this.name = name;
        this.country = country;
    }

    public Player(String id, String name, String country, String dateOfBirth) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.dateOfBirth = dateOfBirth;
    }

    public Player(String id, String name, String country, String dateOfBirth, int numberOfGamesPlayed) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.dateOfBirth = dateOfBirth;
        this.numberOfGamesPlayed = numberOfGamesPlayed;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getNumberOfGamesPlayed() {
        return numberOfGamesPlayed;
    }

    public void setNumberOfGamesPlayed(int numberOfGamesPlayed) {
        this.numberOfGamesPlayed = numberOfGamesPlayed;
    }

    public void setAllValues(String id, String name, String country, String dateOfBirth, int numberOfGamesPlayed) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.dateOfBirth = dateOfBirth;
        this.numberOfGamesPlayed = numberOfGamesPlayed;
    }

    @Override
    public String toString() {
        return "Player{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", numberOfGamesPlayed=" + numberOfGamesPlayed +
                '}';
    }
}
