function ListNode(val) {
    this.val = val;
    this.next = null;
}

let listNode2 = ListNode(2);
let listNode3 = ListNode(3);
let listNode4 = ListNode(4);
listNode2.next = listNode3;
listNode3.next = listNode4;

let listNode5 = ListNode(5);
let listNode6 = ListNode(6);
let listNode4 = ListNode(4);
listNode5.next = listNode6;
listNode6.next = listNode4;

let listNode7 = ListNode(7);
let listNode0 = ListNode(0);
let listNode8 = ListNode(8);
listNode7.next = listNode0;
listNode0.next = listNode8;

if (addTwoNumbers(listNode2, listNode5) === listNode7) {
    return true;
} else {
    return false;
}
