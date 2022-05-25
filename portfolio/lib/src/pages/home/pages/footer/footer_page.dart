import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/src/shared/core/app_images.dart';
import 'package:portfolio/src/shared/core/responsive_endpoints.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/logic.dart';
import 'package:responsive/responsive_row.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterPage extends StatefulWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.AVATAR,
                    width: 75.0,
                    height: 75.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    '<PedroDev />',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 40,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
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
                    iconSize: 30.0,
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
                    iconSize: 30.0,
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
                    iconSize: 30.0,
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
                    iconSize: 30.0,
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
                    iconSize: 30.0,
                  ),
                ],
              ),
              ResponsiveEndpoints.isMobile(size.width)
                  ? const SizedBox(height: 64.0)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
