const axios = require('axios');

const url = 'https://jsonplaceholder.typicode.com/users';

// axios.get(url)
//     .then(response => {
//         response.data.forEach(element => console.log("ID: "+ element.id + " User Name: " + element.username +  " Email: " + element.email ))
//     });

axios.post(url , {
    username: 'ElPepe',
    email: "xd@gmail.com"
}).then((response) => {
    console.log(response.data);
}).catch((error) => {
    console.log(error);
});