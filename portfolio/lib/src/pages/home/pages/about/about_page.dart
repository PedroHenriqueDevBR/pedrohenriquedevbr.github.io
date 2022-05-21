import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/core/app_images.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: 160.0, vertical: 40.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        avatarWidget(),
                        const SizedBox(height: 32.0),
                        experienceWidget(context),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        presentationWidget(context),
                        const SizedBox(height: 32.0),
                        tecnologyWidget(context),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget avatarWidget() => Image.asset(
        AppImages.AVATAR,
        width: 350.0,
        height: 350.0,
      );

  Widget tecnologyCardWidget({
    required BuildContext context,
    required String name,
    required assetPath,
  }) =>
      Container(
        width: 95,
        height: 95,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 3.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                assetPath,
                height: 40.0,
              ),
              Text(
                'Python',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      );

  Widget presentationWidget(BuildContext context) => SizedBox(
        width: 550.0,
        child: Column(
          children: [
            Text(
              'Pedro Henrique',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
            ),
            const SizedBox(height: 32.0),
            Text(
              '“Resolver problemas e automatizar processos por meio da tecnologia são minhas paixões, prazer sou Pedro Henrique, um bom programador”',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Sou estudante de desenvolvimento de softwares e utilizo os conhecimentos adquiridos no meu dia a dia, gosto muito de estudar e repassar os conhecimentos adquiridos para outras pessoas, seja por meio de projetos ou explicando o assunto de uma forma mais simples.',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Atualmente estou gravando vídeos para o YouTube apresentando projetos ou explicando algum assunto em que eu esteja estudando, gosto dessa ideia pela quantidade de vantagens que ela trás como por exemplo, a fixação de conteúdos complexos pois para explicar um assunto eu preciso estudar mais sobre ele.',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      );

  Widget experienceWidget(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '# Experiência',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            title: Text(
              'Defensoria Pública do Estado do Piauí',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            subtitle: Text('De Dez/2021 até o momento',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ),
          const SizedBox(height: 4.0),
          ListTile(
            title: Text('Grupo Vanguarda',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
            subtitle: Text('De Mar/2019 até Abril/2021',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ),
          const SizedBox(height: 4.0),
          ListTile(
            title: Text('Med Imagem',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
            subtitle: Text('De Mar/2015 até Dez/2016',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ),
        ],
      );

  Widget tecnologyWidget(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '# Tecnologias',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              tecnologyCardWidget(
                context: context,
                name: 'Python',
                assetPath: AppImages.PYTHON,
              ),
              tecnologyCardWidget(
                context: context,
                name: 'Django',
                assetPath: AppImages.DJANGO,
              ),
              tecnologyCardWidget(
                context: context,
                name: 'HTML5',
                assetPath: AppImages.HTML5,
              ),
              tecnologyCardWidget(
                context: context,
                name: 'CSS3',
                assetPath: AppImages.CSS3,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              tecnologyCardWidget(
                context: context,
                name: 'JavaScript',
                assetPath: AppImages.JS,
              ),
              tecnologyCardWidget(
                context: context,
                name: 'Flutter',
                assetPath: AppImages.FLUTTER,
              ),
              tecnologyCardWidget(
                context: context,
                name: 'Linux',
                assetPath: AppImages.LINUX,
              ),
              tecnologyCardWidget(
                context: context,
                name: 'Docker',
                assetPath: AppImages.DOCKER,
              ),
            ],
          ),
        ],
      );
}
