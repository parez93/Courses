import React, { useState } from 'react';
import logo from './logo.svg';
import './App.css';
import Person from './Person/Person';

const app = props => {
  const [personState, setPersonsState] = useState({
    persons: [
      {name: 'Fede', age: 29},
      {name: 'Fede2', age: 28},
      {name: 'Fede3', age: 27}
    ],
  });

  /*
  VERSIONE PULITA
  E' buona norma non creare un unico grande oggetto che gestisce lo stato, ma più sezioni di stato separate
  */
  const [otherState, setOtherState] = useState("some other value");

  console.log(personState, otherState);

  const switchNameHandler = (newName) => {
    console.log("Was clicked!");
    // DON'T DO THIS: this.state.persons[0].name = "Federico";
    setPersonsState({
      persons: [
        {name: newName, age: 290},
        {name: 'Fede2Change', age: 280},
        {name: 'Fede3Change', age: 270}
      ],
      /*
      VERSIONE POCO ELEGANTE
      // lo devo aggiungere perchè con gli hook non viene fatto una copia del precedente valore
      otherState: personState.otherState 
      */
   });
  }

nameChangeHandler = (event) => {
  this.setPersonsState({
    persons: [
      {name: event.target.value, age: 290},
      {name: 'Fede2Change', age: 280},
      {name: 'Fede3Change', age: 270}
    ],
 });
}

const style = {
  backgroundColor: 'white',
  font: 'inherit',
  border: '1px solid blue',
  padding: '8px',
  cursor: 'pointer'
};

    return (
      <div className="App">
        <h1>Ciao!</h1>
        <!-- meglio usare questo se possibile-->
        <button 
          style={style}
          onClick={this.switchNameHandler.bind(this, "Federico")}>Switch Name</button>
        <!-- puo essere inefficiente -->
        <button onClick={() => this.switchNameHandler("Federico!")}>Switch Name 2</button> 
        <Person 
          name={personState.persons[0].name} 
          age={personState.persons[0].age}
          click={this.switchNameHandler.bind(this, "Federi")}
          changed={this.nameChangeHandler}>1 person</Person>
        <Person 
          name={personState.persons[1].name} 
          age={personState.persons[1].age}
          click={this.switchNameHandler.bind(this, "Fed")}>2 person</Person>
      </div>
    );
}

export default app;


