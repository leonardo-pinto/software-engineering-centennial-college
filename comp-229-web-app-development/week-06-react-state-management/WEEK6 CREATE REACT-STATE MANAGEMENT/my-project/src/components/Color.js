import React from "react";
import StarRating from "./StarRating"; // Import the StarRating component
import { FaTrash } from "react-icons/fa";

export default function Color({
  id,
  title,
  color,
  rating,
  onRemove = () => {},
  onRate = () => {},
}) {
  const removeColor = () => {
    onRemove(id);
  };

  return (
    <section>
      <h1>{title}</h1>
      <button onClick={removeColor}>
        <FaTrash color="red" />
      </button>
      <div style={{ height: 50, backgroundColor: color }} />
      <StarRating
        selectedStars={rating}
        onRate={(rating) => onRate(id, rating)}
      />
    </section>
  );
}
