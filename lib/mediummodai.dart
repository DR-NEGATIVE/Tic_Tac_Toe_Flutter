class mediumai {
  move(board) {
    int s;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          s = i * 3 + j;
          int k = check(board, 'X');
          if (k != -1) {
            return k;
          }
          int m = check(board, 'O');

          if (m != -1) {
            return m;
          }
          return s;
        }
      }
    }
    // return s;
  }

  check(board, forwho) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          board[i][j] = forwho;
          String f = checkwhowinforai(board);
          if (f == forwho) {
            print("$forwho $f");
            print(i * 3 + j);
            return i * 3 + j;
          }
          board[i][j] = "";
        }
      }
    }
    return -1;
  }

  checkwhowinforai(array) {
    String winer = ''; // iknow winner spelling isn't correct XD
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
}
