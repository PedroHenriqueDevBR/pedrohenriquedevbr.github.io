import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/shared/core/app_images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                IconButton(
                  onPressed: (() => launchUrlString(
                        'https://www.linkedin.com/in/pedro-henrique-br/',
                      )),
                  icon: Icon(
                    FontAwesomeIcons.linkedinIn,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  iconSize: 40.0,
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  onPressed: (() => launchUrlString(
                        'https://github.com/pedrohenriquedevbr',
                      )),
                  icon: Icon(
                    FontAwesomeIcons.github,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  iconSize: 40.0,
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  onPressed: (() => launchUrlString(
                        'https://www.youtube.com/channel/UCsfCR2wETP80000IuMTPYNA',
                      )),
                  icon: Icon(
                    FontAwesomeIcons.youtube,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  iconSize: 40.0,
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  onPressed: (() => launchUrlString(
                        'https://api.whatsapp.com/send?phone=5586988639775&text=Ol%C3%A1%20Pedro%2C%20meu%20nome%20%C3%A9%20_',
                      )),
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  iconSize: 40.0,
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  onPressed: (() => launchUrlString(
                        'https://www.instagram.com/pedro_lymma/',
                      )),
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  iconSize: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
