

void main()
{
  print("hello world");

  var list1 = [1, 2, 3, 4, 5];

  var list2 = [];

  list2.addAll(list1);

  list2.add(6);
  list2.add(7);
  list2.add("Eight");
  list2.add("Nine");

  print("$list2");

  list2.removeAt(6);
  print(list2);

  print("Length: ${list2.length}");
  print("Reversed: ${list2.reversed}");
  print("First element: ${list2.first}");
  print("Last element: ${list2.last}");
  print("is Empty?: ${list2.isEmpty}");
  print("is not Empty?: ${list2.isNotEmpty}");
  print("element at index 2: ${list2.elementAt(2)}");

}