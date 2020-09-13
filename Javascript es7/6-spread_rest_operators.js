
// Spread operator con array e oggetti
const numbers = [1,2,3];
const newNumbers = [...numbers, 4];
console.log(newNumbers);


const person = {
    name: 'Fede'
};
const newPerson = {
    ...person, 
    age: 4
};
console.log(newPerson);


// Rest operator
const filter = (...args) => {
    return args.filter(el => el === 1);
}

console.log(filter(1,2,3));

