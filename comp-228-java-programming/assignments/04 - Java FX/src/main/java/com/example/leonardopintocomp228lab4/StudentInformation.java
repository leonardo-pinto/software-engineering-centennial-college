package com.example.leonardopintocomp228lab4;

import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class StudentInformation extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        // List view
        ListView<String> listViewProgrammingLanguage = new ListView<>();

        //Combo Box
        ComboBox<String> comboBoxProgrammingLanguages = new ComboBox<>();
        comboBoxProgrammingLanguages.getItems().addAll("Python", "Java", "C#");
        comboBoxProgrammingLanguages.setOnAction(actionEvent -> {
            String selectedProgrammingLanguage = comboBoxProgrammingLanguages.getValue();

            if(!listViewProgrammingLanguage.getItems().contains(selectedProgrammingLanguage)) {
                listViewProgrammingLanguage.getItems().add(selectedProgrammingLanguage);
            }
        });

        //Toggle group for radio button
        ToggleGroup toggleGroupMajor = new ToggleGroup();

        //Radio button
        RadioButton radioButtonComputerScience = new RadioButton("Computer Science");
        RadioButton radioButtonBusiness = new RadioButton("Business");

        radioButtonComputerScience.setToggleGroup(toggleGroupMajor);
        radioButtonBusiness.setToggleGroup(toggleGroupMajor);

        //HBox
        HBox hBox = new HBox(10, radioButtonComputerScience, radioButtonBusiness);

        //Check box
        CheckBox checkBoxStudentCouncil = new CheckBox("Student Council");
        CheckBox checkBoxVolunteerWork = new CheckBox("Volunteer Work");

        //Text fields
        TextField textFieldName = new TextField();
        TextField textFieldAddress = new TextField();
        TextField textFieldProvince = new TextField();
        TextField textFieldCity = new TextField();
        TextField textFieldPostalCode = new TextField();
        TextField textFieldPhoneNumber = new TextField();
        TextField textFieldEmail = new TextField();

        //Grid Pane
        GridPane gridPane = new GridPane();
        gridPane.setVgap(5);

        gridPane.add(new Label("Name:"), 0, 0);
        gridPane.add(new Label("Address:"), 0, 1);
        gridPane.add(new Label("Province:"), 0, 2);
        gridPane.add(new Label("City:"), 0, 3);
        gridPane.add(new Label("Postal Code:"), 0, 4);
        gridPane.add(new Label("Phone Number:"), 0, 5);
        gridPane.add(new Label("Email:"), 0, 6);

        gridPane.add(textFieldName, 1, 0);
        gridPane.add(textFieldAddress, 1, 1);
        gridPane.add(textFieldProvince, 1, 2);
        gridPane.add(textFieldCity, 1, 3);
        gridPane.add(textFieldPostalCode, 1, 4);
        gridPane.add(textFieldPhoneNumber, 1, 5);
        gridPane.add(textFieldEmail, 1, 6);

        gridPane.add(checkBoxStudentCouncil, 2, 1);
        gridPane.add(checkBoxVolunteerWork, 2, 5);

        gridPane.add(hBox, 3, 0);

        gridPane.add(comboBoxProgrammingLanguages, 3, 1, 1, 2);

        gridPane.add(listViewProgrammingLanguage, 3, 4, 1, 3);

        // TextArea
        TextArea textAreaStudentInformation = new TextArea();
        textAreaStudentInformation.setEditable(false);
        textAreaStudentInformation.setWrapText(true);


        // Button
        Button buttonDisplay = new Button("Display");
        buttonDisplay.setOnAction(actionEvent -> {
            String name = textFieldName.getText();
            String address = textFieldAddress.getText();
            String city = textFieldCity.getText();
            String province = textFieldProvince.getText();
            String postalCode = textFieldPostalCode.getText();
            String phoneNumber = textFieldPhoneNumber.getText();
            String email = textFieldEmail.getText();

            if(name.isEmpty() || address.isEmpty() || city.isEmpty() || province.isEmpty() || postalCode.isEmpty() || phoneNumber.isEmpty()) {
                textAreaStudentInformation.setText("Please fill all the required information");
            } else {
                StringBuilder studentInformation = new StringBuilder();
                studentInformation
                        .append(name).append(", ")
                        .append(address).append(", ")
                        .append(city).append(", ")
                        .append(province).append(", ")
                        .append(postalCode).append(", ")
                        .append(phoneNumber).append(", ")
                        .append(email);

                studentInformation.append("\nCourses: \n");

                for (String course : listViewProgrammingLanguage.getItems()) {
                    studentInformation.append(course).append("\n");
                }

                RadioButton selectedRadioButton = (RadioButton) toggleGroupMajor.getSelectedToggle();
                if (selectedRadioButton != null) {
                    studentInformation.append("Major: ").append(selectedRadioButton.getText()).append("\n");
                }


                textAreaStudentInformation.setText(String.valueOf(studentInformation));
            }
        });

        //layout manager
        VBox root = new VBox(10, gridPane, buttonDisplay, textAreaStudentInformation);
        root.setAlignment(Pos.CENTER);


        //scene
        Scene scene = new Scene(root, 600, 300);

        //stage
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
