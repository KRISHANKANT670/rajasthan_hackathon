import processing.serial.*;

Serial myPort;


void setup() {
  size(600, 600);
  noStroke();
 myPort= new Serial(this,"COM27",9600);

   
  }


void draw() {
  textSize(20);
  textAlign(CENTER);
  text("KEYBOARD CONTROLS",175,5,250,200);
  
   textSize(16);
  textAlign(CENTER);
  
  
  String g1 ="grip on :A";
  String g2 ="grip off :S";
  String e1 ="wrist up :T";
  String e2="wrist down :Y";
  String e_1 ="elbow up :G";
  String e_2 ="elbow down :H";
  String a1 ="arm right :B";
  String a2 ="arm left :N";
  
  
  //grip
   fill(0,255,0);
  rect(200, 50, 70, 60);
  fill(50);
  text(g1,200, 50, 70, 80); 
  
  fill(255,40,20);
  rect(300, 50, 70, 60);
  fill(50);
  text(g2,300, 50, 70, 80); 
 
  
  //elbow
   fill(0,255,0);
  rect(200, 150, 70, 60);
  fill(50);
  text(e1,200, 150, 70, 80); 
  
   fill(255,40,20);
  rect(300, 150, 70, 60);
  fill(50);
  text(e2,300, 150, 70, 80); 
  
  //2nd elbow
  fill(0,255,0);
  rect(200, 250, 70, 60);
  fill(50);
  text(e_1,200, 250, 70, 80); 
  
   fill(255,40,20);
  rect(300, 250, 70, 60);
  fill(50);
  text(e_2,300, 250, 70, 80); 
  
  //arm
   fill(0,255,0);
  rect(200, 350, 70, 60);
  fill(50);
  text(a1,200, 350, 70, 80); 
  
   fill(255,40,20);
   rect(300, 350, 70, 60);
   fill(50);
  text(a2,300, 350, 70, 80); 
  
}
void keyPressed()
{
  switch(key)
  {
    case 'a': {myPort.write("a"); printKey();break;}
    case 's': {myPort.write("s");printKey();break;}
    case 't': {myPort.write("t");printKey();break;}
    case 'y': {myPort.write("y");printKey();break;}
    case 'g': {myPort.write("g") ;printKey();break;}
    case 'h': {myPort.write("h"); printKey();break;}
    case 'b': {myPort.write("b");printKey();break;}
    case 'n': {myPort.write("n");printKey();break;}
    
    default:keyReleased();
  }
  if (keyPressed==false)
  {
    myPort.write("\0");
  }
}

void keyReleased(){
  
  myPort.write(" "); delay(10); 
   printKeyR();
}

void printKey()
{
  println( millis()  );
  println(key);
}

void printKeyR()
{
    println("released"+key);
    
}
