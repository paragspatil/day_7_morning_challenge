import 'dart:io';
// Last time you wrote PrintBoard function which takes in the board and prints it to the console
// Today you have to take user input and populate the Board at required location

// Challenge 1
// Take user input like A1, B3, C2 etc. and put 'X' or 'O' in required places turn by turn

//  A   B   C
// 1   |   |
//  ---+---+---
// 2   |   |
//  ---+---+---
// 3   |   |

// X's move:
// A2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  X |   |
//    ---+---+---
//  3    |   |

//  0's move:
//  B2

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    |   |

//  X's move:
//  B3

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    | X |

//  0's move:
//  A2

//  A   B   C
// 1    |   |
//   ---+---+---
// 2  0 | 0 |
//   ---+---+---
// 3    | X |

//  X's move:
//  B2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  0 | X |
//    ---+---+---
//  3    | X |
//  0's move:

// HINT: to get string character you can use [], example String name ='Arnav'; name[0] gives 'A'



// Challenge 2
// Validate the move
// In case if there is already an entry on board print invalid move

main() {
  var boardSize = 3;
  List<List<String>> board =
  List.generate(boardSize, (_) => List.filled(boardSize, ' '));
  bool flag = true;
  String currentPlayer = 'X';
  while (flag) {
    print('$currentPlayer\'s move');
    String userChoice = stdin.readLineSync();
    int row = getRow(userChoice);
    int column = getColumn(userChoice);
    if (!validate(row, column, board)) {
      print('Invalid Move');
      continue;
    }
    board[row][column] = currentPlayer;
    printBoard(board);
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
  }
  printBoard(board);
}

bool validate(int row, int column, List<List<String>> board) {
  return board[row][column] == ' ';
}
int getColumn(String userInput) => ['A', 'B', 'C'].indexOf(userInput[0]);

int getRow(String userInput) => ['1', '2', '3'].indexOf(userInput[1]);



//void enter(List l){
//  int f = 0;
//  while(f!=9){
//
//    if(f%2==0){
//      print('X player please enter your choice');
//      var m =  stdin.readLineSync();
//      if(m=='A1'){
//        l[0][0] = 'X';
//      }
//      else if(m=='A2'){
//        l[1][0] = 'X';
//      }
//      else if(m=='A3'){
//        l[2][0] = 'X';
//      }
//      else if(m=='B1'){
//        l[0][1] = 'X';
//      }
//      else if(m=='B2'){
//        l[1][1] = 'X';
//      }
//      else if(m=='B3'){
//        l[2][1] = 'X';
//      }
//      else if(m=='C1'){
//        l[0][2] = 'X';
//      }
//      else if(m=='C2'){
//        l[1][2] = 'X';
//      }
//      else if(m=='C3'){
//        l[2][2] = 'X';
//      }
//      f = f +1;
//      printBoard(l);
//    }
//    else{
//      print('O player please enter your choice');
//      var m =  stdin.readLineSync();
//      if(m=='A1'){
//        l[0][0] = 'O';
//      }
//      else if(m=='A2'){
//        l[1][0] = 'O';
//      }
//      else if(m=='A3'){
//        l[1][0] = 'O';
//      }
//      else if(m=='B1'){
//        l[0][1] = 'O';
//      }
//      else if(m=='B2'){
//        l[1][1] = 'O';
//      }
//      else if(m=='B3'){
//        l[2][1] = 'O';
//      }
//      else if(m=='C1'){
//        l[0][2] = 'O';
//      }
//      else if(m=='C2'){
//        l[1][2] = 'O';
//      }
//      else if(m=='C3'){
//        l[2][2] = 'O';
//      }
//      f = f +1;
//      printBoard(l);
//    }
//
//  }
//
//}


void printBoard(List<List<String>> board) {
  print('   1   2   3 ');
  List<String> rows = board.map(rowToString).toList();
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}
