import 'package:flutter/material.dart';
import 'package:load_switch/load_switch.dart';
import 'package:torch_controller/torch_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool value = false;
  bool thumbStatus = true;
  Future<bool> _getFuture() async {
    value = !value;
    return value;
  }

  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c3333),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Torch',
          style: TextStyle(
              color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff2c3333),
      ),
      body: SafeArea(
        child: Center(
          child: Center(
            child: LoadSwitch(
              value: value,
              isActive: thumbStatus,
              future: _getFuture,
              curveIn: Curves.easeInBack,
              curveOut: Curves.easeOutBack,
              animationDuration: const Duration(milliseconds: 750),
              switchDecoration: (value, isActive) => BoxDecoration(
                color: isActive
                    ? value
                    ? Colors.white
                    : Colors.white
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: isActive
                        ? value
                        ? Colors.redAccent.withOpacity(0.8)
                        : Colors.grey.withOpacity(0.8)
                        : Colors.grey,
                    spreadRadius: 35,
                    blurRadius: 50,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              spinColor: (value) => value
                  ? const Color.fromARGB(255, 41, 232, 31)
                  : const Color.fromARGB(255, 255, 77, 77),
              spinStrokeWidth: 3,
              thumbDecoration: (value, isActive) => BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: isActive
                        ? value
                        ? Colors.redAccent.withOpacity(0.8)
                        : Colors.grey.withOpacity(0.8)
                        : Colors.grey,
                    spreadRadius: 35,
                    blurRadius: 50,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              onChange: (v) {
                try {
                  controller.toggle();
                  value = v;
                } catch (e) {
                  print(e);
                }
              },
              onTap: (v) {},
            ),
          ),
        ),
      ),
    );
  }
}
