

import 'filter_map.dart';
import 'level.dart';
import 'base.dart';
import 'publisher.dart';

class Logger {
  /// Creates a Logger instance with defined name.
  /// When logging, Name will be added to the log output.
  Logger(this._name);

  /// Set default log level. This is valid in all loggers in the application.
  static set defaultLevel(value) => Base.instance.defaultLevel = value;

  /// Get default log level for the application
  static Level get defaultLevel => Base.instance.defaultLevel;

  /// Set publishers for this application
  static set publishers(value) => Base.instance.publishers = value;

  /// Get publishers for this application.
  static List<Publisher> get publishers => Base.instance.publishers;

  FilterMap get filters => Base.instance.filters;
  set filters(value) => Base.instance.filters = value;

  /// Log message at level [Level.VERBOSE].
  void verbose(message) => Base.instance.log(_name, Level.VERBOSE, message);

  /// Log message at level [Level.DEBUG].
  void debug(message) => Base.instance.log(_name, Level.DEBUG, message);

  /// Log message at level [Level.INFO].
  void info(message) => Base.instance.log(_name, Level.INFO, message);

  /// Log message at level [Level.WARNING].
  void warning(message) => Base.instance.log(_name, Level.WARNING, message);

  /// Log message at level [Level.ERROR].
  void error(message) => Base.instance.log(_name, Level.ERROR, message);

  @deprecated
  static void addPublisher(List<Publisher> publisher) {
    Base.instance.setOutput(publisher);
  }

  @deprecated
  void init(List<Publisher> printerTypes) {
    Base.instance.setTypes(printerTypes);
  }

  final String _name;
}
