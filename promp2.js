function sumaruno (numero) 
{
    var prom = new Promise(function(resolve, reject){
        if(numero < 7)
        {
            reject("Te pasastes de burguer");
        }
        setTimeout(
            function()
            {
                resolve(numero + 1)
            }, 800
        );
    });
    return prom;
}

// console.log(sumaruno(5));
// sumaruno(5).then(newvalor =>{
//     sumaruno(newvalor).then(newvalor2 =>{
//         console.log(newvalor2);
//     });
// });

//Mas ordenado
// sumaruno(5).then(newvalor =>{
//     return sumaruno(newvalor);
//     }).then(newvalor2 =>{
//         return sumaruno(newvalor2);
// }).then(newvalor3 =>{
//     console.log(newvalor3);
// });

// sumaruno(5).then(sumaruno).then(nuevovalor => {
//     console.log(nuevovalor);
//     return sumaruno(nuevovalor);
// }).then(nuevovalor => {
//     console.log(nuevovalor);    
// });

sumaruno(5).then(sumaruno).then(sumaruno).then(nuevovalor => {
    console.log(nuevovalor); 
}).catch(error => {console.log("Error: " + error)});
