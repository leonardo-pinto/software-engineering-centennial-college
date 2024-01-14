package thiskeyword;

public class Employee {
    private int id;
    private String name;

    public Employee(){
        this(1111, "Mark");
    }



    public Employee(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public void setAllValues(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
