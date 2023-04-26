
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class StopRemoteCommand extends BaseRemoteCommand {
  StopRemoteCommand() : super(name: "Stop");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.stop();
  }
}