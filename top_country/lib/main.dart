import 'package:flutter/material.dart';

void main() {
  ListData.initializeCountry();
  runApp(const ItCountryApp());
}

class ListStructure {
  String? key;
  String? values;

  ListStructure(this.key, this.values);
}

class ListData {
  static List<ListStructure> list = [];

  static void initializeCountry() {
    Map<String, String> country = {
      'CША': 'США, особенно такие города, как Сан-Франциско и Нью-Йорк, являются центрами технологических инноваций. Здесь расположены крупнейшие компании, такие как Google, Apple и Facebook. Высокие зарплаты и возможности для карьерного роста делают страну привлекательной для разработчиков.',
      'Канада': 'Канада предлагает отличные условия для жизни и работы, а также разнообразные визовые программы для квалифицированных работников. Города, такие как Торонто и Ванкувер, активно развивают IT-сектор и стартапы.',
      'Германия': 'Германия, особенно Берлин, считается одним из европейских хабов для стартапов. Страна предлагает высокие зарплаты, хорошие условия труда и стабильную экономику. К тому же, здесь много международных компаний.',
      'Нидерланды': 'Нидерланды привлекают разработчиков своим открытым обществом и высоким уровнем английского языка. Амстердам стал важным центром для технологий, а также предлагает множество международных компаний и стартапов.',
    };

    country.forEach((k, v) {
      list.add(ListStructure(k, v));
    });
  }
}

class ItCountryApp extends StatelessWidget {
  const ItCountryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IT Country',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      home: const ItCountryHome(),
    );
  }
}

class ItCountryHome extends StatelessWidget {
  const ItCountryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: ListData.list.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountryDescription(countryName: ListData.list[index].key!),
                      ),
                    );
                  },
                  child: Text("${ListData.list[index].key}",),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CountryDescription extends StatefulWidget {
  const CountryDescription({super.key, required this.countryName});

  final String countryName;


  @override
  State<StatefulWidget> createState() => _CountryDescriptionState();

}

class _CountryDescriptionState extends State<CountryDescription> {

  @override
  Widget build(BuildContext context) {

    final country = ListData.list.firstWhere(
            (name) => name.key == widget.countryName
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.countryName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          "${country.values}"
        ),
      ),
      );
  }
}










