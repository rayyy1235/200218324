class QuizBrain {
  int _questionNumber = 0;

  List<Map<String, dynamic>> _questionBank = [
    {
      'question': 'What is the capital of France?',
      'A': 'Paris',
      'B': 'Berlin',
      'C': 'London',
      'D': 'Madrid',
      'answer': 'A',
    },
    {
      'question': 'Who is CEO of Tesla?',
      'A': 'Bill Gates',
      'B': 'Steve Jobs',
      'C': 'Elon Musk',
      'D': 'Tony Stark',
      'answer': 'C',
    },
    {
      'question': 'The iPhone was created by which company?',
      'A': 'Apple',
      'B': 'Intel',
      'C': 'Amazon',
      'D': 'Microsoft',
      'answer': 'A',
    },
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber]['question'];
  }

  String getChoiceA() {
    return _questionBank[_questionNumber]['A'];
  }

  String getChoiceB() {
    return _questionBank[_questionNumber]['B'];
  }

  String getChoiceC() {
    return _questionBank[_questionNumber]['C'];
  }

  String getChoiceD() {
    return _questionBank[_questionNumber]['D'];
  }

  String getQuestionAnswer() {
    return _questionBank[_questionNumber]['answer'];
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
