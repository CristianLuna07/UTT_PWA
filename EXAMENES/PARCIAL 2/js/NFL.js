// La liga de la NFL requiere una aplicacion en JS que resuelva el problema de la pizarra de pendientes, la aplicaicones debe contemplar
// el control de la lsita de pendientes (ToDo), esta aplicación debe de obtener la lista de pendientes de la siguiente url
const url = "https://jsonplaceholder.typicode.com/todos";
//Se recomienda visitar la url y comprobar quew está toda la información necesaria, por otro lado la NFL necesita que la aplicación realice lo siguiente
/* 
  1.- Lista de todos los pendientes(solo IDs)
  2.- Lista de todos los pendientes(IDs y Titles)
  3.- Lista de todos los pendientes sin resolver (ID y title)
  4.- Lista de todos los pendientes resueltos (ID y title)
  5.- Lista de todos los pendientes (IDs y userId)
  6.- Lista de todos los pendientes resueltos (IDs y userId)
  7.- Lista de todos los pendientes sin resolver (IDs y userId)

La aplicacion dbe de tener un menú de navegacion para un mejor manejo de la aplicación
*/

//Función principal para obtener la lista de pendientes y mostrar el menú de opciones
function main() {
  if (navigator.serviceWorker) {
    console.log("SW.compatiable")
    navigator.serviceWorker.register('/sw.js')
  }
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      const allIds = [];
      const allIdsAndTitles = [];
      const unresolvedAllIdsAndTitles = [];
      const resolvedAllIdsAndTitles = [];
      const allIdsAndUserIds = [];
      const resolvedAllIdsAndUserIds = [];
      const unresolvedAllIdsAndUserIds = [];

      for (const todo of data) {
        allIds.push(todo.id);
        allIdsAndTitles.push({ id: todo.id, title: todo.title });
        allIdsAndUserIds.push({ id: todo.id, userId: todo.userId });

        if (!todo.completed) {
          unresolvedAllIdsAndTitles.push({
            id: todo.id,
            title: todo.title,
          });
          unresolvedAllIdsAndUserIds.push({
            id: todo.id,
            userId: todo.userId,
          });
        } else {
          resolvedAllIdsAndTitles.push({ id: todo.id, title: todo.title });
          resolvedAllIdsAndUserIds.push({
            id: todo.id,
            userId: todo.userId,
          });
        }
      }

      const tableContainer = document.getElementById("Listado");

      window.showAllIds = function() {
        let result = "Lista de todos los pendientes (solo IDs):<br>";
        result += "<table>";
        result += "<tr><th>ID</th></tr>";
        allIds.forEach((element) => {
          result += "<tr><td>" + element + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };

      window.showAllIdsAndTitles = function() {
        let result = "Lista de todos los pendientes (IDs y Titles):<br>";
        result += "<table>";
        result += "<tr><th>ID</th><th>Title</th></tr>";
        allIdsAndTitles.forEach((element) => {
          result += "<tr><td>" + element.id + "</td><td>" + element.title + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };

      window.showUnresolvedAllIdsAndTitles = function() {
        let result = "Lista de todos los pendientes sin resolver (ID y title):<br>";
        result += "<table>";
        result += "<tr><th>ID</th><th>Title</th></tr>";
        unresolvedAllIdsAndTitles.forEach((element) => {
          result += "<tr><td>" + element.id + "</td><td>" + element.title + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };

      window.showResolvedAllIdsAndTitles = function() {
        let result = "Lista de todos los pendientes resueltos (ID y title):<br>";
        result += "<table>";
        result += "<tr><th>ID</th><th>Title</th></tr>";
        resolvedAllIdsAndTitles.forEach((element) => {
          result += "<tr><td>" + element.id + "</td><td>" + element.title + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };

      window.showAllIdsAndUserIds = function() {
        let result = "Lista de todos los pendientes (IDs y userId):<br>";
        result += "<table>";
        result += "<tr><th>ID</th><th>UserId</th></tr>";
        allIdsAndUserIds.forEach((element) => {
          result += "<tr><td>" + element.id + "</td><td>" + element.userId + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };

      window.showResolvedAllIdsAndUserIds = function() {
        let result = "Lista de todos los pendientes resueltos (IDs y userId):<br>";
        result += "<table>";
        result += "<tr><th>ID</th><th>UserId</th></tr>";
        resolvedAllIdsAndUserIds.forEach((element) => {
          result += "<tr><td>" + element.id + "</td><td>" + element.userId + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };

      window.showUnresolvedAllIdsAndUserIds = function() {
        let result = "Lista de todos los pendientes sin resolver (IDs y userId):<br>";
        result += "<table>";
        result += "<tr><th>ID</th><th>UserId</th></tr>";
        unresolvedAllIdsAndUserIds.forEach((element) => {
          result += "<tr><td>" + element.id + "</td><td>" + element.userId + "</td></tr>";
        });
        result += "</table>";
        tableContainer.innerHTML = result;
      };
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}



main();
