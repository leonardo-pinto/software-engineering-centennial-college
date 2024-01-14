package com.example.javafx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class CheckBoxDemo extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        CheckBox singingCheckBox = new CheckBox("Singing");
        CheckBox hikingCheckBox = new CheckBox("Hiking");
        CheckBox readingCheckBox = new CheckBox("Reading");

        Button displayHobbiesButton = new Button("Display Hobbies");

        Label hobbiesLabel = new Label();

        displayHobbiesButton.setOnAction(actionEvent -> {
            String selectedHobbies = "";
            if(singingCheckBox.isSelected()) {
                selectedHobbies += " Singing ";
            }
            if(hikingCheckBox.isSelected()) {
                selectedHobbies += " Hiking ";
            }
            if(readingCheckBox.isSelected()) {
                selectedHobbies += " Reading ";
            }


            hobbiesLabel.setText(selectedHobbies);
        });


        VBox root = new VBox(singingCheckBox, readingCheckBox, hikingCheckBox, displayHobbiesButton, hobbiesLabel);

        Scene scene = new Scene(root, 300, 300);

        stage.setTitle("Check Box Example");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
