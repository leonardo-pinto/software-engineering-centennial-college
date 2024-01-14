package com.example.javafx;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class CalculatorApp extends Application {
    @Override
    public void start(Stage stage) throws Exception {


        // Button


        // Create group to select only one option
        ToggleGroup calculationToggleGroup = new ToggleGroup();

        // Radio buttons
        RadioButton additionRadioButton = new RadioButton("Addition");
        RadioButton subtractionRadioButton = new RadioButton("Subtraction");
        RadioButton multiplicationRadioButton = new RadioButton("Multiplication");
        RadioButton divisionRadioButton = new RadioButton("Division");

        // Add radio buttons into toggle group
        additionRadioButton.setToggleGroup(calculationToggleGroup);
        subtractionRadioButton.setToggleGroup(calculationToggleGroup);
        multiplicationRadioButton.setToggleGroup(calculationToggleGroup);
        divisionRadioButton.setToggleGroup(calculationToggleGroup);

        // HBox
        HBox hBox = new HBox(10, additionRadioButton, subtractionRadioButton, multiplicationRadioButton, divisionRadioButton);
        hBox.setPadding(new Insets(10, 10, 10, 10));

        // FlowPane
        FlowPane flowPane = new FlowPane();
        flowPane.setHgap(10);
        flowPane.setPadding(new Insets(10));
        flowPane.getChildren().addAll(additionRadioButton, subtractionRadioButton, multiplicationRadioButton, divisionRadioButton);

        // Labels
        Label firstNumberLabel = new Label("Number 1: ");
        Label secondNumberLabel = new Label("Number 2: ");
        Label resultLabel = new Label("Result: ");

        // Text Fields
        TextField firstNumberTextField = new TextField();
        firstNumberTextField.setPromptText("Enter first number");
        TextField secondNumberTextField = new TextField();
        secondNumberTextField.setPromptText("Enter second number");

        // Button
        Button calculateButton = new Button("Calculate");

        // Add event to control
        calculateButton.setOnAction(actionEvent -> {
            double num1 = Double.parseDouble(firstNumberTextField.getText());
            double num2 = Double.parseDouble(secondNumberTextField.getText());

            RadioButton selectedRadioButton = (RadioButton) calculationToggleGroup.getSelectedToggle();
            if (selectedRadioButton != null) {
                double result = 0;
                String selectedRadioButtonValue = selectedRadioButton.getText();
                switch (selectedRadioButtonValue) {
                    case "Addition":
                        result = num1 + num2;
                        break;
                    case "Subtraction":
                        result = num1 - num2;
                        break;
                    case "Multiplication":
                        result = num1 * num2;
                        break;
                    case "Division":
                        result = num1 / num2;
                        break;
                }
                resultLabel.setText("Result: " + result);
            } else {
                resultLabel.setText("No operation option selected");
            }
        });

        // Grid Pane
        GridPane gridPane = new GridPane();
        gridPane.setHgap(10);
        gridPane.setVgap(10);
        gridPane.setPadding(new Insets(10,10,10,10));
        gridPane.add(firstNumberLabel, 0, 0);
        gridPane.add(firstNumberTextField, 1, 0);
        gridPane.add(secondNumberLabel, 0, 1);
        gridPane.add(secondNumberTextField, 1, 1);

        // Layout Manager - VBox
        VBox root = new VBox(10, gridPane, flowPane, calculateButton, resultLabel);
        root.setPadding(new Insets(10, 10, 10, 10));

        // Scene (Parent parent(Scene-graph) root (Layout Manager))
        // Scene(root)
        // Scene(root, bg, width)
        //Scene (root, bg, width, height)
        Scene scene = new Scene(root, 600, 200, Color.RED);


//        Image iconImage = new Image("path");
//        stage.getIcons().add(iconImage);

        // stage
        stage.setTitle("Calculator App");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
