// Singly Linked List

class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

ListNode? reversList(ListNode? head) {
  ListNode? prev = null;
  ListNode? curr = head;
  while (curr != null) {
    ListNode? temp = curr.next;
    curr.next = prev;
    prev = curr;
    curr = temp;
  }
  return prev;
}

// 1=>2=>3=>4
// 1<=2<=3<=4

// time O(n)
// space O(1)
