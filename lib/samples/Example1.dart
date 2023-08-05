

void main()
{
  print("hello world");

  // listExamples();
  mapExamples();


}

void mapExamples() {
  //method-1
//   var afnan = {
//     'name': 'Afnan',
//     'usn':"4VP22MC027",
//     'm1':89
//   };
//
//   print("name : ${afnan['name']}, USN: ${afnan['usn']}, Marks: ${afnan['m1']}");
//
//    afnan['m1'] = 91;
//    print('Marks: ${afnan['m1']}');

//   method-2

  // var afnan = Map();
  // afnan['name'] = "Afnan";
  // afnan['usn'] = "4VP22MC027";
  // afnan['m1'] = 90;
  //
  // print(afnan);
  //
  // print(afnan.isEmpty);
  // print(afnan.isNotEmpty);
  // print(afnan.containsKey('name'));
  // print(afnan.containsKey('nn'));
  // print(afnan.containsValue('afnan'));
  // print(afnan.containsValue('Afnan'));
  // print(afnan.keys);
  // print(afnan.remove('name'));
  // print(afnan);





}


void listExamples()
{
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