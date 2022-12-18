import 'package:flutter/material.dart';
import 'package:mitt_arv_assignment/data/question_list.dart';
import 'package:mitt_arv_assignment/screens/initial_screen.dart';
import 'package:mitt_arv_assignment/screens/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color primaryColor = const Color(0xFF252c4a);
  Color secondary = const Color(0xFF117eeb);
  PageController? _pageController = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color wrongAnswer = Colors.red;
  Color buttonColor = const Color(0xFF117eeb);
  int _score = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController!,
            itemCount: question.length,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/${question.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 8.0,
                    thickness: 1.0,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    question[index].question!,
                    style: const TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  for (int i = 0; i < question[index].answers!.length; i++)
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: isPressed
                            ? (question[index]
                                    .answers!
                                    .entries
                                    .toList()[i]
                                    .value)
                                ? isTrue
                                : wrongAnswer
                            : Colors.white70,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 18),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (question[index]
                                    .answers!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  _score = _score + 10;
                                } else {
                                  setState(() {
                                    buttonColor = wrongAnswer;
                                  });
                                }
                              },
                        child: Text(
                          question[index].answers!.keys.toList()[i],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == question.length
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(_score),
                                      ),
                                    );
                                  }
                                : () {
                                    _pageController!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOutCubicEmphasized);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        child: Container(
                          child: Text(
                            index + 1 == question.length
                                ? "Result"
                                : "Next Question",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
