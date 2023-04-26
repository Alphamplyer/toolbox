
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class PreviousRemoteCommand extends BaseRemoteCommand {
  PreviousRemoteCommand() : super(name: "Previous");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.previous();
  }
}