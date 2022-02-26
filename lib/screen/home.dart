import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_search/shared/provider/add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("carSearch")),
        body: ChangeNotifierProvider(
            create: (_) => CarFetch(),
            child: Column(
              children: const [
                InputField(),
                Card(),
              ],
            )));
  }
}

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      width: 308,
      height: 100,
      child: const InputElements(),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var car = context.watch<CarFetch>().cars;
    String handel_name = car.handel_name;
    String hersteller_name = car.hersteller_name;
    if (car.error != "") {
      return Text(car.error);
    } else if (car.hersteller_name != "" && car.handel_name != "") {
      return Text(
          "Handelsname: $handel_name\nHerstellername: $hersteller_name");
    } else if (car.hersteller_name != "") {
      return Text("Herstellername: $hersteller_name");
    } else {
      return Text("Nothing here");
    }
  }
}

class InputElements extends StatefulWidget {
  const InputElements({Key? key}) : super(key: key);

  @override
  _InputElementsState createState() => _InputElementsState();
}

class _InputElementsState extends State<InputElements> {
  late TextEditingController _hsn_controller;
  late TextEditingController _tsn_controller;

  @override
  void initState() {
    super.initState();
    _hsn_controller = TextEditingController();
    _tsn_controller = TextEditingController();
  }

  @override
  void dispose() {
    _hsn_controller.dispose();
    _tsn_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: TextField(
            controller: _hsn_controller,
            decoration: InputDecoration(hintText: "HSN"),
            onSubmitted: (String value) =>
                Provider.of<CarFetch>(context, listen: false)
                    .fetcher(value, _tsn_controller.text),
          ),
        ),
        Container(
          width: 100,
          child: TextField(
            controller: _tsn_controller,
            decoration: InputDecoration(hintText: "TSN"),
            onSubmitted: (String value) =>
                Provider.of<CarFetch>(context, listen: false)
                    .fetcher(_hsn_controller.text, value),
          ),
        ),
        ElevatedButton(
            onPressed: () => Provider.of<CarFetch>(context, listen: false)
                .fetcher(_hsn_controller.text, _tsn_controller.text),
            child: const Text("Suche")),
      ],
    );
  }
}
