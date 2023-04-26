
import 'package:flutter/material.dart';
import 'package:toolbox/shared/widgets/simple_tap_card_widget.dart';
import 'package:toolbox/shared/widgets/toolbox_grid_view_widget.dart';
import 'package:toolbox/shared/widgets/toolbox_scaffold_widget.dart';
import 'package:toolbox/tools/remote_commands/base/base_remote_command.dart';
import 'package:toolbox/tools/remote_commands/views/remote_commands_view_model.dart';

class RemoteCommandsView extends StatefulWidget {
  const RemoteCommandsView({super.key});

  @override
  State<RemoteCommandsView> createState() => _RemoteCommandsViewState();
}

class _RemoteCommandsViewState extends State<RemoteCommandsView> {
  late RemoteCommandsViewModel viewModel;

  @override
  void initState() {
    viewModel = RemoteCommandsViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToolboxScaffold(
      title: "Remote Commands", 
      body: ToolboxGridView<BaseRemoteCommand>(
        title: "Commands",
        items: viewModel.remoteCommands,
        childAreNotifiers: true,
        itemBuilder: (context, index, command) {
          return SimpleTapCard(
            title: command.name,
            onTap: command.isRunning ? null : () => viewModel.executeCommand(command),
          );
        }
      )
    );
  }
}