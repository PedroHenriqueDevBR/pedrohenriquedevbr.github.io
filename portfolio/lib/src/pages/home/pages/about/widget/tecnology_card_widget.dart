import 'package:flutter/material.dart';

import 'package:portfolio/src/shared/models/tecnology_model.dart';

class TecnologyCardWidget extends StatelessWidget {
  final TecnologyModel tecnology;
  final bool selected;
  final Function onTap;

  const TecnologyCardWidget({
    Key? key,
    required this.tecnology,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        color: selected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        child: Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  tecnology.assetPath,
                  height: 50.0,
                ),
                Text(
                  tecnology.name,
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
