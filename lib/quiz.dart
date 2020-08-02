import 'question.dart';

class Quiz {
  List<Question> _questions = [
    Question( q: "Prince Harry is taller than Prince William", a: true ),
    Question(q: "The star sign Aquarius is represented by a tiger", a: true),
    Question(q: "Meryl Streep has won two Academy Awards", a: false),
    Question(q: "Marrakesh is the capital of Morocco", a: false),
    Question(q: "Idina Menzel sings 'let it go' 20 times in 'Let It Go' from Frozen", a: true),
    Question(q: "Waterloo has the greatest number of tube platforms in London", a: true),
    Question(q: "M&M stands for Mars and Moordale", a: false),
    Question(q: "Gin is typically included in a Long Island Iced Tea", a: false),
    Question(q: "The unicorn is the national animal of Scotland", a: true),
    Question(q: "There are two parts of the body that can't heal themselves", a: true)
  ];

  String getQuestion( int index ){
    return _questions[index].question;
  }

  bool getAnswer(int index){
    return _questions[index].answer;
  }

  int questionsCount(){
    return _questions.length;
  }
}