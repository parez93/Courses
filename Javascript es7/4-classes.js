class Human {
    constructor(){
        this.gender = "male";
    }

    printGender(){
        console.log(this.gender);
    }
}

class Person extends Human{
    constructor(){
        super(); // --> obbligatorio se extends
       this.name = "Fede"; 
       this.gender = "female";
    }

    printMyName(){
        console.log(this.name);
    }
}

const person = new Person();
person.printMyName();
person.printGender();