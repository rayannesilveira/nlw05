import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';

class HomeController{
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser(){
    user = UserModel(
      name: "Rayanne Silveira", 
      photoUrl: "https://avatars.githubusercontent.com/u/11272659?v=4", 
      );
  }

  void getQuizzes(){
    quizzes = [
      QuizModel(
        title: "NLW 5 Flutter", 
        questions: 
        [
          QuestionModel(
          title: "Está curtindo o flutter?", 
          answers: [
            AnswerModel(title: "Estou curtindo."),
            AnswerModel(title: "Estou amando."),
            AnswerModel(title: "Estou achando top."),
            AnswerModel(title: "Muito show de bola.", isRight: true)
          ])
          ], 
          imagem: AppImages.blocks,
          level: Level.facil
          )
    ];
  }
  
}