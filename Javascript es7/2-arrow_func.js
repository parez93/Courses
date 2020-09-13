function printMyNameFunc(name) {
    console.log(name);
}

const printMyNameArrowFunc = (name) => {
    console.log(name);
}

const printMyNameArrowFunc2 = name => {
    console.log(name);
}

const printMyNameArrowFunc3 = () => {
    console.log("Fede");
}

const printMyNameArrowFunc4 = (name, age) => {
    console.log(name, age);
}

const multiply = (numb) => {
    return numb * 2;
}

const multiplyArrowFunc = (numb) => numb * 2;

printMyNameFunc("Federico - func");
printMyNameArrowFunc("Federico - arrowFunc");