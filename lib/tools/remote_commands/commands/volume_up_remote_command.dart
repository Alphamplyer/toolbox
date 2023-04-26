
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class VolumeUpRemoteCommand extends BaseRemoteCommand {
  VolumeUpRemoteCommand() : super(name: "Volume Up");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.volumeUp();
  }
}