import React, { useState } from "react";
import { FaStar } from "react-icons/fa";

export default function StarRating({ totalStars = 5 }) {
  const [selectedStars, setSelectedStars] = useState(0);

  const createArray = (length) => {
    return Array.from({ length }, (_, index) => index);
  };

  return (
    <>
      {createArray(totalStars).map((n, i) => (
        <Star
          key={i}
          selected={selectedStars > i}
          onSelect={() => setSelectedStars(i + 1)}
        />
      ))}
      <p>
        {selectedStars} of {totalStars} stars
      </p>
    </>
  );
}

const Star = ({ selected = false, onSelect }) => (
  <FaStar color={selected ? "red" : "grey"} onClick={onSelect} />
);
