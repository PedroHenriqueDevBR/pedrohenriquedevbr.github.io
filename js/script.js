var localendpoint = "../response.json";
var endpoints = {
  perfil: "https://api.github.com/users/pedrohenriquedevbr",
  repos: "https://api.github.com/users/pedrohenriquedevbr/repos",
  readme: "https://api.github.com/repos/PedroHenriqueDevBR/##/readme",
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
var data = {
  response: {}
};
var repositorys = {
  response: {}
};

var cards;
var contentModal = "";

function startLoad() {
  getData();
  getRespositoryes();
  document.getElementById("presentation").style += `${
    bgdGradients[getBgdPosition(0, 6)]
  }`;
}

function getBgdPosition(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

function getData() {
  var xhttp = new XMLHttpRequest();
  xhttp.open("GET", endpoints["perfil"], true);
  xhttp.onreadystatechange = () => {
    if (xhttp.status == 200) {
      saveData(xhttp.responseText);
    }
  };
  xhttp.send();
}

function getRespositoryes() {
  var xhttp = new XMLHttpRequest();
  xhttp.open("GET", localendpoint, true);
  xhttp.onreadystatechange = () => {
    if (xhttp.status == 200) {
      saveRespositoryes(xhttp.responseText);
    }
  };
  xhttp.send();
}

function saveData(json) {
  data["response"] = JSON.parse(json);
}

function saveRespositoryes(json) {
  repositorys["response"] = JSON.parse(json);
}

function showData() {
  setTimeout(() => {
    var names = document.getElementsByClassName("api-name");
    var photos = document.getElementsByClassName("api-photo");
    var descriptions = document.getElementsByClassName("api-description");

    // set names
    for (var name of names) {
      name.innerHTML = data["response"].name.toUpperCase();
    }

    // set descriptions
    for (var description of descriptions) {
      description.innerHTML = data["response"].bio;
    }

    // set photos
    for (photo of photos) {
      photo.src = data["response"].avatar_url;
    }

    // List last projects
    showProjects();
  }, 100);
}

function showProjects() {
  var projects = document.getElementById("projects-cards");
  var contProjects = 0;
  var showProjects = "";

  for (var repository of repositorys["response"]) {
    if (contProjects === 0) {
      showProjects += `
                    <!-- Card deck -->
                    <div class="card-deck mt-3">
                    `;
    }
    if (contProjects % 3 === 0) {
      showProjects += `
                    </div>
                    <!-- Card deck -->
                    <div class="card-deck mt-3">
                        ${getCardElement(repository, contProjects)}
                `;
    } else {
      showProjects += `${getCardElement(repository, contProjects)}`;
    }
    if (contProjects === 5) {
      break;
    } else {
      contProjects++;
    }
  }
  showProjects += "</div>";
  projects.innerHTML = showProjects;
}

function getCardElement(repository, position) {
  return `
        <div class="card card-show" style="width: 18rem;" onClick="showModal(${position})">
            <img src="img/${
              languageImg[repository.language]
            }" height="200px" class="card-img-top">
            <div class="card-body">
                <p>
                    <span class="badge badge-primary px-3 py-2" style="background: ${
                      languageColor[repository.language]
                    };">${repository.language}</span>
                </p>
                <h3>
                    ${repository.name}
                </h3>
                <p class="card-text">
                    ${repository.description}
                </p>
            </div>
        </div>
    `;
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

function getReadme(uri) {
  const xhttp = new XMLHttpRequest();
  xhttp.open("GET", uri, true);
  xhttp.onreadystatechange = () => {
    if (xhttp.status == 200) {
      setTimeout(() => {
        contentModal = xhttp.responseText;
      }, 200);
    }
  };
  xhttp.send();
}

function showModal(position) {
  var endpoint = endpoints["raw"].replace(
    "##",
    repositorys["response"][position].name
  );
  getReadme(endpoint);

  setTimeout(() => {
    document.getElementById("modal-content").innerHTML = contentModal;
    $(".descrition-modal").modal("show");
  }, 200);
}

addEventListener("load", startLoad);
addEventListener("load", showData);
addEventListener("load", showMenu);
