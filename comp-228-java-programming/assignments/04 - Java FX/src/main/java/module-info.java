module com.example.leonardopintocomp228lab4 {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.leonardopintocomp228lab4 to javafx.fxml;
    exports com.example.leonardopintocomp228lab4;
}