let sumarLento = (numero) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            // resolve(numero + 1);
            reject("Error en sumar lento");
        }, 800);
    });
}

let sumarRapido = (numero) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(numero + 1);
        }, 300);
    });
}

// sumarLento(5).then(console.log);
// sumarRapido(10).then(console.log);

console.log("Promesas encadenadas");

// Promise.all([sumarLento(5), sumarRapido(10)])
//     .then(respuestas => console.log(respuestas))
//     .catch(console.log);

Promise.all([sumarLento(5), sumarRapido(10)])
    .then(respuestas => {
        respuestas.forEach(respuesta => {
            console.log(respuesta);
        })});


        