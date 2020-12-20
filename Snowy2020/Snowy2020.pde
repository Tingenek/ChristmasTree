import mqtt.*;

MQTTClient client;

//BackGround
PImage bg;
String imageName = "snowtree.jpg"; 
//HashMap hm = new HashMap();
color c = color(220, 20, 60);

private String MQTT_BROKER ="tcp://mqtt.cheerlights.com:1883";
private String CLIENT_ID = "Tingenek" + random(255);
private int[] QOS = {0};
private String TOPIC = "cheerlights";
private boolean CLEAN_START = true;
//private boolean RETAINED = false;
private short KEEP_ALIVE = 30;

//Snowflakes
SnowFlake[] sn;
int quantity = 300;
//Baubles
Baubles baubles;

void setup() {
  //size(492,677);
  size(640,480);
  bg = loadImage(imageName);
  client = new MQTTClient(this);
  client.connect(MQTT_BROKER, CLIENT_ID,CLEAN_START);
  client.subscribe(TOPIC);
  sn = new SnowFlake[quantity];
   for(int i = 0; i < quantity; i++) {
   sn[i] = new SnowFlake();
  }
  baubles = new Baubles();
  frameRate(30);
  noStroke();
  smooth(); 
}

void draw() {
  background(bg);

//   if (mousePressed == true) {
//   println("x=" + mouseX + " y=" + mouseY);
//  }
//  fill(c); 
//  ellipse(202,264, 10, 10);
//  ellipse(317,282,10,10);
//  fill(255);
  baubles.update();
 
  for(int i = 0; i < quantity; i++) {
  sn[i].update();
  }
}

void messageReceived(String topic, byte[] payload) {
  String s = new String(payload);
  println("new message: " + topic + " - " + s);
 // c = (Integer) hm.get(s);
  baubles.change(s);
}

void connectionLost() {
  println("connection lost. reconnectiong in 3s");
  delay(3000);
    try {
     client.connect(MQTT_BROKER, "Tingenek" + random(255),CLEAN_START);
     client.subscribe(TOPIC);    
  } catch (Exception e) {
    println("Can't reconnect to broker");
  }    
}
