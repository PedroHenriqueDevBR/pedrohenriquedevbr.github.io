import 'package:flutter/material.dart';

class HomeComponents {
  Widget itemMenu({required String text, required Function action}) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        action();
      },
    );
  }

  Widget headDescription({required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pedro Henrique',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Student of Systems Analysis and Development - Instituto Federal do Piauí\n'
                  'Software developer, Dart and Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                Divider(),
                SizedBox(height: 16.0),
                Text(
                  'Mussum Ipsum, cacilds vidis litro abertis. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Per aumento de cachacis, eu reclamis. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Leite de capivaris, leite de mula manquis sem cabeça.In elementis mé pra quem é amistosis quis leo. Mé faiz elementum girarzis, nisi eros vermeio. Aenean aliquam molestie leo, vitae iaculis nisl. Manduma pindureta quium dia nois paga.Delegadis gente finis, bibendum egestas augue arcu ut est. Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl. Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.Diuretics paradis num copo é motivis de denguis. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Sapien in monti palavris qui num significa nadis i pareci latim.',
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
              image: NetworkImage('https://avatars.githubusercontent.com/u/36716898?v=4'),
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget articleSection({
    required BuildContext context,
    required String title,
    required String content,
    ImageProvider? leftImage,
    ImageProvider? rightImage,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 64),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leftImage != null ? imageContainerForSection(context: context, imageProvider: leftImage) : Container(),
              SizedBox(width: leftImage != null ? 16.0 : 0),
              Expanded(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.8,
                  ),
                  softWrap: true,
                ),
              ),
              SizedBox(width: leftImage != null ? 16.0 : 0),
              rightImage != null ? imageContainerForSection(context: context, imageProvider: rightImage) : Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageContainerForSection({
    required BuildContext context,
    required ImageProvider imageProvider,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 12.0),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(image: imageProvider),
      ),
    );
  }
}
