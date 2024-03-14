self.addEventListener('install', function(event) {
    console.log('Service Worker installing.');
    const installing = new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log('Service Worker installed.');
            self.skipWaiting();
            resolve();
        }, 1000);
    });
    event.waitUntil(installing);
});

self.addEventListener('activate', function(event) {
    console.log('Service Worker activating.');
    console.log(event);
    const activating = new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log('Service Worker activated.');
            resolve();
        }, 1000);
    });
    event.waitUntil(activating);
});

self.addEventListener('fetch', function(event) {
    if (event.request.url.includes('.jpg') || event.request.url.includes('.png')) {
        console.log(event.request.url)
        event.respondWith(fetch('./img/nfl.png'));
    }
});
//INTERCEPTAR IDS
self.addEventListener('fetch', event => {
  event.respondWith(
    fetch(event.request)
    .then(response => {
      if (event.request.url == 'https://jsonplaceholder.typicode.com/todos') {
      return response.clone().json().then(data => {
        const modifiedResponse = new Response(JSON.stringify(data.map(item => ({...item, id: item.id + "&"}))), {
        headers: response.headers,
        status: response.status,
        statusText: response.statusText
        });
        return modifiedResponse;
      });
      }
      return response;
    })
    .catch(error => console.error('Error en la solicitud:', error))
  );
});
