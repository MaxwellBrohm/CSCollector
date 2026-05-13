// CompSci Collector
// press SPACE to roll
// press C to clear

ArrayList<Classmate> inventory = new ArrayList<Classmate>();

PImage[] faces = new PImage[11];
PImage mrMayDay;

void setup() {
  size(900, 600);

  faces[0] = loadImage("tafa.png");
  faces[1] = loadImage("shane.png");
  faces[2] = loadImage("Raj.jpg");
  faces[3] = loadImage("neel.PNG");
  faces[4] = loadImage("nate.png");
  faces[5] = loadImage("max.png");
  faces[6] = loadImage("mano.png");
  faces[7] = loadImage("chris.JPG");
  faces[8] = loadImage("ansh.PNG");
  faces[9] = loadImage("andrew.JPG");
  faces[10] = loadImage("Noah.jpg");

  mrMayDay = loadImage("MrMayday.jpg");
}

void draw() {
  background(40, 110, 90);

  fill(255);
  textSize(28);
  text("CompSci Collector", 30, 35);

  textSize(16);
  text("Press SPACE to roll", 30, 70);
  text("Press C to clear", 30, 95);
  text("Collected: " + inventory.size(), 30, 120);
  text("Total Value: $" + getTotalValue(), 30, 145);

  showInventory();
}

void keyPressed() {
  if (key == ' ') rollClassmate();
  if (key == 'c' || key == 'C') inventory.clear();
}

void rollClassmate() {
  // secret 0.001%
  if (random(1) < 0.00001) {
    inventory.add(new RareClassmate("Mr Mayday", mrMayDay, "MYTHIC", 10000));
    return;
  }

  float roll = random(1);

  // legendary 5%
  if (roll < 0.05) {
    int r = int(random(4));

    if (r == 0) inventory.add(new RareClassmate("Noah", faces[10], "Legendary", 100));
    if (r == 1) inventory.add(new RareClassmate("Chris", faces[7], "Legendary", 100));
    if (r == 2) inventory.add(new RareClassmate("Max", faces[5], "Legendary", 100));
    if (r == 3) inventory.add(new RareClassmate("Tafa", faces[0], "Legendary", 100));

    return;
  }

  // rare 20%
  if (roll < 0.25) {
    int r = int(random(4));

    if (r == 0) inventory.add(new RareClassmate("Shane", faces[1], "Rare", 25));
    if (r == 1) inventory.add(new RareClassmate("Neel", faces[3], "Rare", 25));
    if (r == 2) inventory.add(new RareClassmate("Andrew", faces[9], "Rare", 25));
    if (r == 3) inventory.add(new RareClassmate("Ansh", faces[8], "Rare", 25));

    return;
  }

  // common 75%
  int r = int(random(3));

  if (r == 0) inventory.add(new Classmate("Raj", faces[2], "Common", 10));
  if (r == 1) inventory.add(new Classmate("Nate", faces[4], "Common", 10));
  if (r == 2) inventory.add(new Classmate("Mano", faces[6], "Common", 10));
}

int getTotalValue() {
  int total = 0;

  for (Classmate c : inventory) {
    total += c.value;
  }

  return total;
}

void showInventory() {
  int x = 40;
  int y = 190;

  for (int i = 0; i < inventory.size(); i++) {
    Classmate c = inventory.get(i);
    c.display(x, y);

    x += 110;

    if (x > 780) {
      x = 40;
      y += 130;
    }
  }
}

class Classmate {
  String name;
  PImage face;
  String rarity;
  int value;

  Classmate(String n, PImage f, String r, int v) {
    name = n;
    face = f;
    rarity = r;
    value = v;
  }

  void display(int x, int y) {
    fill(255);
    rect(x, y, 90, 90);

    image(face, x + 5, y + 5, 80, 80);

    fill(255);
    textSize(13);
    text(name, x, y + 95);
    text(rarity + " $" + value, x, y + 112);
  }
}

class RareClassmate extends Classmate {
  RareClassmate(String n, PImage f, String r, int v) {
    super(n, f, r, v);
  }

  void display(int x, int y) {
    fill(255, 220, 0);
    rect(x, y, 90, 90);

    image(face, x + 5, y + 5, 80, 80);

    fill(255);
    textSize(13);
    text(name, x, y + 95);
    text(rarity + " $" + value, x, y + 112);
  }
}

class GameInfo {
  String title = "CompSci Collector";
}
