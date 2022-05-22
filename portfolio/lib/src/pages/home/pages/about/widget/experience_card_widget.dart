import 'package:flutter/material.dart';

import 'package:portfolio/src/shared/models/experience_model.dart';

class ExperienceCardWidget extends StatelessWidget {
  final ExperienceModel experience;
  final bool selected;
  final Function onTap;

  const ExperienceCardWidget({
    Key? key,
    required this.experience,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          // selectedTileColor: Theme.of(context).colorScheme.primary,
          onTap: () {
            onTap();
          },
          selected: selected,
          leading: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Icon(
              Icons.home_work_outlined,
              size: 30.0,
              color: selected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          title: Text(
            experience.companyName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                'De ${experience.start} até ${experience.end ?? "o momento"}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              selected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        experience.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
