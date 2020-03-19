class Azul {

  float w;
  float h;
  Body b;

  Azul(float x_, float y_, float w_, float h_) {
    w = w_;
    h = h_;
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_, y_);
    Vec2 posicionEnEscalaBox2d = mundo.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnEscalaBox2d);

    bd.type = BodyType.STATIC;//dynamic, static / kinematic

    b = mundo.createBody(bd);
    b.setLinearVelocity(new Vec2(0, 0));
    b.setAngularVelocity(0);

    // Forma
    PolygonShape ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(w_);
    float alto = mundo.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/2, alto/2);

    //propiedades

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // fricción, restitución, densidad
    fd.friction = 0.1;
    fd.restitution = 0;
    fd.density = 0.1;

    b.createFixture(fd);
    b.setUserData(this);
  }

  void killBody() {
      mundo.destroyBody(b);
    }

  void applyForce(Vec2 force) {
    Vec2 pos = b.getWorldCenter();
    b.applyForce(force, pos);
  }

  void display() {
    Vec2 posicion = mundo.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
    translate(posicion.x, posicion.y);
    rotate(-angulo);
    rectMode(CENTER);
    noStroke();
    fill(0, 0, 255);
    rect(0, 0, w, h);
    popMatrix();
  }
  }
