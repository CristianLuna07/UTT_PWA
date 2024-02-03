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
          unresolvedAllIdsAndTitles.push({ id: todo.id, title: todo.title });
          unresolvedAllIdsAndUserIds.push({ id: todo.id, userId: todo.userId });
        } else {
          resolvedAllIdsAndTitles.push({ id: todo.id, title: todo.title });
          resolvedAllIdsAndUserIds.push({ id: todo.id, userId: todo.userId });
        }
      }
      console.clear();
      console.log("1.- Lista de todos los pendientes(solo IDs)\n2.- Lista de todos los pendientes(IDs y Titles)\n3.- Lista de todos los pendientes sin resolver (ID y title)\n4.- Lista de todos los pendientes resueltos (ID y title)\n5.- Lista de todos los pendientes (IDs y userId)\n6.- Lista de todos los pendientes resueltos (IDs y userId)\n7.- Lista de todos los pendientes sin resolver (IDs y userId)\n8.- Salir");
      readline.question("Seleccione una opción:", (option) => {
        switch (option) {
          case "1":
            console.log("Lista de todos los pendientes (solo IDs):");
            allIds.forEach((element) => {
              console.log("Id: " + element);
            });

            askToContinue();
            break;
          case "2":
            console.log("Lista de todos los pendientes (IDs y Titles):");
            allIdsAndTitles.forEach((element) => {
                console.log("Id: " + element.id + " Title: " + element.title);
            });
            askToContinue();
            break;
          case "3":
            console.log("Lista de todos los pendientes sin resolver (ID y title):");
            unresolvedAllIdsAndTitles.forEach((element) => {
                console.log("Id: " + element.id + " Title: " + element.title);
            });
            askToContinue();
            break;
          case "4":
            console.log("Lista de todos los pendientes resueltos (ID y title):");
            resolvedAllIdsAndTitles.forEach((element) => {
                console.log("Id: " + element.id + " Title: " + element.title);
            });
            askToContinue();
            break;
          case "5":
            console.log("Lista de todos los pendientes (IDs y userId):");
            allIdsAndUserIds.forEach((element) => {
              console.log("Id: " + element.id + " UserId: " + element.userId);
            });
            askToContinue();
            break;
          case "6":
            console.log("Lista de todos los pendientes resueltos (IDs y userId):");
            resolvedAllIdsAndUserIds.forEach((element) => {
                console.log("Id: " + element.id + " UserId: " + element.userId);
            });
            askToContinue();
            break;
          case "7":
            console.log("Lista de todos los pendientes sin resolver (IDs y userId):");
            unresolvedAllIdsAndUserIds.forEach((element) => {
                console.log("Id: " + element.id + " UserId: " + element.userId);
            });
            askToContinue();
            break;
          case "8":
            exit = true;
            readline.close();
            break;
          default:
            console.log("Opción no válida");
            askToContinue();
            break;
        }
      });
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

//Función para obtener datos de entrada para el menu de opciones
const readline = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

//Función para preguntar si se desea continuar o salir
function askToContinue() {
  readline.question("Presione cualquier tecla para continuar con el menú o Presione la tecla [S] para salir:", (answer) => {
    if (answer.toLowerCase() == "s") {
      exit = true;
      readline.close();
    } else {
      main();
    }
  });
}

main();
