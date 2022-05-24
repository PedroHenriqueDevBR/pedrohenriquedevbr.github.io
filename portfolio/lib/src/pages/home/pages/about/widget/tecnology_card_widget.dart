import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/core/responsive_endpoints.dart';

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
    Size size = MediaQuery.of(context).size;
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
                Expanded(
                  child: Padding(
                    padding: ResponsiveEndpoints.isMobile(size.width)
                        ? const EdgeInsets.all(16.0)
                        : const EdgeInsets.all(8.0),
                    child: Image.asset(
                      tecnology.assetPath,
                    ),
                  ),
                ),
                Text(
                  tecnology.name,
                  style: Theme.of(context).textTheme.button?.copyWith(
                      overflow: TextOverflow.ellipsis,
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
