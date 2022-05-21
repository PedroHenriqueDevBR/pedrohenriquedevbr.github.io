import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/shared/core/app_images.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Eu\nSou\nPedro',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 112,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                Image.asset(
                  AppImages.AVATAR,
                  width: 350.0,
                  height: 350.0,
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.linkedinIn,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 40.0,
                ),
                const SizedBox(width: 32.0),
                Icon(
                  FontAwesomeIcons.github,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 40.0,
                ),
                const SizedBox(width: 32.0),
                Icon(
                  FontAwesomeIcons.youtube,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 40.0,
                ),
                const SizedBox(width: 32.0),
                Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 40.0,
                ),
                const SizedBox(width: 32.0),
                Icon(
                  FontAwesomeIcons.instagram,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
