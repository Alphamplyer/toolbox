
import 'package:flutter/material.dart';
import 'package:toolbox/config/layout.config.dart';


class ToolboxGridView<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final Widget Function(BuildContext, int, T) itemBuilder;
  final bool childAreNotifiers;
  
  const ToolboxGridView({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.childAreNotifiers = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(LayoutConfig.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: LayoutConfig.defaultMargin * 3),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: LayoutConfig.defaultMargin,
                mainAxisSpacing: LayoutConfig.defaultMargin,
              ), 
              itemBuilder: (context, index) {
                if (childAreNotifiers) {
                  return AnimatedBuilder(
                    animation: items[index] as Listenable, 
                    builder: (context, child) => itemBuilder(context, index, items[index]),
                  );
                }
                
                return itemBuilder(context, index, items[index]);
              }
            )
          ],
        ),
      )
    );
  }
}