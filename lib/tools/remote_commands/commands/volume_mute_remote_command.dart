
import '../base/base_remote_command.dart';
import '../services/remote_commands_service.dart';

class VolumeMuteRemoteCommand extends BaseRemoteCommand {
  VolumeMuteRemoteCommand() : super(name: "Volume Mute");

  @override
  Future<void> onExecute() async {
    await RemoteCommandsService.volumeMute();
  }
}