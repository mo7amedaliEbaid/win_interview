//  Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? invertTree(TreeNode? root) {
    if (root != null) {
      var temp = root.left;
      root.left = root.right;
      root.right = temp;
      invertTree(root.left);
      invertTree(root.right);
      return root;
    } else {
      return null;
    }
  }
}

// Depth First Search
// Recursive

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  int maxLeftDepth = maxDepth(root.left);
  int maxRightDepth = maxDepth(root.right);
  return 1 + (maxRightDepth > maxLeftDepth ? maxRightDepth : maxLeftDepth);
}

// Diameter of binary tree

// To solve the problem of finding the diameter of a binary tree in Dart, we will use a depth-first search (DFS) approach.
// Let's break this down step by step.
//
// Problem Explanation
// The diameter of a binary tree is defined as the length of the longest path between any two nodes in the tree.
// This path can pass through the root or might not.
//
// The length of the path is measured in terms of edges, not nodes.
// For each node in the tree, the longest path that passes through that node would be the sum of:
// The height of its left subtree.
// The height of its right subtree.
// The solution will involve:
//
// Calculating the height of each subtree.
// Keeping track of the maximum diameter encountered.
// Approach
// DFS Recursive Approach:
// Traverse the tree recursively using a helper function that calculates the height of the subtrees.
// While calculating the height, update the diameter by checking the sum of the heights of the left and right subtrees for each node.

class Solution1 {
  int _maxDiameter = 0;

  int diameterOfBinaryTree(TreeNode? root) {
    _calculateHeight(root);
    return _maxDiameter;
  }

  int _calculateHeight(TreeNode? node) {
    if (node == null) {
      return 0;
    }
    int leftHeight = _calculateHeight(node.left);
    int rightHeight = _calculateHeight(node.right);
    _maxDiameter = _maxDiameter > (leftHeight + rightHeight)
        ? _maxDiameter
        : (leftHeight + rightHeight);
    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
  }
}
// Explanation
// Helper Function:
//
// _calculateHeight(TreeNode? node):
// Returns the height of the subtree rooted at node.
// Computes the left and right subtree heights recursively.
// Updates _maxDiameter with the sum of left and right heights at each node.
// Base Case:
//
// If node is null, return 0 (height of an empty subtree is 0).
// Main Function:
//
// diameterOfBinaryTree(TreeNode? root):
// Calls _calculateHeight to traverse and compute heights.
// Returns the maximum diameter.
// Complexity Analysis
// Time Complexity:
// O(N), where
// N is the number of nodes in the tree. Each node is visited once.
// Space Complexity:
// O(H), where
// H is the height of the tree. This accounts for the recursion stack.
