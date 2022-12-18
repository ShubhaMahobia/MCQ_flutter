import 'package:flutter/material.dart';
import 'package:mitt_arv_assignment/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xFF252c4a);
    Color secondary = const Color(0xFF117eeb);
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Congratulations",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Your score is :",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${widget.score}",
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 80,
                    fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Retry",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
