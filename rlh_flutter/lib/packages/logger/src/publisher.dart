import 'level.dart';

abstract class Publisher {
  void publish(DateTime time, Level level, String classString, String message);
}
