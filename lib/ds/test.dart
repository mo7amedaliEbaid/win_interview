main() {}

bool isValidAnagram(String s, String t) {
  if (s.length != t.length) return false;

  Map<String, int> charMap = {};

  for (var i = 0; i < s.length; i++) {
    if (charMap.containsKey(s[i])) {
      charMap.update(s[i], (value) => value + 1);
    } else {
      charMap[s[i]] = 1;
    }
  }
  for (var i = 0; i < t.length; i++) {
    if (charMap.containsKey(t[i])) {
      charMap.update(t[i], (value) => value - 1);
    } else {
      return false;
    }
  }

  return charMap.values.every((count) => count == 0);
}
