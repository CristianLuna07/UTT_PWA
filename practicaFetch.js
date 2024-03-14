//FETCH GET / POST RESPOND.CLONE BLOB

var url = "https://jsonplaceholder.typicode.com/photos";

fetch(url)
.then(resp=>{
    resp.clone().json().then(foto => 
    {
        foto.forEach(element => {
            if(element.id == 2)
            console.log(element.title)
        });
    });
    resp.json().then(foto => 
        {
            foto.forEach(element => {
                if(element.id == 1)
                console.log(element.title)
            });
        });
})