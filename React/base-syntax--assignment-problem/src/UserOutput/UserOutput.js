import React from 'react';


const UserOutput = (props) => {
    const styleUsername = {
        marginTop: '10px',
        color: 'blue',
        border: '1px solid green',
        padding: '5px'

    }

    const styleDiv = {
        marginTop: '10px',
        color: '#000',
        border: '5px solid #ccc',
        padding: '5px'

    }

    return(
        <div style={styleDiv}>
            <p style={styleUsername}>{props.username}</p>
            <p>Del testo</p>
        </div>
    );
}

export default UserOutput;