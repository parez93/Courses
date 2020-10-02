import React from 'react'

const style = {
    display: 'inline-block', 
    padding: '16px', 
    textAlign: 'center', 
    margin: '16px', 
    border: '1px solid black'
};


const charComponent = (props) => {
    return (
        <div 
            style={style}
            onClick={props.click}>
            {props.show}
        </div>
    );
}

export default charComponent;