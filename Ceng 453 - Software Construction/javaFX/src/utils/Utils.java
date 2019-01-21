package utils;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

import static utils.Constants.*;

public class Utils {

    /**
     * creates a grid pane
     * @return the created grid pane
     */
    public static GridPane createGridPane(){
        // Instantiate a new Grid Pane
        GridPane gridPane = new GridPane();

        // Position the pane at the center of the screen, both vertically and horizontally
        gridPane.setAlignment(Pos.CENTER);

        // Set a padding of 20px on each side
        gridPane.setPadding(new Insets(40, 40, 40, 40));

        // Set the horizontal gap between columns
        gridPane.setHgap(10);

        // Set the vertical gap between rows
        gridPane.setVgap(10);
        return gridPane;

    }

    /**
     * Returns the hp label where player can see their health point
     * @param hp is the health point of the player.
     * @return Label
     */
    public static Label getHpLabel(int hp){
        Label result =  new Label("Hp : "+ hp );
        result.setLayoutX(HP_POSITION);
        result.setLayoutY(HP_POSITION);
        result.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        return result;
    }

    /**
     * Shows alert to the user
     * @param alertType the alert type
     * @param owner the alert's owner window
     * @param title the alert's title
     * @param message the alert's message
     */
    public static void showAlert(Alert.AlertType alertType, javafx.stage.Window owner, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.initOwner(owner);
        alert.show();
    }


}
