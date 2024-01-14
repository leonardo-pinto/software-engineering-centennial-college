
import React from 'react';
import ReactDOM from 'react-dom/client';

import App from './App';
import Component3 from './components/Component3'; // Adjust the import path if needed
import ComponentC from './components/ComponentC'; // Adjust the import path if needed

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App Component3={Component3} ComponentC={ComponentC} />
  </React.StrictMode>
);


