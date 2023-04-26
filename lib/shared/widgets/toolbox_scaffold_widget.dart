
import 'package:flutter/material.dart';
import 'package:toolbox/config/layout.config.dart';

class ToolboxScaffold extends StatelessWidget {
  final Widget body;
  final Drawer? drawer;
  final String title;

  const ToolboxScaffold({
    super.key,
    required this.title,
    this.drawer,
    required this.body,
  });

  List<Widget> _buildPopButton(BuildContext context) {
    return [
      Container(
        height: LayoutConfig.appBarHeight,
        width: LayoutConfig.appBarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(LayoutConfig.defaultBorderRadius)),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      const SizedBox(width: 16),
    ];
  }

  Widget _buildTitle(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: LayoutConfig.defaultPadding),
        height: LayoutConfig.appBarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(LayoutConfig.defaultBorderRadius)),
        ),
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer, 
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      const SizedBox(width: 16),
      Container(
        height: LayoutConfig.appBarHeight,
        width: LayoutConfig.appBarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(LayoutConfig.defaultBorderRadius)),
        ),
        child: IconButton(
          icon: const Icon(Icons.menu_rounded),
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          onPressed: () => drawer != null ? Scaffold.of(context).openDrawer() : null,
        ),
      ),
    ];
  }

  Widget _buildAppBar(BuildContext context) {
    List<Widget> rowChildren = [];

    if (Navigator.canPop(context)) {
      rowChildren.addAll(_buildPopButton(context));
    }

    rowChildren.add(_buildTitle(context));

    if (drawer != null) {
      rowChildren.addAll(_buildActions(context));
    }

    return Padding(
      padding: const EdgeInsets.all(LayoutConfig.defaultPadding),
      child: Row(
        children: rowChildren,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: body,
            ),
          ],
        ) ,
      )
    );
  }
}