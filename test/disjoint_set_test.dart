import 'package:disjoint_set/disjoint_set.dart';
import 'package:test/test.dart';

void main() {
  group('Disjoint Set Tests', () {
    test('Test makeSet method', () {
      final disjointSet = DisjointSet<int>();
      disjointSet.makeSet(1);
      disjointSet.makeSet(2);
      disjointSet.makeSet(3);

      expect(disjointSet.find(1), equals(1));
      expect(disjointSet.find(2), equals(2));
      expect(disjointSet.find(3), equals(3));
    });

    test('Test makeSets method', () {
      final disjointSet = DisjointSet<String>();
      disjointSet.makeSets(['A', 'B', 'C', 'D']);

      expect(disjointSet.find('A'), equals('A'));
      expect(disjointSet.find('B'), equals('B'));
      expect(disjointSet.find('C'), equals('C'));
      expect(disjointSet.find('D'), equals('D'));
    });

    test('Test union method', () {
      final disjointSet = DisjointSet<int>();
      disjointSet.makeSets([1, 2, 3, 4, 5]);

      disjointSet.union(1, 2);
      disjointSet.union(2, 3);
      disjointSet.union(4, 5);

      expect(disjointSet.find(1), equals(1));
      expect(disjointSet.find(2), equals(1));
      expect(disjointSet.find(3), equals(1));
      expect(disjointSet.find(4), equals(4));
      expect(disjointSet.find(5), equals(4));
    });

    test('Test union method - already in the same set', () {
      final disjointSet = DisjointSet<int>();
      disjointSet.makeSets([1, 2, 3]);

      disjointSet.union(1, 2);
      disjointSet.union(2, 3);

      disjointSet.union(1, 3); // Union of elements already in the same set

      expect(disjointSet.find(1), equals(1));
      expect(disjointSet.find(2), equals(1));
      expect(disjointSet.find(3), equals(1));
    });

    test('Test union method - merging sets with different ranks', () {
      final disjointSet = DisjointSet<int>();
      disjointSet.makeSets([1, 2, 3, 4, 5]);

      disjointSet.union(1, 2);
      disjointSet.union(2, 3);
      disjointSet.union(4, 5);

      disjointSet.union(1, 4); // Merge sets with different ranks

      expect(disjointSet.find(1), equals(1));
      expect(disjointSet.find(2), equals(1));
      expect(disjointSet.find(3), equals(1));
      expect(disjointSet.find(4), equals(1));
      expect(disjointSet.find(5), equals(1));
    });

    test('Test union method - self-union', () {
      final disjointSet = DisjointSet<int>();
      disjointSet.makeSet(1);

      disjointSet.union(1, 1); // Self-union

      expect(disjointSet.find(1), equals(1));
    });
  });
}
