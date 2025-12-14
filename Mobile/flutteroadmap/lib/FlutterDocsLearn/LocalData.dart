//Local Data Learning...

class Data {}

Data? _cachedData;

Future<Data> get data async {
  // Step 1: Check whether your cache already contains the desired data
  if (_cachedData == null) {
    // Step 2: Load the data if the cache was empty
    _cachedData = await _readData();
  }
  // Step 3: Return the value in the cache
  return _cachedData!;
}

class UserRepository {
  UserRepository(this.api);

  final Api api;
  final Map<int, User?> _userCache = {};

  Future<User?> loadUser(int id) async {
    if (!_userCache.containsKey(id)) {
      final response = await api.get(id);
      if (response.statusCode == 200) {
        _userCache[id] = User.fromJson(response.body);
      } else {
        _userCache[id] = null;
      }
    }
    return _userCache[id];
  }
}

//Caching of another database service

/*Cookbook: Persist data with SQLite
SQLite alternate: sqlite3 package
Drift, a relational database: drift package
Hive CE, a non-relational database: hive_ce package
Isar Community, a fast non-relational database: isar_community package
Remote Caching, a lightweight caching system for API responses: remote_caching package*/
