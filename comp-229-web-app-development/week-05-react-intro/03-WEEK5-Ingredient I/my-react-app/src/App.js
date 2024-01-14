import React from 'react';
import ReactDOM from 'react-dom';

function IngredientsList() {
return React.createElement(
"ul",
{ className: "ingredients" },
React.createElement("li", null, "1 cup unsalted butter"),

React.createElement("li", null, "1 cup crunchy peanut butter"),
React.createElement("li", null, "1 cup brown sugar"),
React.createElement("li", null, "1 cup white sugar"),
React.createElement("li", null, "2 eggs"),
React.createElement("li", null, "2.5 cups all purpose flour"),
React.createElement("li", null, "1 teaspoon baking powder"),
React.createElement("li", null, "0.5 teaspoon salt")
);
}
ReactDOM.render(
React.createElement(IngredientsList, null, null),
document.getElementById("root")
);


export default IngredientsList;