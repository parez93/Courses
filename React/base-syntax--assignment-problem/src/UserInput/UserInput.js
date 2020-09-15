import React from 'react';
import './UserInput.css';

const UserInput = (props) => {
    return(
        <input type="text" onChange={props.click} value={props.username} className='UserInput'/>
    );
}

export default UserInput;