import 'main.dart';
import 'helper.dart';
import 'dart:math';
import 'impossiblemod.dart';

class MiniMaxAI {
  //var scores = {X: 10, O: -10, tie: 0};
  bestMove(board) {
    // AI to make its turn
    int bestScore = -999;
    var move;
    int index, value;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (board[i][j] == "") {
          board[i][j] = 'X';
          var score = minimax(board, 0, false, board);

          board[i][j] = '';
          if (score > bestScore) {
            bestScore = score;
            index = i;
            value = j;
          }
        }
      }
    }
    board[index][value] = 'X';
    print('$index , $value');
    return index * 3 + value;
    // print(move.i + move.j);
    //currentPlayer = 'O';
  }

  checkwhowinforai(array) {
    String winer = '';
    String p1 = array[0][0],
        p2 = array[0][1],
        p3 = array[0][2],
        p4 = array[1][0],
        p5 = array[1][1],
        p6 = array[1][2],
        p7 = array[2][0],
        p8 = array[2][1],
        p9 = array[2][2];
    if ((p1 == 'X' && p2 == 'X' && p3 == 'X') ||
        (p1 == 'O' && p2 == 'O' && p3 == 'O')) {
      if ((p1 == 'X' && p2 == 'X' && p3 == 'X')) {
        winer = 'X';
      } else {
        winer = 'O';
      }
    } else if ((p1 == 'X' && p4 == 'X' && p7 == 'X') ||
        (p1 == 'O' && p4 == 'O' && p7 == 'O')) {
      if ((p1 == 'X' && p4 == 'X' && p7 == 'X')) {
        winer = 'X';
      } else {
//        print('O wins');
        winer = 'O';
      }
    } else if ((p4 == 'X' && p5 == 'X' && p6 == 'X') ||
        (p4 == 'O' && p5 == 'O' && p6 == 'O')) {
      if ((p4 == 'X' && p5 == 'X' && p6 == 'X')) {
        //    print('X wins');
        winer = 'X';
      } else {
        //      print('O wins');
        winer = 'O';
      }
    } else if ((p7 == 'X' && p8 == 'X' && p9 == 'X') ||
        (p7 == 'O' && p8 == 'O' && p9 == 'O')) {
      if ((p7 == 'X' && p8 == 'X' && p9 == 'X')) {
        //print('X wins');
        winer = 'X';
      } else {
        //  print("O wins");
        winer = 'O';
      }
    } else if ((p2 == 'X' && p5 == 'X' && p8 == 'X') ||
        (p2 == 'O' && p5 == 'O' && p8 == 'O')) {
      if ((p2 == 'X' && p5 == 'X' && p8 == 'X')) {
        // print('X wins');
        winer = 'X';
      } else {
        //print("O wins");
        winer = 'O';
      }
    } else if ((p3 == 'X' && p6 == 'X' && p9 == 'X') ||
        (p3 == 'O' && p6 == 'O' && p9 == 'O')) {
      if ((p3 == 'X' && p6 == 'X' && p9 == 'X')) {
        //print("x wins");
        winer = 'X';
      } else {
        // print("O wins");
        winer = 'O';
      }
    } else if ((p1 == 'X' && p5 == 'X' && p9 == 'X') ||
        (p1 == 'O' && p5 == 'O' && p9 == 'O')) {
      if ((p1 == 'X' && p5 == 'X' && p9 == 'X')) {
        //print('X wins');
        winer = 'X';
      } else {
        //print('O wins');
        winer = 'O';
      }
    } else if ((p3 == 'X' && p5 == 'X' && p7 == 'X') ||
        (p3 == 'O' && p5 == 'O' && p7 == 'O')) {
      if ((p3 == 'X' && p5 == 'X' && p7 == 'X')) {
        //print("X wins");
        winer = 'X';
      } else {
        //print("O wins");
        winer = 'O';
      }
    }
    int openSpots = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (array[i][j] == '') {
          openSpots++;
        }
      }
    }
    if (winer == "" && openSpots == 0) {
      return 'tie';
    } else {
      return winer;
    }
  }

  var scores = {'X': 10, 'O': -10, 'tie': 0};

  minimax(board, depth, isMaximizing, checkboard) {
    var result = checkwhowinforai(checkboard);
    if (result == 'tie') {
      return 0;
    }
    if (result != "") {
      return scores[result];
    }

    if (isMaximizing) {
      int bestScore = -999;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          // Is the spot available?
          if (board[i][j] == '') {
            board[i][j] = 'X';
            int score = minimax(board, depth + 1, false, checkboard);
            board[i][j] = '';
            bestScore = max(score, bestScore);
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 999;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          // Is the spot available?
          if (board[i][j] == '') {
            board[i][j] = 'O';
            var score = minimax(board, depth + 1, true, checkboard);
            board[i][j] = '';
            bestScore = min(score, bestScore);
          }
        }
      }
      return bestScore;
    }
  }
}
