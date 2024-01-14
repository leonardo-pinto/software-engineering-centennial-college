package com.example.javafx;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class StudentInfoExample extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        //TextField
        TextField idTextField = new TextField();
        idTextField.setPromptText("Enter student id");
        TextField nameTextField = new TextField();
        nameTextField.setPromptText("Enter student name");
        TextField programTextField = new TextField();
        programTextField.setPromptText("Enter student program");

        //Text area
        TextArea studentInfoTextArea = new TextArea();
        studentInfoTextArea.setEditable(false);
        studentInfoTextArea.setWrapText(true);

        //Button
        Button submitButton = new Button("Submit");

        submitButton.setOnAction(actionEvent -> {
            String id = idTextField.getText();
            String name = nameTextField.getText();
            String program = programTextField.getText();

            String studentInfo = "ID: " + id + "\nName: " + name + "\nProgram: " + program;
            studentInfoTextArea.setText(studentInfo);
        });



        GridPane gridPane = new GridPane();
        gridPane.setHgap(10);
        gridPane.setVgap(10);
        gridPane.setPadding(new Insets(10));
        gridPane.add(new Label("ID: "), 0, 0);
        gridPane.add(new Label("Name: "), 0, 1);
        gridPane.add(new Label("ID: "), 0, 2);
        gridPane.add(idTextField, 1, 0);
        gridPane.add(nameTextField, 1, 1);
        gridPane.add(programTextField, 1, 2);
        gridPane.add(submitButton, 0, 3);

        VBox root = new VBox(gridPane, studentInfoTextArea);

        Scene scene = new Scene(root);

        stage.setTitle("Student Application");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
