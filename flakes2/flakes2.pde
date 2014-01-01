//MQTT
 import com.ibm.mqtt.MqttSimpleCallback;
  private MQTTLib m;
  private String MQTT_BROKER ="tcp://test.mosquitto.org:1883";
  private String CLIENT_ID = "Tingenek23";
  private int[] QOS = {0};
  private String[] TOPICS = { "cheerlights"};
  private boolean CLEAN_START = true;
  private boolean RETAINED = false;
  private short KEEP_ALIVE = 30;

PImage bg;
Baubles baubles;
SnowFlakes snowflakes;

void setup() {
  size(640,480);
  bg = loadImage("snowtree.jpg");
  m = new MQTTLib(MQTT_BROKER, new MessageHandler());
  m.connect(CLIENT_ID, CLEAN_START, KEEP_ALIVE);
  m.subscribe(TOPICS, QOS);
  frameRate(30);
  noStroke();
  smooth(); 
  baubles = new Baubles();
  snowflakes = new SnowFlakes(300);
}

void draw() {
  background(bg);
  baubles.show();
  snowflakes.fall();
}

void mousePressed() {
 baubles.add(mouseX,mouseY);
 println(mouseX+","+mouseY);
}

private class MessageHandler implements MqttSimpleCallback {

    public void connectionLost() throws Exception {
                System.out.println( "Connection has been lost." );
                //do something here
                  m.connect(CLIENT_ID, CLEAN_START, KEEP_ALIVE);
                  m.subscribe(TOPICS, QOS);
            }

    public void publishArrived( String topicName, byte[] payload, int QoS, boolean retained ){
        String s = new String(payload);
        //Display the string
        println("New colour is " + s);
       baubles.change(s);
            }   
         
         }




