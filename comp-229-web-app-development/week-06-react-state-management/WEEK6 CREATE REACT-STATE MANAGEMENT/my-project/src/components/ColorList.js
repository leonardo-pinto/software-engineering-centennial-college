import React from "react";
import Color from "./Color";

export default function ColorList({
  colors = [],
  onRemoveColor = () => {},
  onRateColor = () => {},
}) {
  return (
    <div className="color-list">
      {colors.length === 0 ? (
        <p>No Colors Listed. (Add a Color)</p>
      ) : (
        colors.map((color) => (
          <Color
            key={color.id}
            {...color}
            onRemove={onRemoveColor}
            onRate={onRateColor}
          />
        ))
      )}
    </div>
  );
}
