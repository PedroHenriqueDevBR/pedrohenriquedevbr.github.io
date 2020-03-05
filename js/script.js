var localendpoint = "../response.json";
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
var data = {
  // dados do peril
  response: {}
};
var repositorys = {
  // todos os repositórios
  response: {}
};
var readme = [];
var cards;
var maintenance = true;

function startLoad() {
  getData();
  getRespositoryes();
  document.getElementById("presentation").style += `${
    bgdGradients[getBgdPosition(0, 6)]
  }`;
  if (maintenance) {
    setTimeout(() => {
      console.log("Chegou aqui");
      $(".alert-modal").modal("show");
    }, 1000);
  }
}

function getBgdPosition(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

function getData() {
  axios.get(endpoints["perfil"]).then(function(response) {
    saveData(response.data);
  });
}

function getRespositoryes() {
  axios.get(endpoints["repos"]).then(function(response) {
    saveRespositoryes(response.data);
  });
}

function saveData(json) {
  data["response"] = json;
}

function saveRespositoryes(json) {
  repositorys["response"] = json;
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

    // get readme
  }, 1000);
}

function showProjects() {
  var projects = document.getElementById("projects-cards");
  var contProjects = 0;
  var showProjects = "";
  repositorys["response"].sort(function(a, b) {
    if (a.updated_at < b.updated_at) {
      return 1;
    }
    if (a.updated_at > b.updated_at) {
      return -1;
    }
    return 0;
  });

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
    if (contProjects === 8) {
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

function showModal(position) {
  var endpoint = endpoints["raw"].replace(
    "##",
    repositorys["response"][position].name
  );

  axios
    .get(endpoint)
    .then(function(response) {
      var content = response.data;
      var converter = new showdown.Converter();
      var html = converter.makeHtml(content);

      document.getElementById("modal-content").innerHTML = html;
      $(".descrition-modal").modal("show");
    })
    .catch(() => {
      document.getElementById(
        "modal-content"
      ).innerHTML = `<p>Documentação em desenvolvimento</p>`;
      $(".descrition-modal").modal("show");
    });
}

addEventListener("load", startLoad);
addEventListener("load", showData);
addEventListener("load", showMenu);
