import React, { Component } from 'react';
import './App.css';
import person from './Person/Person';
import Person from './Person/Person';

class App extends Component {
  state = {
    persons: [
      {id: '1', name: 'Max', age: 28 },
      {id: '2', name: 'Manu', age: 29 },
      {id: '3', name: 'Stephanie', age: 26 }
    ],
    otherState: 'some other value',
    showPerson: false
  }

  switchNameHandler = (newName) => {
    // console.log('Was clicked!');
    // DON'T DO THIS: this.state.persons[0].name = 'Maximilian';
    this.setState({
      persons: [
        { name: newName, age: 28 },
        { name: 'Manu', age: 29 },
        { name: 'Stephanie', age: 27 }
      ]
    })
  }

  nameChangedHandler = (event, id) => {
    const personIndex = this.state.persons.findIndex(p => p.id === id);
    const person = {...this.state.persons[personIndex]};
    //const person = Object.assign({},this.state.persons[personIndex]);

    person.name = event.target.value;
    const persons = [...this.state.persons]
    persons[personIndex] = person;
    this.setState({
      persons: persons
    })
  }

  deletePersonHandler = (personIndex) => {
    //const persons = this.state.persons.slice();
    const persons = [...this.state.persons];
    persons.splice(personIndex, 1);
    this.setState({persons: persons});
  }

  togglePersonHandler = () => {
    const doesShoe = this.state.showPerson;
    this.setState({
      showPerson: !doesShoe
    });
  }

  render() {
    const style = {
      backgroundColor: 'white',
      font: 'inherit',
      border: '1px solid blue',
      padding: '8px',
      cursor: 'pointer'
    };

    let persons = null;
    if (this.state.showPerson) {
      persons = (
        <div>
          {
            this.state.persons.map((person, index) => {
              return <Person 
                name={person.name} 
                age={person.age}
                click={() => this.deletePersonHandler(index)} 
                key={person.id}
                changed={(event) => this.nameChangedHandler(event, person.id)}/>
            })
          }
        </div>
      );
    }




    return (
      <div className="App">
        <h1>Hi, I'm a React App</h1>
        <p>This is really working!</p>
        <button
          style={style}
          onClick={this.togglePersonHandler}>Toggle persons</button>
        {persons}
      </div>
    );
    // return React.createElement('div', {className: 'App'}, React.createElement('h1', null, 'Does this work now?'));
  }
}

export default App;
