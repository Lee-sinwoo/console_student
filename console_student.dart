import 'dart:io';

class Student {
  String name;
  int score;

  Student(this.name, this.score);
}

void main() {
  List<Student> students = [];
  bool isRunning = true;

  print('학생 성적 관리 프로그램');
  print('1.학생추가');
  print('2.학생 목록 출력');
  print('3.평균 점수 계산');
  print('4.종료');

  while (isRunning) {
    stdout.write('메뉴를 선택하세요:');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('학생 이름을 입력하세요:');
        var name = stdin.readLineSync();
        stdout.write('학생 점수를 입력하세요:');
        var scoreString = stdin.readLineSync();

        if (name != null && scoreString != null) {
          //name,scoreString이 null이 아니면 = 입력되면
          try {
            var score = int.parse(scoreString); //string으로 입력된 점수를 int로
            students.add(Student(name, score));
            print('$name학생이 추가되었습니다');
          } catch (e) {
            print('정확히 입력해주십시오');
          }
        }
        break;

      case '2':
        stdout.write('학생목록:');
        for (int i = 0; i < students.length; i++) {
          print('${i + 1}.${students[i].name}-${students[i].score}점');
        }
        break;

      case '3':
        double averageScore = 0; //초기화
        if (students.isNotEmpty) {
          int totalScore = 0; //초기화
          for (var student in students) {
            totalScore += student.score;
          }
          averageScore = totalScore / students.length;
        }
        print('평균점수: ${averageScore}점');
        break;

      case '4':
        print('프로그램을 종료합니다.');
        isRunning = false;
        break;

      default:
        print('다시입력');
    }
  }
}
