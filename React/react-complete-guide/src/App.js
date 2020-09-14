import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Person from './Person/Person';

class App extends Component {

  state = {
    persons: [
      {name: 'Fede', age: 29},
      {name: 'Fede2', age: 28},
      {name: 'Fede3', age: 27}
    ]
  }

  render() {
    return (
      <div className="App">
        <h1>Ciao!</h1>
        <button>Switch Name</button>
        <Person name={this.state.persons[0].name} age={this.state.persons[0].age}>1 person</Person>
        <Person name={this.state.persons[1].name} age={this.state.persons[1].age}>2 person</Person>
      </div>
    );
  }
}

export default App;
