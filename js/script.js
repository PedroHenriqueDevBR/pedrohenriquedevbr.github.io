// Documents element
var nameElement = document.querySelector('#api-name');
var photoElement = document.querySelector("#api-photo");
var descriptionElement = document.querySelector("#api-description");
var presentationElement = document.querySelector('#presentation');
var projectsElement = document.getElementById("projects-cards");

// Data
var data = [];
var repositorys = [];
var maintenance = false;

var endpoints = {
  perfil: "https://api.github.com/users/pedrohenriquedevbr",
  repos: "https://api.github.com/users/pedrohenriquedevbr/repos",
  raw:
    "https://raw.githubusercontent.com/PedroHenriqueDevBR/##/master/README.md"
};
var languageColor = {
  Python: "#8BC34A",
  Java: "#D32F2F",
  TypeScript: "#673AB7",
  Dart: "#2196F3",
  HTML: "#FF5722",
  JavaScript: "#FFCA28"
};
var languageImg = {
  Python: "python.jpg",
  Java: "java.jpg",
  TypeScript: "typescript.jpg",
  Dart: "dart.png",
  HTML: "html.png",
  JavaScript: "js.png"
};
var bgdGradients = [
  `background: rgb(2,0,36); background: linear-gradient(77deg, rgba(2,0,36,1) 0%, rgba(0,212,255,1) 100%);`,
  `background: #56CCF2; background: -webkit-linear-gradient(to right, #2F80ED, #56CCF2); background: linear-gradient(to right, #2F80ED, #56CCF2);`,
  `background: #F2994A; background: -webkit-linear-gradient(to left, #F2C94C, #F2994A); background: linear-gradient(to left, #F2C94C, #F2994A);`,
  `background: #E44D26; background: -webkit-linear-gradient(to top, #F16529, #E44D26); background: linear-gradient(to top, #F16529, #E44D26);`,
  `background: #D66D75; background: -webkit-linear-gradient(to top, #E29587, #D66D75); background: linear-gradient(to top, #E29587, #D66D75);`,
  `background: #6a3093; background: -webkit-linear-gradient(to top, #a044ff, #6a3093); background: linear-gradient(to top, #a044ff, #6a3093);`
];

function hasMaintenance() {
  if (maintenance) {
    setTimeout(() => {
      console.log("Chegou aqui");
      $(".alert-modal").modal("show");
    }, 1000);
  }
}

function startLoad() {
  getData();
  getRespositoryes();
  hasMaintenance();
}

function getData() {
  axios.get(endpoints["perfil"])
    .then(function (response) {
      data = response.data;
      showData();
    })
    .catch(function (error) {
      console.warn(error);
    });
}

function getRespositoryes() {
  axios.get(endpoints["repos"])
    .then(function (response) {
      repositorys = response.data;
      repositorys.sort(function (a, b) {
        if (a.updated_at < b.updated_at) {
          return 1;
        }
        if (a.updated_at > b.updated_at) {
          return -1;
        }
        return 0;
      });
      showProjects();
    })
    .catch(function (error) {
      console.warn(error);
    });
}

function getBgdPosition(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

function showData() {
  // set data
  nameElement.innerHTML = data.name.toUpperCase();
  descriptionElement.innerHTML = data.bio;
  photoElement.src = data.avatar_url;
  presentationElement.style += `${bgdGradients[getBgdPosition(0, 6)]}`;
}

function showProjects() {
  var contProjects = 0;
  var cardList = [];
  var deckList = [];

  for (var repository of repositorys) {
    cardList.push(getCardElement(repository, contProjects));
    contProjects++;
  }

  var cardListAux = [];
  var listAux = [];

  for (var i = 0; i < 9; i++) {
    listAux.push(cardList[i]);

    if ((i + 1) % 3 === 0) {
      cardListAux.push(listAux);
      listAux = [];
    }
  }

  for (var i = 0; i < cardListAux.length; i++) {
    var deckElement = document.createElement('div');
    deckElement.setAttribute('class', 'card-deck mt-3');

    for (var j = 0; j < cardListAux[i].length; j++) {
      deckElement.appendChild(cardListAux[i][j]);
    }

    projectsElement.appendChild(deckElement);
  }

}

function getCardElement(repository, position) {

  var cardElement = document.createElement('div');
  cardElement.setAttribute('class', 'card card-show');
  cardElement.setAttribute('style', 'width: 18rem;');
  cardElement.setAttribute('onclick', 'showModal(' + position + ')');

  var imageElement = document.createElement('img');
  imageElement.setAttribute('class', 'card-img-top');
  imageElement.setAttribute('src', `img/${languageImg[repository.language]}`);
  imageElement.setAttribute('height', '200px');

  var cardBodyElement = document.createElement('div');
  cardBodyElement.setAttribute('class', 'card-body');

  var badgeElement = document.createElement('p');
  var spanElement = document.createElement('span');
  spanElement.setAttribute('class', 'badge badge-primary px-3 py-2');
  spanElement.style.background = `${languageColor[repository.language]}`;
  var spanText = document.createTextNode(repository.language);

  var repositoryNameElement = document.createElement('h3');
  var repositoryNameText = document.createTextNode(repository.name);

  var descriptionElement = document.createElement('p');
  var descriptionText = document.createTextNode(repository.description);

  // Assembly of parts  
  spanElement.appendChild(spanText);
  badgeElement.appendChild(spanElement);

  repositoryNameElement.appendChild(repositoryNameText);
  descriptionElement.appendChild(descriptionText);

  cardBodyElement.appendChild(badgeElement);
  cardBodyElement.appendChild(repositoryNameElement);
  cardBodyElement.appendChild(descriptionElement);

  cardElement.appendChild(imageElement);
  cardElement.appendChild(cardBodyElement);

  return cardElement;
}

function showMenu() {
  var menu = document.getElementById("main-menu");

  if (scrollY === 0) {
    menu.classList.remove("show-menu");
  } else {
    menu.classList.add("show-menu");
  }
  onscroll = () => {
    if (scrollY === 0) {
      menu.classList.remove("show-menu");
    } else {
      menu.classList.add("show-menu");
    }
  };
}

function showModal(position) {
  var url = endpoints["raw"];
  var endpoint = url.replace('##', repositorys[position].name)

  axios
    .get(endpoint)
    .then(function (response) {
      var content = response.data;
      var converter = new showdown.Converter();
      var html = converter.makeHtml(content);

      document.getElementById("modal-content").innerHTML = html;
      $(".descrition-modal").modal("show");
    })
    .catch((error) => {
      document.getElementById(
        "modal-content"
      ).innerHTML = `<p>Documentação em desenvolvimento</p>`;

      $(".descrition-modal").modal("show");
    });
}

addEventListener("load", startLoad);
addEventListener("load", showMenu);
