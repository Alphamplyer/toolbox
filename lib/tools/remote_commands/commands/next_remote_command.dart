
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class NextRemoteCommand extends BaseRemoteCommand {
  NextRemoteCommand() : super(name: "Next");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.next();
  }
}