// var url = "http://api.stackexchange.com/2.2/questions?site=stackoverflow&tagged=javascript"
// var responseData = fetch(url).then(response => response.json())
// console.log(responseData)

// responseData.then(({items, has_more, quota_max, quota_remaining})=> {
//     console.log("Quota Mx: "+quota_max+" Quota Remaining: "+quota_remaining+" Has More: "+has_more)
//     for (const{title, question_id, link, owner} of items ){
//         console.log(question_id + " title: " + title + " link: " + link + "reputation:", owner.reputation, owner.link)
//     }
// })


var url = "https://jsonplaceholder.typicode.com/users"
// var responseData = fetch(url).then(response => response.json())
// console.log(responseData)
// responseData.then((data)=> {
//     console.log(data);
// })


// fetch(url).then(response => response.json()).then(response=> {
//     response.forEach(element => {
//         console.log("User: "+element.username+" city: "+element.address.city+" lat: "+element.address.geo.lat+" lng: "+element.address.geo.lng+"    "+element.address.street+" "+element.address.suite+" "+element.address.zipcode+" "+element.address.city+" "+element.address.geo.lat+" "+element.address.geo.lng+" "+element.address.phone+" "+element.address.website+" "+element.company.name+" "+element.company.catchPhrase+" "+element.company.bs)
//     });
// })

// fetch(url, {
//     method: "POST",
//     headers: {
//         "Content-Type": "application/json"
//     },
//     body: JSON.stringify({
//         username: "foo",
//         email: "foo@gmail.com",
//         userId: 1
//     })
// }).then(response => response.json()).then(response=> {
//     console.log(response);
// })

var url = "https://jsonplaceholder.typicode.com/posts"
fetch(url).then(response => response.json()).then(response=> {
    response.forEach(element => {
        console.log("User: "+element.userId+" id: "+element.id+" title: "+element.title)
    });
});

fetch(url, {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        userId: 1,
        title: "Chuypatabionica"
    })
}).then(response => response.json()).then(response=> {
    console.log(response);
})