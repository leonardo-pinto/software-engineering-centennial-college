package com.example.javafx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class StackPaneDemo extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        // Label
        Label label = new Label("This is my stack pane example");

        //Layout manager
        StackPane root = new StackPane(label);

        //Scene
        Scene scene = new Scene(root, 500, 300);

        //Stage
        stage.setScene(scene);
        stage.setTitle("StackPane Example");
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
