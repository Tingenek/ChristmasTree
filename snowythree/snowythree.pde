/*
// Christmas Tree with @cheerlights
// Version 2. Much Better Snow! & Stuff in Classes.
// Tingenek@gmail.com
// Backgroud courtesy of http://www.zastavki.com/eng/Drawn_wallpapers/wallpaper-17315-29.htm
 */
 
 //MQTT
 import com.ibm.mqtt.MqttSimpleCallback;
  private MQTTLib m;
  private String MQTT_BROKER ="tcp://test.mosquitto.org:1883";
  private String CLIENT_ID = "Tingenek";
  private int[] QOS = {0};
  private String[] TOPICS = { "cheerlights"};
  private boolean CLEAN_START = true;
  private boolean RETAINED = true;
  private short KEEP_ALIVE = 30;

//BackGround
PImage bg;
String imageName = "snowtree.jpg"; 

//Snowflakes
SnowFlake[] sn;
int quantity = 300;
//Baubles
Baubles baubles;

void setup() {
  size(640,480);
  m = new MQTTLib(MQTT_BROKER, new MessageHandler());
  m.connect(CLIENT_ID, CLEAN_START, KEEP_ALIVE);
  m.subscribe(TOPICS, QOS);
  bg = loadImage(imageName);
  sn = new SnowFlake[quantity];
  baubles = new Baubles();
  for(int i = 0; i < quantity; i++) {
   sn[i] = new SnowFlake();
  }
  frameRate(30);
  noStroke();
  smooth(); 
}

void draw() {
  background(bg);
  baubles.update();
  
  for(int i = 0; i < quantity; i++) {
  sn[i].update();
  }
  
}


  private class MessageHandler implements MqttSimpleCallback {

    public void connectionLost() throws Exception {
                System.out.println( "Connection has been lost." );
                //do something here
            }

    public void publishArrived( String topicName, byte[] payload, int QoS, boolean retained ){
        String s = new String(payload);
        //Display the string
        println("New colour is " + s);
       baubles.change(s);
            }   
         
         }


