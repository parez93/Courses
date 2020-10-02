
import React from 'react'


const lengthValidation = (length) => {
    console.log(length);
    return length < 5 ? 'Text too short' : 'Text too long';
}

const validationComponent = (props) => {
    return (
        <p>{lengthValidation(props.length)}</p>
    );
}

export default validationComponent;