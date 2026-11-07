import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  // Sort the list by the value of the given field (e.g. 'first', 'last', 'email').
  void sort(String field) {
    people.sort((a, b) => (a[field] ?? '').compareTo(b[field] ?? ''));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  // Remove every person whose [field] matches [value].
  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main(List<String> arguments) {
  String json = '''
[
  {"id": "84766fdf-9dc8-4b27-953f-a0756d48a2ba", "first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
  {"id": "ef18a663-721c-4905-8220-7d8458ddc644", "first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
  {"id": "2bd58d29-e4ce-443d-ac50-49bea0c7d968", "first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
  {"id": "90e8d858-284b-4d04-80ec-cae6e026ba88", "first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"},
  {"id": "d47cd8a0-8308-410c-b4b3-dec3aaf1d78f", "first":"Divine", "last":"Adiole", "email":"adio0002@algonquinlive.com"},
  {"id": "b8da5eb6-6de9-4b5d-b66d-d59a084aaa60", "first":"Maya", "last":"Okafor", "email":"maya.okafor@example.com"},
  {"id": "771afc48-6ec1-4ed9-ac36-8d1f0ef6fe28", "first":"Liam", "last":"Bouchard", "email":"liam.bouchard@example.com"}
]
''';

  // jsonDecode gives List<dynamic>, so convert each item to Map<String, String>.
  List<Map<String, String>> people = (jsonDecode(json) as List)
      .map((item) => Map<String, String>.from(item))
      .toList();

  Students students = Students(people);

  print('--- Original list ---');
  students.output();

  print('\n--- sort("first") ---');
  students.sort('first');
  students.output();

  print('\n--- sort("last") ---');
  students.sort('last');
  students.output();

  print('\n--- plus(Priya Nair) ---');
  students.plus({
    'id': '0b0c3ecb-9d33-4b20-8b4f-76a9feeb184d',
    'first': 'Priya',
    'last': 'Nair',
    'email': 'priya.nair@example.com',
  });
  students.output();

  print('\n--- remove("last", "Davidson") ---');
  students.remove('last', 'Davidson');
  students.output();

  print('\n--- sort("email") ---');
  students.sort('email');
  students.output();
}
