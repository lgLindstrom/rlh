import 'filter_map.dart';
import 'level.dart';
import 'publisher.dart';

class Base {
  Base._();

  static Base get instance => _instance ??= Base._();

  FilterMap get filters => _filters;
  set filters(value) => _filters = value;

  set defaultLevel(value) => _defaultLevel = value;
  Level get defaultLevel => _defaultLevel;

  set publishers(value) => _publishers = value;
  List<Publisher> get publishers => _publishers;

  @deprecated
  void setTypes(List<Publisher> printerTypes) {
    _publishers = printerTypes;
  }

  @deprecated
  void setOutput(List<Publisher> printerTypes) {
    _publishers = printerTypes;
  }

  void log(String classString, Level level, String message) {
    if (!_filters.exists(classString)) {
      // use default level
      _log(classString, _defaultLevel, level, message);
    } else {
      // use level in map
      _log(classString, _filters.get(classString), level, message);
    }
  }

  FilterMap _filters = FilterMap();
  List<Publisher> _publishers = [];
  Level _defaultLevel = Level.WARNING;

  static Base? _instance;

  void _log(String classString, Level mapLevel, Level messageLevel, String message) {
    if (messageLevel.index >= mapLevel.index) {
      _publish(classString, messageLevel, message);
    }
  }

  void _publish(String classString, Level level, String message) {
    var time = DateTime.now();

    _publishers.forEach((publisher) {
      publisher.publish(time, level, classString, message);
    });
  }
}
