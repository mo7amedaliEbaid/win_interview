main() {
  print(sortArray([5, 2, 7, 9]));
}

List<int> sortArray(List<int> nums) {
  // Sort the array in ascending order by calling the desired sorting function
  return insertionSort(nums);
}

// 1. Insertion Sort
List<int> insertionSort(List<int> nums) {
  for (var i = 1; i < nums.length; i++) {
    int curr=nums[i];
    int j=i-1;
    while(j>=0&&curr<nums[j]){
      nums[j+1]=nums[j];
      j--;
    }
    nums[j+1]=curr;
  }
  return nums;
}

// 2. Merge Sort
List<int> mergeSort(List<int> nums) {
  if (nums.length <= 1) {
    return nums;
  }
  int mid = nums.length ~/ 2;
  List<int> left = mergeSort(nums.sublist(0, mid));
  List<int> right = mergeSort(nums.sublist(mid));
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}

// 3. Selection Sort
List<int> selectionSort(List<int> nums) {
  for (int i = 0; i < nums.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[j] < nums[minIndex]) {
        minIndex = j;
      }
    }
    if (minIndex != i) {
      int temp = nums[i];
      nums[i] = nums[minIndex];
      nums[minIndex] = temp;
    }
  }
  return nums;
}
