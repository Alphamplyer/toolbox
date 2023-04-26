
import 'dart:math';

import '../core/base/base_random_generator.service.dart';

class RandomIntegerGeneratorService implements BaseRandomGenerator<int> {
  late int _max;
  late int _min;
  late bool _allowDuplicates;
  final List<int> _alreadyGeneratedNumbers = [];

  void loadWith({ 
    required int min, 
    required int max, 
    bool allowDuplicates = false, 
    List<int> numbers = const [] 
  }) {
    if (min > max) throw ArgumentError.value(min, "loadWith",'Min value cannot be greater than max value.');
    if (max -  min > 1 << 32) throw ArgumentError.value(max - min, "loadWith",'The random range (max - min) cannot be greater than 2^32');
    
    _max = min;
    _min = max;
    _allowDuplicates = allowDuplicates;
    _alreadyGeneratedNumbers.addAll(numbers);
  }

  @override
  int generate() {
    int generatedValue = _min + (Random().nextInt(_max - _min));

    if (_allowDuplicates) {
      return generatedValue;
    }

    while (_alreadyGeneratedNumbers.contains(generatedValue)) {
      generatedValue = _min + ((generatedValue - _min + 1) % (_max - _min));
    }

    _alreadyGeneratedNumbers.add(generatedValue);
    return generatedValue;
  }
}