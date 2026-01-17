// ============================================
// 🎯 CODER BYTE / HACKERRANK MÜLAKAT HAZIRLIK
// 📚 ALGORİTMA SORULARI & ÇÖZÜMLER (DART)
// ============================================
// Bu dosya CoderByte tarzı algoritma soruları
// ve çözümlerini içerir.
// ============================================

// ============================================
// 📌 BÖLÜM 1: STRING MANİPÜLASYONU
// ============================================

// ❓ SORU 1: String Reverse
// Verilen string'i tersine çevir
// Input: "hello" -> Output: "olleh"
String reverseString(String str) {
  return str.split('').reversed.join('');
}

// Alternatif çözüm
String reverseString2(String str) {
  String result = '';
  for (int i = str.length - 1; i >= 0; i--) {
    result += str[i];
  }
  return result;
}

// ❓ SORU 2: Palindrome Check
// String palindrome mu kontrol et
// Input: "racecar" -> Output: true
bool isPalindrome(String str) {
  String clean = str.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  return clean == clean.split('').reversed.join('');
}

// ❓ SORU 3: First Non-Repeating Character
// İlk tekrar etmeyen karakteri bul
// Input: "aabbccd" -> Output: "d"
String firstNonRepeating(String str) {
  Map<String, int> charCount = {};
  
  for (var char in str.split('')) {
    charCount[char] = (charCount[char] ?? 0) + 1;
  }
  
  for (var char in str.split('')) {
    if (charCount[char] == 1) return char;
  }
  
  return '';
}

// ❓ SORU 4: Anagram Check
// İki string anagram mı?
// Input: "listen", "silent" -> Output: true
bool isAnagram(String s1, String s2) {
  if (s1.length != s2.length) return false;
  
  List<String> sorted1 = s1.toLowerCase().split('')..sort();
  List<String> sorted2 = s2.toLowerCase().split('')..sort();
  
  return sorted1.join() == sorted2.join();
}

// Alternatif çözüm (HashMap ile)
bool isAnagram2(String s1, String s2) {
  if (s1.length != s2.length) return false;
  
  Map<String, int> charCount = {};
  
  for (var char in s1.toLowerCase().split('')) {
    charCount[char] = (charCount[char] ?? 0) + 1;
  }
  
  for (var char in s2.toLowerCase().split('')) {
    if (!charCount.containsKey(char)) return false;
    charCount[char] = charCount[char]! - 1;
    if (charCount[char] == 0) charCount.remove(char);
  }
  
  return charCount.isEmpty;
}

// ❓ SORU 5: Longest Word
// Cümledeki en uzun kelimeyi bul
// Input: "I love programming" -> Output: "programming"
String longestWord(String sentence) {
  List<String> words = sentence.replaceAll(RegExp(r'[^a-zA-Z ]'), '').split(' ');
  String longest = '';
  
  for (var word in words) {
    if (word.length > longest.length) {
      longest = word;
    }
  }
  
  return longest;
}

// ❓ SORU 6: String Compression
// "aabbbcccc" -> "a2b3c4"
String compressString(String str) {
  if (str.isEmpty) return str;
  
  StringBuffer result = StringBuffer();
  int count = 1;
  
  for (int i = 1; i <= str.length; i++) {
    if (i < str.length && str[i] == str[i - 1]) {
      count++;
    } else {
      result.write(str[i - 1]);
      result.write(count);
      count = 1;
    }
  }
  
  return result.toString();
}

// ❓ SORU 7: Valid Parentheses
// Parantezler dengeli mi?
// Input: "([{}])" -> true, "([)]" -> false
bool isValidParentheses(String s) {
  List<String> stack = [];
  Map<String, String> pairs = {')': '(', ']': '[', '}': '{'};
  
  for (var char in s.split('')) {
    if ('([{'.contains(char)) {
      stack.add(char);
    } else if (')]}'.contains(char)) {
      if (stack.isEmpty || stack.last != pairs[char]) {
        return false;
      }
      stack.removeLast();
    }
  }
  
  return stack.isEmpty;
}

// ❓ SORU 8: Count Vowels
// Sesli harf sayısını bul
// Input: "hello world" -> Output: 3
int countVowels(String str) {
  return str.toLowerCase().split('').where((c) => 'aeiou'.contains(c)).length;
}

// ============================================
// 📌 BÖLÜM 2: ARRAY / LIST İŞLEMLERİ
// ============================================

// ❓ SORU 9: Two Sum
// Toplamı target olan iki sayının indekslerini bul
// Input: [2, 7, 11, 15], target = 9 -> Output: [0, 1]
List<int> twoSum(List<int> nums, int target) {
  Map<int, int> seen = {};
  
  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (seen.containsKey(complement)) {
      return [seen[complement]!, i];
    }
    seen[nums[i]] = i;
  }
  
  return [];
}

// ❓ SORU 10: Find Maximum
// Listedeki en büyük sayıyı bul
// Input: [3, 1, 4, 1, 5, 9] -> Output: 9
int findMax(List<int> nums) {
  int max = nums[0];
  for (var num in nums) {
    if (num > max) max = num;
  }
  return max;
}

// veya: nums.reduce((a, b) => a > b ? a : b);

// ❓ SORU 11: Remove Duplicates
// Tekrar eden elemanları kaldır
// Input: [1, 2, 2, 3, 3, 3] -> Output: [1, 2, 3]
List<int> removeDuplicates(List<int> nums) {
  return nums.toSet().toList();
}

// Alternatif (sıralı kalması için)
List<int> removeDuplicates2(List<int> nums) {
  List<int> result = [];
  Set<int> seen = {};
  
  for (var num in nums) {
    if (!seen.contains(num)) {
      seen.add(num);
      result.add(num);
    }
  }
  
  return result;
}

// ❓ SORU 12: Array Intersection
// İki dizinin kesişimini bul
// Input: [1, 2, 2, 1], [2, 2] -> Output: [2, 2]
List<int> intersection(List<int> nums1, List<int> nums2) {
  Map<int, int> count = {};
  List<int> result = [];
  
  for (var num in nums1) {
    count[num] = (count[num] ?? 0) + 1;
  }
  
  for (var num in nums2) {
    if (count.containsKey(num) && count[num]! > 0) {
      result.add(num);
      count[num] = count[num]! - 1;
    }
  }
  
  return result;
}

// ❓ SORU 13: Move Zeros
// Sıfırları sona taşı
// Input: [0, 1, 0, 3, 12] -> Output: [1, 3, 12, 0, 0]
List<int> moveZeros(List<int> nums) {
  List<int> result = nums.where((n) => n != 0).toList();
  result.addAll(List.filled(nums.length - result.length, 0));
  return result;
}

// In-place çözüm
void moveZerosInPlace(List<int> nums) {
  int insertPos = 0;
  
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      nums[insertPos] = nums[i];
      insertPos++;
    }
  }
  
  while (insertPos < nums.length) {
    nums[insertPos] = 0;
    insertPos++;
  }
}

// ❓ SORU 14: Rotate Array
// Diziyi k adım sağa döndür
// Input: [1, 2, 3, 4, 5], k = 2 -> Output: [4, 5, 1, 2, 3]
List<int> rotateArray(List<int> nums, int k) {
  k = k % nums.length;
  return [...nums.sublist(nums.length - k), ...nums.sublist(0, nums.length - k)];
}

// ❓ SORU 15: Missing Number
// 0'dan n'e kadar eksik sayıyı bul
// Input: [3, 0, 1] -> Output: 2
int missingNumber(List<int> nums) {
  int n = nums.length;
  int expectedSum = n * (n + 1) ~/ 2;
  int actualSum = nums.reduce((a, b) => a + b);
  return expectedSum - actualSum;
}

// ❓ SORU 16: Single Number
// Sadece bir kez geçen sayıyı bul (diğerleri 2 kez)
// Input: [2, 2, 1] -> Output: 1
int singleNumber(List<int> nums) {
  return nums.reduce((a, b) => a ^ b); // XOR trick
}

// ❓ SORU 17: Maximum Subarray (Kadane's Algorithm)
// En büyük toplama sahip alt diziyi bul
// Input: [-2, 1, -3, 4, -1, 2, 1, -5, 4] -> Output: 6 ([4, -1, 2, 1])
int maxSubArray(List<int> nums) {
  int maxSum = nums[0];
  int currentSum = nums[0];
  
  for (int i = 1; i < nums.length; i++) {
    currentSum = currentSum + nums[i] > nums[i] ? currentSum + nums[i] : nums[i];
    if (currentSum > maxSum) maxSum = currentSum;
  }
  
  return maxSum;
}

// ❓ SORU 18: Best Time to Buy and Sell Stock
// Hisse alım-satım max kar
// Input: [7, 1, 5, 3, 6, 4] -> Output: 5 (Buy at 1, sell at 6)
int maxProfit(List<int> prices) {
  int minPrice = prices[0];
  int maxProfit = 0;
  
  for (var price in prices) {
    if (price < minPrice) {
      minPrice = price;
    } else if (price - minPrice > maxProfit) {
      maxProfit = price - minPrice;
    }
  }
  
  return maxProfit;
}

// ❓ SORU 19: Contains Duplicate
// Dizide tekrar var mı?
// Input: [1, 2, 3, 1] -> Output: true
bool containsDuplicate(List<int> nums) {
  return nums.length != nums.toSet().length;
}

// ❓ SORU 20: Merge Sorted Arrays
// İki sıralı diziyi birleştir
// Input: [1, 3, 5], [2, 4, 6] -> Output: [1, 2, 3, 4, 5, 6]
List<int> mergeSortedArrays(List<int> nums1, List<int> nums2) {
  List<int> result = [];
  int i = 0, j = 0;
  
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] <= nums2[j]) {
      result.add(nums1[i]);
      i++;
    } else {
      result.add(nums2[j]);
      j++;
    }
  }
  
  result.addAll(nums1.sublist(i));
  result.addAll(nums2.sublist(j));
  
  return result;
}

// ============================================
// 📌 BÖLÜM 3: SAYISAL İŞLEMLER
// ============================================

// ❓ SORU 21: FizzBuzz
// 1'den n'e: 3'e bölünür -> "Fizz", 5'e -> "Buzz", ikisine -> "FizzBuzz"
List<String> fizzBuzz(int n) {
  List<String> result = [];
  
  for (int i = 1; i <= n; i++) {
    if (i % 15 == 0) {
      result.add('FizzBuzz');
    } else if (i % 3 == 0) {
      result.add('Fizz');
    } else if (i % 5 == 0) {
      result.add('Buzz');
    } else {
      result.add(i.toString());
    }
  }
  
  return result;
}

// ❓ SORU 22: Fibonacci
// n. Fibonacci sayısını bul
// Input: 6 -> Output: 8 (0, 1, 1, 2, 3, 5, 8)
int fibonacci(int n) {
  if (n <= 1) return n;
  
  int a = 0, b = 1;
  for (int i = 2; i <= n; i++) {
    int temp = a + b;
    a = b;
    b = temp;
  }
  
  return b;
}

// Recursive (verimsiz ama basit)
int fibonacciRecursive(int n) {
  if (n <= 1) return n;
  return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2);
}

// ❓ SORU 23: Factorial
// Faktöriyel hesapla
// Input: 5 -> Output: 120
int factorial(int n) {
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}

// ❓ SORU 24: Prime Number Check
// Asal sayı mı?
// Input: 17 -> Output: true
bool isPrime(int n) {
  if (n <= 1) return false;
  if (n <= 3) return true;
  if (n % 2 == 0 || n % 3 == 0) return false;
  
  for (int i = 5; i * i <= n; i += 6) {
    if (n % i == 0 || n % (i + 2) == 0) return false;
  }
  
  return true;
}

// ❓ SORU 25: Power of Two
// 2'nin kuvveti mi?
// Input: 16 -> Output: true
bool isPowerOfTwo(int n) {
  return n > 0 && (n & (n - 1)) == 0;
}

// ❓ SORU 26: Reverse Integer
// Sayıyı tersine çevir
// Input: 123 -> Output: 321, Input: -123 -> Output: -321
int reverseInteger(int x) {
  int sign = x < 0 ? -1 : 1;
  x = x.abs();
  
  int reversed = 0;
  while (x > 0) {
    reversed = reversed * 10 + x % 10;
    x ~/= 10;
  }
  
  return sign * reversed;
}

// ❓ SORU 27: Count Digits
// Rakam sayısını bul
// Input: 12345 -> Output: 5
int countDigits(int n) {
  n = n.abs();
  if (n == 0) return 1;
  
  int count = 0;
  while (n > 0) {
    count++;
    n ~/= 10;
  }
  
  return count;
}

// ❓ SORU 28: Sum of Digits
// Rakamlar toplamı
// Input: 123 -> Output: 6
int sumOfDigits(int n) {
  n = n.abs();
  int sum = 0;
  
  while (n > 0) {
    sum += n % 10;
    n ~/= 10;
  }
  
  return sum;
}

// ❓ SORU 29: GCD (Greatest Common Divisor)
// En büyük ortak bölen
// Input: 12, 18 -> Output: 6
int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

// ❓ SORU 30: LCM (Least Common Multiple)
// En küçük ortak kat
// Input: 4, 6 -> Output: 12
int lcm(int a, int b) {
  return (a * b) ~/ gcd(a, b);
}

// ============================================
// 📌 BÖLÜM 4: SIRALAMA & ARAMA
// ============================================

// ❓ SORU 31: Binary Search
// Sıralı dizide eleman ara
// Input: [1, 2, 3, 4, 5], target = 3 -> Output: 2
int binarySearch(List<int> nums, int target) {
  int left = 0, right = nums.length - 1;
  
  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    
    if (nums[mid] == target) {
      return mid;
    } else if (nums[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  
  return -1; // Not found
}

// ❓ SORU 32: Bubble Sort
// Kabarcık sıralaması
List<int> bubbleSort(List<int> nums) {
  List<int> arr = List.from(nums);
  
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  
  return arr;
}

// ❓ SORU 33: Quick Sort
List<int> quickSort(List<int> nums) {
  if (nums.length <= 1) return nums;
  
  int pivot = nums[nums.length ~/ 2];
  List<int> left = nums.where((x) => x < pivot).toList();
  List<int> middle = nums.where((x) => x == pivot).toList();
  List<int> right = nums.where((x) => x > pivot).toList();
  
  return [...quickSort(left), ...middle, ...quickSort(right)];
}

// ❓ SORU 34: Merge Sort
List<int> mergeSort(List<int> nums) {
  if (nums.length <= 1) return nums;
  
  int mid = nums.length ~/ 2;
  List<int> left = mergeSort(nums.sublist(0, mid));
  List<int> right = mergeSort(nums.sublist(mid));
  
  return mergeSortedArrays(left, right);
}

// ❓ SORU 35: Find Kth Largest
// K. en büyük elemanı bul
// Input: [3, 2, 1, 5, 6, 4], k = 2 -> Output: 5
int findKthLargest(List<int> nums, int k) {
  nums.sort((a, b) => b.compareTo(a));
  return nums[k - 1];
}

// ============================================
// 📌 BÖLÜM 5: LINKED LIST / RECURSIVE
// ============================================

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

// ❓ SORU 36: Reverse Linked List
ListNode? reverseLinkedList(ListNode? head) {
  ListNode? prev;
  ListNode? current = head;
  
  while (current != null) {
    ListNode? next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  
  return prev;
}

// ❓ SORU 37: Middle of Linked List
ListNode? middleNode(ListNode? head) {
  ListNode? slow = head;
  ListNode? fast = head;
  
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  
  return slow;
}

// ❓ SORU 38: Linked List Cycle Detection
bool hasCycle(ListNode? head) {
  ListNode? slow = head;
  ListNode? fast = head;
  
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
    if (slow == fast) return true;
  }
  
  return false;
}

// ❓ SORU 39: Merge Two Sorted Lists
ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {
  ListNode dummy = ListNode(0);
  ListNode current = dummy;
  
  while (l1 != null && l2 != null) {
    if (l1.val <= l2.val) {
      current.next = l1;
      l1 = l1.next;
    } else {
      current.next = l2;
      l2 = l2.next;
    }
    current = current.next!;
  }
  
  current.next = l1 ?? l2;
  
  return dummy.next;
}

// ❓ SORU 40: Remove Nth Node From End
ListNode? removeNthFromEnd(ListNode? head, int n) {
  ListNode dummy = ListNode(0);
  dummy.next = head;
  
  ListNode? first = dummy;
  ListNode? second = dummy;
  
  // First pointer n+1 adım ilerle
  for (int i = 0; i <= n; i++) {
    first = first!.next;
  }
  
  // İkisi birlikte ilerle
  while (first != null) {
    first = first.next;
    second = second!.next;
  }
  
  // n. node'u atla
  second!.next = second.next!.next;
  
  return dummy.next;
}

// ============================================
// 📌 BÖLÜM 6: TREE & GRAPH
// ============================================

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val, [this.left, this.right]);
}

// ❓ SORU 41: Maximum Depth of Binary Tree
int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  return 1 + (maxDepth(root.left) > maxDepth(root.right)
      ? maxDepth(root.left)
      : maxDepth(root.right));
}

// ❓ SORU 42: Invert Binary Tree
TreeNode? invertTree(TreeNode? root) {
  if (root == null) return null;
  
  TreeNode? temp = root.left;
  root.left = invertTree(root.right);
  root.right = invertTree(temp);
  
  return root;
}

// ❓ SORU 43: Same Tree
bool isSameTree(TreeNode? p, TreeNode? q) {
  if (p == null && q == null) return true;
  if (p == null || q == null) return false;
  
  return p.val == q.val &&
      isSameTree(p.left, q.left) &&
      isSameTree(p.right, q.right);
}

// ❓ SORU 44: Symmetric Tree
bool isSymmetric(TreeNode? root) {
  return isMirror(root, root);
}

bool isMirror(TreeNode? t1, TreeNode? t2) {
  if (t1 == null && t2 == null) return true;
  if (t1 == null || t2 == null) return false;
  
  return t1.val == t2.val &&
      isMirror(t1.left, t2.right) &&
      isMirror(t1.right, t2.left);
}

// ❓ SORU 45: Path Sum
bool hasPathSum(TreeNode? root, int targetSum) {
  if (root == null) return false;
  
  if (root.left == null && root.right == null) {
    return targetSum == root.val;
  }
  
  return hasPathSum(root.left, targetSum - root.val) ||
      hasPathSum(root.right, targetSum - root.val);
}

// ============================================
// 📌 BÖLÜM 7: DYNAMIC PROGRAMMING
// ============================================

// ❓ SORU 46: Climbing Stairs
// n basamak merdiven, 1 veya 2 adım atabilirsin. Kaç farklı yol?
// Input: 3 -> Output: 3 (1+1+1, 1+2, 2+1)
int climbStairs(int n) {
  if (n <= 2) return n;
  
  int a = 1, b = 2;
  for (int i = 3; i <= n; i++) {
    int temp = a + b;
    a = b;
    b = temp;
  }
  
  return b;
}

// ❓ SORU 47: House Robber
// Yan yana ev soyamazsın, maksimum para?
// Input: [1, 2, 3, 1] -> Output: 4
int rob(List<int> nums) {
  if (nums.isEmpty) return 0;
  if (nums.length == 1) return nums[0];
  
  int prev1 = 0, prev2 = 0;
  
  for (var num in nums) {
    int temp = prev1 > prev2 + num ? prev1 : prev2 + num;
    prev2 = prev1;
    prev1 = temp;
  }
  
  return prev1;
}

// ❓ SORU 48: Coin Change
// Minimum kaç bozukluk ile hedef tutarı yap
// Input: coins = [1, 2, 5], amount = 11 -> Output: 3 (5+5+1)
int coinChange(List<int> coins, int amount) {
  List<int> dp = List.filled(amount + 1, amount + 1);
  dp[0] = 0;
  
  for (int i = 1; i <= amount; i++) {
    for (var coin in coins) {
      if (coin <= i) {
        dp[i] = dp[i] < dp[i - coin] + 1 ? dp[i] : dp[i - coin] + 1;
      }
    }
  }
  
  return dp[amount] > amount ? -1 : dp[amount];
}

// ❓ SORU 49: Longest Increasing Subsequence
// En uzun artan alt dizi uzunluğu
// Input: [10, 9, 2, 5, 3, 7, 101, 18] -> Output: 4 ([2, 3, 7, 101])
int lengthOfLIS(List<int> nums) {
  List<int> dp = List.filled(nums.length, 1);
  
  for (int i = 1; i < nums.length; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[j] < nums[i]) {
        dp[i] = dp[i] > dp[j] + 1 ? dp[i] : dp[j] + 1;
      }
    }
  }
  
  return dp.reduce((a, b) => a > b ? a : b);
}

// ❓ SORU 50: Word Break
// String, verilen kelimelerle oluşturulabilir mi?
bool wordBreak(String s, List<String> wordDict) {
  Set<String> words = wordDict.toSet();
  List<bool> dp = List.filled(s.length + 1, false);
  dp[0] = true;
  
  for (int i = 1; i <= s.length; i++) {
    for (int j = 0; j < i; j++) {
      if (dp[j] && words.contains(s.substring(j, i))) {
        dp[i] = true;
        break;
      }
    }
  }
  
  return dp[s.length];
}

// ============================================
// 📌 BÖLÜM 8: ÖZEL ALGORİTMALAR
// ============================================

// ❓ SORU 51: Roman to Integer
int romanToInt(String s) {
  Map<String, int> values = {
    'I': 1, 'V': 5, 'X': 10, 'L': 50,
    'C': 100, 'D': 500, 'M': 1000
  };
  
  int result = 0;
  for (int i = 0; i < s.length; i++) {
    if (i + 1 < s.length && values[s[i]]! < values[s[i + 1]]!) {
      result -= values[s[i]]!;
    } else {
      result += values[s[i]]!;
    }
  }
  
  return result;
}

// ❓ SORU 52: Valid Sudoku
bool isValidSudoku(List<List<String>> board) {
  for (int i = 0; i < 9; i++) {
    Set<String> rows = {}, cols = {}, boxes = {};
    
    for (int j = 0; j < 9; j++) {
      String r = board[i][j];
      String c = board[j][i];
      String b = board[3 * (i ~/ 3) + j ~/ 3][3 * (i % 3) + j % 3];
      
      if (r != '.' && rows.contains(r)) return false;
      if (c != '.' && cols.contains(c)) return false;
      if (b != '.' && boxes.contains(b)) return false;
      
      rows.add(r);
      cols.add(c);
      boxes.add(b);
    }
  }
  
  return true;
}

// ❓ SORU 53: Product of Array Except Self
// Her eleman için diğerlerinin çarpımı (bölme kullanmadan)
// Input: [1, 2, 3, 4] -> Output: [24, 12, 8, 6]
List<int> productExceptSelf(List<int> nums) {
  int n = nums.length;
  List<int> result = List.filled(n, 1);
  
  // Sol çarpımlar
  int left = 1;
  for (int i = 0; i < n; i++) {
    result[i] = left;
    left *= nums[i];
  }
  
  // Sağ çarpımlar
  int right = 1;
  for (int i = n - 1; i >= 0; i--) {
    result[i] *= right;
    right *= nums[i];
  }
  
  return result;
}

// ❓ SORU 54: Group Anagrams
// Anagramları grupla
Map<String, List<String>> groupAnagrams(List<String> strs) {
  Map<String, List<String>> groups = {};
  
  for (var s in strs) {
    String key = (s.split('')..sort()).join();
    groups.putIfAbsent(key, () => []).add(s);
  }
  
  return groups;
}

// ❓ SORU 55: Spiral Matrix
// Matrisi spiral olarak oku
List<int> spiralOrder(List<List<int>> matrix) {
  if (matrix.isEmpty) return [];
  
  List<int> result = [];
  int top = 0, bottom = matrix.length - 1;
  int left = 0, right = matrix[0].length - 1;
  
  while (top <= bottom && left <= right) {
    // Sağa
    for (int i = left; i <= right; i++) {
      result.add(matrix[top][i]);
    }
    top++;
    
    // Aşağı
    for (int i = top; i <= bottom; i++) {
      result.add(matrix[i][right]);
    }
    right--;
    
    // Sola
    if (top <= bottom) {
      for (int i = right; i >= left; i--) {
        result.add(matrix[bottom][i]);
      }
      bottom--;
    }
    
    // Yukarı
    if (left <= right) {
      for (int i = bottom; i >= top; i--) {
        result.add(matrix[i][left]);
      }
      left++;
    }
  }
  
  return result;
}

// ============================================
// 📌 MAIN - TEST
// ============================================

void main() {
  print("=== STRING ===");
  print("Reverse 'hello': ${reverseString('hello')}");
  print("Is 'racecar' palindrome: ${isPalindrome('racecar')}");
  print("First non-repeating in 'aabbccd': ${firstNonRepeating('aabbccd')}");
  print("Is 'listen' anagram of 'silent': ${isAnagram('listen', 'silent')}");
  
  print("\n=== ARRAY ===");
  print("Two Sum [2,7,11,15], 9: ${twoSum([2, 7, 11, 15], 9)}");
  print("Remove duplicates [1,2,2,3,3,3]: ${removeDuplicates([1, 2, 2, 3, 3, 3])}");
  print("Max subarray [-2,1,-3,4,-1,2,1,-5,4]: ${maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4])}");
  
  print("\n=== NUMBERS ===");
  print("Fibonacci(10): ${fibonacci(10)}");
  print("Is 17 prime: ${isPrime(17)}");
  print("FizzBuzz(15): ${fizzBuzz(15)}");
  
  print("\n=== SORT/SEARCH ===");
  print("Binary search [1,2,3,4,5], 3: ${binarySearch([1, 2, 3, 4, 5], 3)}");
  print("Quick sort [3,1,4,1,5,9]: ${quickSort([3, 1, 4, 1, 5, 9])}");
  
  print("\n=== DP ===");
  print("Climb stairs(5): ${climbStairs(5)}");
  print("Coin change [1,2,5], 11: ${coinChange([1, 2, 5], 11)}");
}
