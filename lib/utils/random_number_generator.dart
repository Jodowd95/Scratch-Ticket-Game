import 'dart:math';

randomMoneyGenerator(){
  Random rnd = Random();
  print(rnd.toString());
  int min =0;
  int max = 10000;
  return min + rnd.nextInt(max -min);

}

randomScratchNumberGenerator(){
  Random rnd = Random();
  int min =1;
  int max = 20;
  return min +rnd.nextInt(max - min);
}