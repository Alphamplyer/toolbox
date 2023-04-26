
import 'package:flutter/material.dart';
import 'package:toolbox/shared/widgets/simple_tap_card_widget.dart';
import 'package:toolbox/shared/widgets/toolbox_grid_view_widget.dart';
import 'package:toolbox/shared/widgets/toolbox_scaffold_widget.dart';
import 'package:toolbox/tools/remote_commands/views/remote_commands_view.dart';
import 'package:toolbox/views/home/models/tool_entry_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<ToolEntry> toolEntries = [
    ToolEntry(
      name: "Remote Commands", 
      page: const RemoteCommandsView()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ToolboxScaffold(
      title: "Toolbox",
      body: ToolboxGridView<ToolEntry>(
        title: "Commands",
        items: toolEntries,
        childAreNotifiers: false,
        itemBuilder: (context, index, tool) {
          return SimpleTapCard(
            title: tool.name,
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => tool.page
              )
            ),
          );
        }
      ) 
    );
  }
}