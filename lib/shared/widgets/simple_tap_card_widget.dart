
import 'package:flutter/material.dart';
import 'package:toolbox/config/layout.config.dart';

class SimpleTapCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SimpleTapCard({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: onTap == null ? Theme.of(context).cardColor.withOpacity(0.3) : Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(LayoutConfig.defaultPadding),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color?.withOpacity(onTap == null ? 0.6 : 1.0),
              ),
            ),
          ),
        ),
      )
    );
  }
}