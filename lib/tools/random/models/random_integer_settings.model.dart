
class RandomIntegerSettings {
  final int min;
  final int max;
  final bool allowDuplicates;

  RandomIntegerSettings({
    this.min = 0, 
    this.max = 100,
    this.allowDuplicates = false,
  });
}