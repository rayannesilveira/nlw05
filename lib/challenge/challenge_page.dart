import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({Key? key, required this.questions,required this.title}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });
    super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length){
    pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.bounceIn);

    }
  }

  void onSelected(bool value){
    if(value){
      controller.correctAnswers++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    length: widget.questions.length,
                  ),
                ),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(question: e, onSelected: onSelected))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: EdgeInsets.only(bottom: 20),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ValueListenableBuilder(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                if (value != widget.questions.length-1)
                  Expanded(
                      child: NextButtonWidget.white(
                    label: "Pular",
                    onTap: nextPage,
                  )),
                  if (value == widget.questions.length-1)
                      SizedBox(width: 7),
                  if(value == widget.questions.length-1)
                     Expanded(
                          child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => ResultPage(title: widget.title, length: widget.questions.length, result: controller.correctAnswers,)));
                        },
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
