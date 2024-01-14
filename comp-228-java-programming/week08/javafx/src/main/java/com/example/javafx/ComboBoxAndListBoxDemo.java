package com.example.javafx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class ComboBoxAndListBoxDemo extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        ListView<String> countryListView = new ListView<>();

        ComboBox<String> countryComboBox = new ComboBox<>();
        countryComboBox.getItems().addAll("Canada", "USA", "Mexico", "Brazil");
        countryComboBox.setOnAction(actionEvent -> {
            String selectedCountry = countryComboBox.getValue();
            countryListView.getItems().add(selectedCountry);
        });

        VBox root = new VBox(10, countryComboBox, countryListView);

        Scene scene = new Scene(root, 300, 200);

        stage.setTitle("ComboBox and ListBox Example");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
