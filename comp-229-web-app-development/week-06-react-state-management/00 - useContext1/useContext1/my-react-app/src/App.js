import React, { useState, createContext } from "react";

// Create a context for the count state and its updater function
export const CountContext = createContext();
export const SetCountContext = createContext();

function MyApp({ Component3, ComponentC, pageProps }) {
  // Initialize the count state using useState
  const [count, setCount] = useState(0);

  return (
    // Wrap your components in the context providers
    <CountContext.Provider value={count}>
      <SetCountContext.Provider value={setCount}>
        {/* Render the components and pass the pageProps */}
        <ComponentC {...pageProps} /> <br/> <br/>
        <Component3 {...pageProps} />
      </SetCountContext.Provider>
    </CountContext.Provider>
  );
}

export default MyApp;
