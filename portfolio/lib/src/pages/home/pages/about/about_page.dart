import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/src/pages/home/pages/about/widget/experience_card_widget.dart';
import 'package:portfolio/src/pages/home/pages/about/widget/tecnology_card_widget.dart';
import 'package:portfolio/src/shared/core/app_images.dart';
import 'package:portfolio/src/shared/core/responsive_endpoints.dart';
import 'package:portfolio/src/shared/models/experience_model.dart';
import 'package:responsive/responsive.dart';
import './store/about_store.dart';

class AboutPage extends StatelessWidget {
  final controller = AboutStore();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResponsiveRow(
            children: [
              FlexWidget(
                xs: 12,
                sm: 12,
                md: 12,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                child: Padding(
                  padding: ResponsiveEndpoints.isDesktop(size.width)
                      ? const EdgeInsets.only(left: 128.0)
                      : const EdgeInsets.all(0.0),
                  child: avatarWidget(),
                ),
              ),
              FlexWidget(
                xs: 12,
                sm: 12,
                md: 12,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                child: Padding(
                  padding: ResponsiveEndpoints.isDesktop(size.width)
                      ? const EdgeInsets.only(right: 128.0)
                      : const EdgeInsets.all(0.0),
                  child: presentationWidget(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32.0),
          ResponsiveRow(
            children: [
              FlexWidget(
                xs: 12,
                sm: 12,
                md: 12,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                child: Padding(
                  padding: ResponsiveEndpoints.isDesktop(size.width)
                      ? const EdgeInsets.only(left: 128.0)
                      : const EdgeInsets.all(0.0),
                  child: experienceWidget(context, size),
                ),
              ),
              FlexWidget(
                xs: 12,
                sm: 12,
                md: 12,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                child: Padding(
                  padding: ResponsiveEndpoints.isDesktop(size.width)
                      ? const EdgeInsets.only(right: 128.0)
                      : const EdgeInsets.all(0.0),
                  child: tecnologyWidget(context, size),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget avatarWidget() => Image.asset(
        AppImages.ROCKET,
        width: 350.0,
        height: 350.0,
      );

  Widget presentationWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 64.0,
          left: 32,
          bottom: 32.0,
          right: 32.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget experienceWidget(BuildContext context, Size size) => Padding(
        padding: ResponsiveEndpoints.isDesktop(size.width)
            ? const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              )
            : const EdgeInsets.only(
                top: 32.0,
                left: 32.0,
                right: 32.0,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Experiências',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.experienceList.length,
              itemBuilder: (context, index) {
                ExperienceModel experience = controller.experienceList[index];
                return Observer(builder: (context) {
                  return ExperienceCardWidget(
                    experience: experience,
                    selected: controller.experienceItemSelected == index,
                    onTap: () => controller.setExperienceItemSelected(index),
                  );
                });
              },
            ),
          ],
        ),
      );

  Widget tecnologyWidget(BuildContext context, Size size) => Padding(
        padding: ResponsiveEndpoints.isDesktop(size.width)
            ? const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              )
            : const EdgeInsets.only(
                top: 32.0,
                left: 32.0,
                right: 32.0,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '# Tecnologias',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 32.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveEndpoints.isMobile(size.width) ||
                        Responsive.gridSize(size.width) == Responsive.lg
                    ? 2
                    : 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: controller.tecnologyList.length,
              itemBuilder: (context, index) {
                return Observer(builder: (context) {
                  return TecnologyCardWidget(
                    tecnology: controller.tecnologyList[index],
                    selected: controller.tecnologyItemSelected == index,
                    onTap: () => controller.setTecnologyItemSelected(index),
                  );
                });
              },
            ),
            Observer(builder: (context) {
              return tecnologyDescriptionWidget(context);
            }),
          ],
        ),
      );

  Widget tecnologyDescriptionWidget(BuildContext context) =>
      controller.tecnologyItemSelected == -1
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 16.0),
                Text(
                  controller
                      .tecnologyList[controller.tecnologyItemSelected].name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  controller.tecnologyList[controller.tecnologyItemSelected]
                      .description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            );
}
