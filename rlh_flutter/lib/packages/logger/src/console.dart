import 'level.dart';
import 'publisher.dart';

class ConsolePublisher implements Publisher {
  @override
  void publish(DateTime time, Level level, String classString, String message) {
    print('$time  ${level.name}  $classString  $message ');
  }
}
