import React, { Component } from 'react';
import './App.css';
import CharComponent from './CharComponent/CharComponent';
import ValidationComponent from './ValidationComponent/ValidationComponent';

class App extends Component {
  state = {
    id: '',
    inputString: '',
    lengthString: 0,
  }

  changeLengthInputHandler = (event) => {
    const length = event.target.value.length;

    this.setState({ 
      id: length,
      lengthString: length, 
      inputString: event.target.value
    });

    //console.log(length);
  }

  removeElement = (index) => {
    console.log('qui');
    let arr = this.state.inputString.split('');
    let newArr = arr.filter((_, ind) => ind !== index).join('');
    console.log(this.state);
    console.log('newArr=' + newArr.toString());

    newArr.toString()
    this.setState({
        lengthString: newArr.length, 
        inputString: newArr.toString()
      });
      console.log(this.state);

  }


  render() {

    let chars = null;
    if (this.state.lengthString !== 0) {
      console.log(this.state.inputString);
      chars = (
        <div>
          {
            this.state.inputString.split('').map((letter, index) => {
              console.log(letter);
              return (
                <CharComponent  
                  show={letter}
                  key={index} 
                  click={() => this.removeElement(index)}/>
              );
            })
          }
        </div>
      );
    }



    return (
      <div className="App">
        <input 
          onChange={this.changeLengthInputHandler} 
          value={this.state.inputString}/>
        <p>Input length: {this.state.lengthString}</p>
        <ValidationComponent length={this.state.lengthString} />
        {chars}
        <ol>
          <li>Create an input field (in App component) with a change listener which outputs the length of the entered text below it (e.g. in a paragraph).</li>
          <li>Create a new component (=> ValidationComponent) which receives the text length as a prop</li>
          <li>Inside the ValidationComponent, either output "Text too short" or "Text long enough" depending on the text length (e.g. take 5 as a minimum length)</li>
          <li>Create another component (=> CharComponent) and style it as an inline box (=> display: inline-block, padding: 16px, text-align: center, margin: 16px, border: 1px solid black).</li>
          <li>Render a list of CharComponents where each CharComponent receives a different letter of the entered text (in the initial input field) as a prop.</li>
          <li>When you click a CharComponent, it should be removed from the entered text.</li>
        </ol>
        <p>Hint: Keep in mind that JavaScript strings are basically arrays!</p>
      </div>
    ); 
  }
}

export default App;
