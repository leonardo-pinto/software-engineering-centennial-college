package com.example.javafx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

public class BorderPaneDemo extends Application {
    @Override
    public void start(Stage stage) throws Exception {

        //Layout Manager
        BorderPane borderPane = new BorderPane();

        Button topButton = new Button("Top Button");
        borderPane.setTop(topButton);

        Button bottomButton = new Button("Bottom Button");
        borderPane.setBottom(bottomButton);

        //Scene
        Scene scene = new Scene(borderPane, 500, 300);

        //Stage
        stage.setTitle("Border Pane");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
