
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class TogglePlayPauseRemoteCommand extends BaseRemoteCommand {
  TogglePlayPauseRemoteCommand() : super(name: "Toggle\nPlay / Pause");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.togglePlayPause();
  }
}