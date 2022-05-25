import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/shared/core/app_images.dart';
import 'package:portfolio/src/shared/core/responsive_endpoints.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/logic.dart';
import 'package:responsive/responsive_row.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          ResponsiveRow(
            alignment: WrapAlignment.center,
            columnsCount: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ResponsiveEndpoints.isDesktop(size.width)
                  ? FlexWidget(
                      xs: 12,
                      sm: 12,
                      md: 12,
                      lg: 6,
                      xl: 6,
                      xxl: 6,
                      xxxl: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '<Pedro\nDev />',
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(
                                  fontSize:
                                      size.width <= Responsive.md ? 60 : 80,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              FlexWidget(
                xs: 12,
                sm: 12,
                md: 12,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: ResponsiveEndpoints.isMobile(size.width)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveEndpoints.isDesktop(size.width)
                        ? Wrap(
                            children: [
                              Image.asset(
                                AppImages.AVATAR,
                                width: 340.0,
                                height: 340.0,
                              ),
                            ],
                          )
                        : Image.asset(
                            AppImages.AVATAR,
                            width: 340.0,
                            height: 340.0,
                          ),
                  ],
                ),
              ),
              ResponsiveEndpoints.isMobile(size.width)
                  ? FlexWidget(
                      xs: 12,
                      sm: 12,
                      md: 12,
                      lg: 6,
                      xl: 6,
                      xxl: 6,
                      xxxl: 6,
                      child: Text(
                        '<PedroDev />',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: ResponsiveEndpoints.isMobile(size.width)
                                  ? 40
                                  : 100,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    )
                  : Container(),
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
          ResponsiveEndpoints.isMobile(size.width)
              ? const SizedBox(height: 64.0)
              : Container(),
        ],
      ),
    );
  }
}
