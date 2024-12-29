 

import 'level.dart';

class FilterMap {
  FilterMap();

  void add(String classString, Level level) {
    //TODO, check this

    _map.putIfAbsent(classString, () => level);
  }

  void remove(String classString, Level level) {
    //TODO, check this

    _map.remove(classString);
  }

  void update(String classString, level) {
    //TODO, check this

    _map.update(classString, (v) => level, ifAbsent: () => level);
  }

  final Map<String, Level> _map = {};

  bool exists(String classString) {
    return _map.containsKey(classString);
  }

  Level get(String classString) {
    //CHECK
    return _map[classString]!;
  }
}
