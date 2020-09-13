// real copy
const number = 1;
const num2 = number;
console.log(num2);

// reference
const person = {
    name:'Fede'
};
const secondPerson = person;
console.log(secondPerson);
person.name = 'Manu';
console.log(secondPerson);

// vera copia dell'oggetto (con spread operator)
const person2 = {
    name:'Fede'
};
const thirdPerson = {...person2};
console.log(thirdPerson);
person2.name = 'Manu';
console.log(thirdPerson);