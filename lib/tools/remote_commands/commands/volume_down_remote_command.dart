
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class VolumeDownRemoteCommand extends BaseRemoteCommand {
  VolumeDownRemoteCommand() : super(name: "Volume Down");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.volumeDown();
  }
}