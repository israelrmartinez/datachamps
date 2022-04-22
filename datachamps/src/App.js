import logo from './logo.svg';
import './App.css';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Routes,
} from "react-router-dom";
import { useState } from 'react';

import Home from'./Pages/Home';
import About from'./Pages/About';
import Header from './Components/Header/Header';
import React from "react";
import { slide as Menu} from "react-burger-menu";

function App() {
  const [open, setOpen] = useState(false);
  return (
    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //     <p>
    //       Edit <code>src/App.js</code> and save to reload.
    //     </p>
    //     <a
    //       className="App-link"
    //       href="https://reactjs.org"
    //       target="_blank"
    //       rel="noopener noreferrer"
    //     >
    //       Learn React
    //     </a>
    //   </header>
    // </div>
    <Router>
      <Header/>
      <Home />
      <About/>
      {/* <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="/about" element={<About/>} />
      </Routes> */}
      {/* <Menu>
        <Route path="/" element={<Home/>} />
        <Route path="/about" element={<About/>} />
      </Menu> */}
            
    </Router>
  );
}

export default App;
