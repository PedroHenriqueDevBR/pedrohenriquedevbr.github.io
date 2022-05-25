import 'package:mobx/mobx.dart';
import 'package:portfolio/src/shared/core/app_images.dart';
import 'package:portfolio/src/shared/models/experience_model.dart';
import 'package:portfolio/src/shared/models/tecnology_model.dart';

part 'about_store.g.dart';

class AboutStore extends _AboutStore with _$AboutStore {}

abstract class _AboutStore with Store {
  @observable
  int experienceItemSelected = -1;
  @observable
  int tecnologyItemSelected = -1;

  @action
  void setExperienceItemSelected(int value) {
    if (value == experienceItemSelected) {
      experienceItemSelected = -1;
      return;
    }
    experienceItemSelected = value;
  }

  @action
  void setTecnologyItemSelected(int value) {
    if (value == tecnologyItemSelected) {
      tecnologyItemSelected = -1;
      return;
    }
    tecnologyItemSelected = value;
  }

  final experienceList = [
    ExperienceModel(
      companyName: 'Defensoria Pública do Estado do Piauí',
      start: 'Dez/2021',
      description:
          '''Na Defensoria Pública do Estado do Piauí eu trabalho no setor desenvolvimento realizando principalmente as seguintes rotinas:
 - Criação e manutenção de softwares;
 - Realização de testes unitários e de integração;
 - Configuração e gerenciamento das configurações dos servidores das aplicações.''',
    ),
    ExperienceModel(
      companyName: 'Grupo Vanguarda',
      start: 'Mar/2019',
      end: 'Abril/2021',
      description:
          '''No Grupo Vanguarda atuei como estagiário de Service Desk, abaixo a apresentação das atividades do meu dia a dia: 
 - Recebimento de ordens de serviços por meio de um sistema próprio para isso, por meio de ligação telefônica e e-mail;
 - Análise e solução das ordens de serviços;
 - Conexão remota por meio do VNC e TeamViwer;
 - Configuração remota de estações trabalho e PDVs.''',
    ),
    ExperienceModel(
      companyName: 'Med Imagem',
      start: 'Mar/2015',
      end: 'Dez/2016',
      description:
          '''No Grupo Medi Imagem atuei como estagiário nível médio no setor de autorização, Abaixo a apresentação das principais atividades:
 - Recolhimento e organização de prontuários médicos;
 - Recebimento das solicitações de procedimentos cirúrgicos ou medicamentos por parte dos médicos;
 - Comunicação com os convênios médicos vinculados para informar sobre as solicitações médicas;
 - Feedback constante com o grupo de enfermagem, tendo como principal informação a autorização de procedimentos ou uso de medicamentos.''',
    )
  ];

  final tecnologyList = [
    TecnologyModel(
      name: 'Python',
      description:
          'Python é a minha principal linguagem de programação no momento, essa é a linguagem que eu utilizo no meu dia a dia.',
      assetPath: AppImages.PYTHON,
    ),
    TecnologyModel(
      name: 'Django',
      description:
          'O framework Django eu tenho uma vasta experiência de trabalho, esse framework funciona tendo o Python como base, tenho vários projetos finalizados utilizando essa tecnologia e utilizo ela no meu dia a dia.',
      assetPath: AppImages.DJANGO,
    ),
    TecnologyModel(
      name: 'HTML5',
      description:
          'HTML5, linguagem de marcação utilizada para a criação da estrutura das páginas web, HTML foi a primeira tecnologia de desenvolvimento que eu tive contato e utilizo até hoje em meus projetos e projetos de clientes.',
      assetPath: AppImages.HTML5,
    ),
    TecnologyModel(
      name: 'CSS3',
      description:
          'Utilizo o CSS no meu dia a dia para estilizar os projetos em que eu trabalho, por mais que eu faça a utilização de frameworks CSS (bootstrap por exemplo), eu entendo como ele funciona por debaixo dos panos.',
      assetPath: AppImages.CSS3,
    ),
    TecnologyModel(
      name: 'JavaScript',
      description:
          'JavaScript foi a minha primeira linguagem de programação, junto ao HTML e CSS eu pude me descobrir no mundo da programação, criando projeto com uma boa forma de um usuário interagir com as páginas criadas.',
      assetPath: AppImages.JS,
    ),
    TecnologyModel(
      name: 'Flutter',
      description:
          'Flutter foi o framework utilizado para a criação desta página, eu utilizo muito o Flutter no meu dia a dia para a criação de aplicações para dispositivos mobile e agora também para a criação de aplicações web.',
      assetPath: AppImages.FLUTTER,
    ),
    TecnologyModel(
      name: 'Linux',
      description:
          'Linux é o sistema operacional que eu utilizo para trabalhar mas não somente para isso, utilizo o Linux também para fazer o deploy de projetos em algum Cloud.',
      assetPath: AppImages.LINUX,
    ),
    TecnologyModel(
      name: 'Docker',
      description:
          'Docker eu comecei a utilizar faz alguns meses e não penso em deixar de utilizar, facilita a criação de projeto e a configuração do deploy das mesmas.',
      assetPath: AppImages.DOCKER,
    ),
  ];
}
