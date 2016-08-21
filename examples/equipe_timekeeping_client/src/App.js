import React, { Component } from 'react';
import logo from './equipe.png';
import Timekeeping from './Timekeeping.js';
import './App.css';

class App extends Component {

  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
        </div>
        <Timekeeping url="ws://192.168.1.76:21000"/>
      </div>
    );
  }
}

export default App;
