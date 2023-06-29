class DisjointSet<T> {
  final Map<T, T> _parent = <T, T>{};
  final Map<T, int> _rank = <T, int>{};

  DisjointSet();

  void makeSet(T element) {
    if (_parent.containsKey(element)) return;
    _parent[element] = element;
    _rank[element] = 0;
  }

  void makeSets(Iterable<T> elements) {
    for (final element in elements) {
      makeSet(element);
    }
  }

  T find(T node) {
    while (node != _parent[node]) {
      node = _parent[node]!;
      _parent[node] = _parent[_parent[node]!]!;
    }
    return node;
  }

  void union(T x, T y) {
    final xSet = find(x);
    final ySet = find(y);

    if (xSet == ySet) return;
    if (_rank[xSet]! < _rank[ySet]!) {
      _parent[xSet] = ySet;
    } else if (_rank[xSet]! > _rank[ySet]!) {
      _parent[ySet] = xSet;
    } else {
      _parent[ySet] = xSet;
      _rank[xSet] = _rank[xSet]! + 1;
    }
  }
}
