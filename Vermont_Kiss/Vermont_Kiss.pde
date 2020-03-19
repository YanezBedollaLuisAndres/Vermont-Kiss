import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import processing.sound.*;

Box2DProcessing mundo;
PantallaCarga c;
ArrayList <Caja> cajas;
Limite suelo;
Limite marco, marco2, marco3, marco4;
Limite pf, pf2, pf3, pf4, pf5, pf6;
Azul a1, a2, a3, a4, a5, a6;
Green g1;
SoundFile Alix;
PFont ink;
int p = 0;
boolean matar = false, nivel2 = false, EstasEnN2 = false;

void setup() {
  size(900, 500);
  c = new PantallaCarga();
  mundo = new Box2DProcessing(this);
  mundo.createWorld(); 

  mundo.listenForCollisions();

  Alix = new SoundFile(this, "Alix.wav");
  Alix.loop();

  //spawn
  //una = new Caja(850, 75, 20, 20);
  cajas = new ArrayList();
  cajas.add(new Caja(850, 75, 20, 20));

  suelo = new Limite(850, 125, 40, 20);
  //límites
  marco = new Limite(450, 10, 900, 50);
  marco2 = new Limite(10, 250, 50, 500);
  marco3 = new Limite(890, 250, 50, 500);
  marco4 = new Limite(450, 490, 900, 50);
  //plataformas
  pf = new Limite (450, 200, 40, 10);
  pf2 = new Limite (700, 150, 40, 10);
  pf3 = new Limite (300, 180, 50, 500);
  pf4 = new Limite (210, 350, 50, 550);
  pf5 = new Limite (112, 200, 100, 10);
  pf6 = new Limite (600, 350, 300, 10);
  //obstáculos
  a1 = new Azul (300, 200, 80, 100);
  a2 = new Azul (210, 375, 60, 150);
  a3 = new Azul (10, 375, 60, 150);
  a4 = new Azul (410, 350, 90, 10);
  a5 = new Azul (600, 425, 10, 80);
  a6 = new Azul (820, 250, 90, 10);
  //meta
  g1 = new Green (110, 460, 150, 10);
  ink=loadFont("InkFree-32.vlw");
  textFont(ink, 32);
}

void draw() {
  c.Cambio();
}
class PantallaCarga {

  PantallaCarga() {
  }

  void Cambio() {
    if (p == 0)
      pan1();

    if (p == 1)
      pan2();

    if (p == 2)
      pan3();

    if (p==3)
      pan4();
  }
  //----------------------------------------------------------------------------------------------------------------------------------------------------Nivel1
  void pan1() {

    background(252, 223, 255);
    textAlign(CENTER);
    textSize(42);
    fill(0, random(100, 150), 0);
    text("Vermont", 460, random(98, 100));
    text("Kiss", 555, random(124, 126));
    textSize(22);
    fill(255, 0, 0);
    textAlign(LEFT);
    fill(255, 0, 0);
    text("Este es Noam.", 680, 80);
    textAlign(CENTER);
    fill(random(200, 255), 0, 0);
    text("Es empujado violentamente con", 540, 230);
    textSize(random(20, 24));
    text("WASD.", 720, 230);
    textAlign(LEFT);
    textSize(26);
    fill(255, 0, 0);
    text("Ama el", 380, 300);
    fill(0, 150, 0);
    text("verde", 460, 300);
    fill(255, 0, 0);
    text(", odia el", 520, 300);
    fill(0, 0, 255);
    text("azul.", 605, 300);
    mundo.step();
    for (Caja a : cajas)
      a.display();

    suelo.display();
    marco.display();
    marco2.display();
    marco3.display();
    marco4.display();
    pf.display();
    pf2.display();
    pf3.display();
    pf4.display();
    pf5.display();
    pf6.display();
    a1.display();
    a2.display();
    a3.display();
    a4.display();
    a5.display();
    a6.display();
    g1.display();

    Matar();
    SiguienteNivel();
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------Nivel2
  void pan2() {
    background(223, 255, 223);
    textSize(30);
    fill(255, 0, 0);
    text("Hace todo tipo de cosas.", 500, 80);
    textSize(24);
    fill(255, 0, 0);
    text("En realidad no disfruta de nada.", 480, 200);
    text("Dios lo obliga a todo, no elige.", 480, 230);
    textSize(22);
    text("¿Crees poder elegir?", 420, 400);
    mundo.step();
    for (Caja a : cajas)
      a.display();


    marco.display();
    marco2.display();
    marco3.display();
    marco4.display();
    pf.display();
    pf2.display();
    pf3.display();
    pf4.display();
    pf5.display();
    pf6.display();
    a1.display();
    a2.display();
    a3.display();
    a4.display();
    a5.display();
    a6.display();
    g1.display();

    Matar();
    SiguienteNivel();
  }
  //------------------------------------------------------------------------------------------------------------------------------------------------------Nivel3(eterno retorno)
  void pan3() {
    background(223, 255, 254);
    textSize(26);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("Dios lo movía constantemente, él no quería moverse en lo absoluto.", 450, 100);
    text("Pero aún así, lo hiciste venir hasta aquí.", 450, 125);
    text("Tu presencia es la esencia de esos días, una oración que se repite, sin sentido.", 450, 150);
    text("Obligar a alguien a seguir haciendo algo que no disfruta es malo, ¿no?", 450, 175);
    text("Entonces Dios es malo. Tú eres malo ¿Eres malo?", 450, 200);
    text("¿Es malo ser malo? ¿Si alguien disfruta ser malo es malo?", 450, 225);
    text("No importa, el hecho es que lo olbigaste a moverse. ¿Por qué?", 450, 250);
    text("¿Por qué lo obligas a seguir adelante? No seguir jamás ha sido negativo.", 450, 300);
    textSize(24);
    fill(0, 0, 255);
    text("La última pregunta es... ¿Noam fue feliz todo este tiempo?", 450, 350);
    text("Sí (Y)", 450, 375);
    text("No (N)", 450, 400);

    marco.display();
    marco2.display();
    marco3.display();
    marco4.display();
  }
  //------------------------------------------------------------------------------------------------------------------------------------------------------Nivel4(fin)
  void pan4() {
    background(223, 255, 254);
    textSize(50);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("Dios, no vuelvas a abandonarlo.", 450, 250);
  }
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------Controles
void keyPressed() {

  if (key == 'a')
  {
    Vec2 wind = new Vec2(-40, 0);
    //una.applyForce(wind);
    for (Caja a : cajas)
      a.applyForce(wind);
  }

  if (key == 'w')
  {
    Vec2 wind = new Vec2(0, 60);
    //una.applyForce(wind);
    for (Caja a : cajas)
      a.applyForce(wind);
  }

  if (key == 's')
  {
    Vec2 wind = new Vec2(0, -60);
    //una.applyForce(wind);
    for (Caja a : cajas)
      a.applyForce(wind);
  }

  if (key == 'd')
  {
    Vec2 wind = new Vec2(40, 0);
    //una.applyForce(wind);
    for (Caja a : cajas)
      a.applyForce(wind);
  }

  if (key == 'y')
  {
    if (p == 2)
      exit();
  }

  if (key == 'n')
  {
    if (p == 2)
      p=3;
  }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------Colisiones
void beginContact(Contact cp) {

  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Azul.class && o2.getClass() == Caja.class) {
    matar = true;
  }

  if (o2.getClass() == Azul.class && o1.getClass() == Caja.class) {
    matar = true;
  }

  if (o1.getClass() == Green.class && o2.getClass() == Caja.class) {

    nivel2 =true;
  }

  if (o2.getClass() == Green.class && o1.getClass() == Caja.class) {

    if (EstasEnN2)
    {
      p = 2;
    }
    nivel2 =true;
  }
}
void endContact(Contact cp) {
}
//------------------------------------------------------------------------------------------------------------------------spawn
void Nacer(int x, int y, int w, int h) {
  cajas.add(new Caja(x, y, w, h));
}
//------------------------------------------------------------------------------------------------------------------------killer y respawn
void Matar() {
  if (matar) {
    if (p == 1) EstasEnN2 = true;
    for (Caja a : cajas)
      a.killBody();

    if (p == 0)//Respawn de primera pantalla
      Nacer(850, 75, 20, 20);

    if (p == 1)//Respawn de segunda pantalla
      Nacer(850, 400, 20, 20);

    matar = false;
  }
}
//--------------------------------------------------------------------------------------------------------------------------cambio de nivel
void SiguienteNivel() {
  if (nivel2)
    if (p == 0)
    {

      for (Caja a : cajas)
        a.killBody();

      Nacer(850, 400, 20, 20);
      matar = false;
      p = 1;

      suelo.killBody();
      pf.killBody();
      pf2.killBody();
      pf3.killBody();
      pf4.killBody();
      pf5.killBody();
      pf6.killBody();
      a1.killBody();
      a2.killBody();
      a3.killBody();
      a4.killBody();
      a5.killBody();
      a6.killBody();
      g1.killBody();

      pf = new Limite (450, 250, 40, 200);
      pf2 = new Limite (700, 350, 40, 200);
      pf3 = new Limite (350, 325, 40, 500);
      pf4 = new Limite (200, 200, 40, 450);
      pf5 = new Limite (325, 125, 100, 10);
      pf6 = new Limite (648, 125, 437, 10);
      //obstáculos
      a1 = new Azul (292, 200, 75, 10);
      a2 = new Azul (258, 250, 75, 10);
      a3 = new Azul (292, 300, 75, 10);
      a4 = new Azul (270, 340, 75, 10);
      a5 = new Azul (400, 250, 10, 385);
      a6 = new Azul (800, 255, 115, 10);
      //meta
      g1 = new Green (107, 40, 145, 10);
    }

  nivel2 = false;
}
