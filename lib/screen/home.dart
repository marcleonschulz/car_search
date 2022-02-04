import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_search/provider/add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarFetch(),
      child: Column(children: const [
        Card(),
        InputField(),
      ],)
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
      if (car.error != ""){return Text(car.error);}else{
      return Text("$handel_name, $hersteller_name");}
  }
}

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();

}

class _InputFieldState extends State<InputField> {
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
    return Column(children: [
      ElevatedButton(onPressed: () => Provider.of<CarFetch>(context, listen: false).fetcher(_hsn_controller.text, _tsn_controller.text), child: const Text("HIT ME")),
      SizedBox(
        width: 350,
        child: TextField(
        controller: _hsn_controller,
        onSubmitted: (String value) => Provider.of<CarFetch>(context, listen: false).fetcher(value, _tsn_controller.text),
      ),),
      SizedBox(
        width: 350,
        child: TextField(
          controller: _tsn_controller,
          onSubmitted: (String value) => Provider.of<CarFetch>(context, listen: false).fetcher(_hsn_controller.text, value),
        ),),
    ],);
  }
}
