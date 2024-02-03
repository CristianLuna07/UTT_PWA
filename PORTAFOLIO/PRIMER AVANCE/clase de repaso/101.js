// array = [1,2,3,4,5, "foo", "BarProp", true, 2.51]
// obj = {first_name: "foo", lastname: "BarProp", age: 34, status:true}

// console.log(array[5])
// console.log(obj["first_name"])
// console.log(obj.first_name)

// for (var i = 0; i < 1000; i+=5) {
//     console.log(array[i])
// }


// for (let index = 0; index < array.length; index++) {
//     console.log(array[index])
// }

// for(var i of array){
//     console.log(i)
// }

// for (var key in Object.keys(obj)) {
//     console.log(key)
// }

// for (var key in obj) {
//     console.log(key + ": " + obj[key])
// }

// while (i < 100) {
//     console.log(i)
//     i++
// }



// do {
//     console.log(i)
//     i++
// }
// while (i < 100)


// var x = 890
// if (x < 90) {
//     console.log("x is greater")
// }
// else {
//     console.log("x is not greater")
// }


// var animal = "cat"
// if (animal === "cat") {
//     console.log("meow")
// }
// else {
//     console.log("woof")
// }

// var cat = (animal === "cat") ? console.log("meow") : console.log("woof")


// switch (animal) 
// {
//     case "cat":
//         console.log("meow!")
//         break;
//     case "dog":
//         console.log("woof!")
//         break;
//     default:
//         console.log("unknown animal!")
//         break;
// }

// function prism(l) {
//     return function (w){
//         return function (h){
//             return l*w*h
//         }
//     }
// }

// console.log(prism(2)(3)(4)) // 24

// (function(msg){
//     console.log("I am the IIFE" + msg)
// }("Pinches viejas putas"));

// function prism(l, w, h) {
//     return l * w * h
// }

// console.log(prism(2, 3, 4)) // 24

// var prism2 = function sum (l, w, h) {
//     return l * w * h
// }

// sum(1,3,5);


// var say = function(times){
//     if(times > 0){
//         console.log("hello")
//         say(times - 1)
//     }
// }

// var saysay = say
// say = "Oppsie"
// saysay(5)

function personSay(person, ...msg){
    msg.forEach(arg=> {
        console.log(person + "says: " + arg)
    })
}

personSay("John", "Hello", "World", "I", "am", "John")