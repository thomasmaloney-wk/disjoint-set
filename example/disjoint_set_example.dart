import 'package:disjoint_set/disjoint_set.dart';
import 'package:quiver/iterables.dart';

bool areQueriesSimilar(String qOne, String qTwo, DisjointSet<String> wordsSet) {
  final qOneWords = qOne.split(' ');
  final qTwoWords = qTwo.split(' ');
  final ahhh = zip([qOneWords, qTwoWords]);
  for (final words in ahhh) {
    if (wordsSet.find(words.first) != wordsSet.find(words.last)) {
      return false;
    }
  }
  return true;
}

void main() {
  final queryOne = 'worlds largest apple';
  final queryTwo = 'planets biggest apple';
  final queryThree = 'worlds smallest apple';
  final wordSet = DisjointSet<String>();
  wordSet.makeSets(queryOne.split(' '));
  wordSet.makeSets(queryTwo.split(' '));
  wordSet.makeSets(queryThree.split(' '));
  wordSet.union('largest', 'biggest');
  wordSet.union('worlds', 'planets');
  
  final simOne = areQueriesSimilar(queryOne, queryTwo, wordSet);
  final simTwo = areQueriesSimilar(queryOne, queryThree, wordSet);
  
  print('$simOne');
  print('$simTwo');
  
  
}
