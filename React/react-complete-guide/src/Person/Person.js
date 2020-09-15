import React from 'react';
import "./Person.css";

const person = (props) => {
    return (
        <div className="Person">
            <p onClick={props.click}>I'm a Person! and I am {Math.floor(Math.random() * 30 )} years old</p>
            <p>I'm {props.name}! and I am {props.age} years old</p>
            <p>{props.children}</p>
            <input type="text" onChange={props.changed} value="props.name"/>
        </div>
    );
};

export default person;