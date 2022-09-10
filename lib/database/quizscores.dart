List<int> score = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
List<int> a = [];
void setscore(int index, int score2) {
  score[index] = score2;
}

void submitscore() {
  a = [];
  int u = 0, c = 0, n = 0;
  for (int i = 0; i < 10; i++) {
    if (score[i] == 0) {
      u++;
    } else if (score[i] == 1) {
      c++;
    } else {
      n++;
    }
  }
  a.add(u);
  a.add(c);
  a.add(n);
  print(a);
}
