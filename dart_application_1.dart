import 'dart:io';

void main() {
  int money = 1000;
  int health = 50;
  int hasKey = 0; 

  print("--- DOBRO POZHALOVAT V MINI-MARKET ---");
  print("U vas est $money monet i $health zdorovya.");
  print("1. Kupit aptechku (cena: 300 monet, dast +30 zdorovya)");
  print("2. Kupit klyuch ot tainika (cena: 500 monet)");
  print("3. Popytatsya ukrast tovar");
  print("Vyberite deistvie (1, 2 ili 3):");

  String choice = stdin.readLineSync() ?? "";
  int? action = int.tryParse(choice);

  if (action == 1) {
    if (money >= 300) {
      money = money - 300;
      health = health + 30;
      print("Vy kupili aptechku! Zdorovye: $health, Monety: $money");
    } else {
      print("U vas nedostatochno monet!");
    }
  } 
  else if (action == 2) {
    if (money >= 500) {
      money = money - 500;
      hasKey = 1;
      print("Vy kupili klyuch! Monety: $money");
      
      print("Vy vidite zakrytuyu dver. Poprobovat otkryt? (1 - da, 0 - net)");
      String doorChoice = stdin.readLineSync() ?? "";
      int? doorAction = int.tryParse(doorChoice);

      if (doorAction == 1) {
        if (hasKey == 1 && health >= 40) {
          money = money + 1000;
          print("Uspeh! V tainike bylo 1000 monet! Monety: $money");
        } else {
          print("Dver ne otkrylas ili u vas malo zdorovya.");
        }
      } else {
        print("Vy ushli ot dveri.");
      }

    } else {
      print("U vas nedostatochno monet!");
    }
  } 
  else if (action == 3) {
    if (health > 60) {
      money = money + 200;
      print("Krazha udalas! Vy poluchili tovar na 200 monet. Monety: $money");
    } else {
      health = health - 40;
      print("Vas poymali i pobili! Zdorovye umenshilos. Zdorovye: $health");
    }
  } 
  else {
    print("Nevernyi vvod. Vy nichego ne vybrali.");
  }
}