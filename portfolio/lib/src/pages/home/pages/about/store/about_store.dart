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
      description: '',
      assetPath: AppImages.PYTHON,
    ),
    TecnologyModel(
      name: 'Django',
      description: '',
      assetPath: AppImages.DJANGO,
    ),
    TecnologyModel(
      name: 'HTML5',
      description: '',
      assetPath: AppImages.HTML5,
    ),
    TecnologyModel(
      name: 'CSS3',
      description: '',
      assetPath: AppImages.CSS3,
    ),
    TecnologyModel(
      name: 'JavaScript',
      description: '',
      assetPath: AppImages.JS,
    ),
    TecnologyModel(
      name: 'Flutter',
      description: '',
      assetPath: AppImages.FLUTTER,
    ),
    TecnologyModel(
      name: 'Linux',
      description: '',
      assetPath: AppImages.LINUX,
    ),
    TecnologyModel(
      name: 'Docker',
      description: '',
      assetPath: AppImages.DOCKER,
    ),
  ];
}
