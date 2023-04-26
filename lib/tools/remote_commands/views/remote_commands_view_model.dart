
import 'package:toolbox/tools/remote_commands/base/base_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/next_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/play_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/previous_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/stop_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/volume_down_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/volume_mute_remote_command.dart';
import 'package:toolbox/tools/remote_commands/commands/volume_up_remote_command.dart';

class RemoteCommandsViewModel {
  List<BaseRemoteCommand> get remoteCommands => _remoteCommands;
  final List<BaseRemoteCommand> _remoteCommands = [
    TogglePlayPauseRemoteCommand(),
    StopRemoteCommand(),
    PreviousRemoteCommand(),
    NextRemoteCommand(),
    VolumeDownRemoteCommand(),
    VolumeUpRemoteCommand(),
    VolumeMuteRemoteCommand(),
  ];
  
  void executeCommand(BaseRemoteCommand remoteCommand) async {
    await remoteCommand.execute();
  }
}