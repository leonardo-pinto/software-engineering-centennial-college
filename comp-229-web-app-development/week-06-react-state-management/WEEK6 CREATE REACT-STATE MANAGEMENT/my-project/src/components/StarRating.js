import React from "react";
import { FaStar } from "react-icons/fa";

export default function StarRating({
  totalStars = 5,
  selectedStars = 0,
  onRate = () => {},
}) {
  const createArray = (length) => {
    return Array.from({ length }, (_, index) => index);
  };

  return (
    <>
      {createArray(totalStars).map((n, i) => (
        <Star
          key={i}
          selected={selectedStars > i}
          onSelect={() => onRate(i + 1)}
        />
      ))}
      {/* Additional JSX goes here */}
    </>
  );
}

const Star = ({ selected = false, onSelect }) => (
  <FaStar color={selected ? "red" : "grey"} onClick={onSelect} />
);
