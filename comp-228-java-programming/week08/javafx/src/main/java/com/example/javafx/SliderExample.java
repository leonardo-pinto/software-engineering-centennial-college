package com.example.javafx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;
import javafx.scene.control.TextArea;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class SliderExample extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        TextArea textArea = new TextArea();

        Slider ageSlider = new Slider(0, 100, 30);
        ageSlider.setShowTickMarks(true);
        ageSlider.setShowTickLabels(true);
        ageSlider.setMajorTickUnit(10);

        Label ageLabel = new Label("Slider value: " + ageSlider.getValue());

        ageSlider.valueProperty().addListener(((observableValue, oldValue, newValue) -> {
            ageLabel.setText("Age " + newValue.intValue());
        }));


        VBox root = new VBox(ageSlider, ageLabel, textArea);

        Scene scene = new Scene(root, 300, 200);

        stage.setScene(scene);
        stage.setTitle("Slider Example");
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
