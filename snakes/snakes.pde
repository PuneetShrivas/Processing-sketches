



int len =1,size =23, rad =5;
float speed =1;
int score =0 ;  
int dir =90; 
int[] locX = new int[500];
int[] locY = new int[500];
int appleX=(round(random(20))+1)*25;
int appleY=(round(random(20))+1)*25;
int i;
int time=0;
boolean redo;
PImage bg;
void setup()
{
  size(800, 800);
  restart();  
  bg = loadImage("grass3.jpeg");
  background(bg);
}

void draw()
{
  
  time+=1;
  fill(122,122,0);
  stroke(0);
  rect(appleX,appleY,20,20);
  if(time%10==0)
  {
    move();
    display();
  }
}
void move()
{
  for(int i=len;i>0;i--)
  {
    if (i!=1)
    {
      locX[i]=locX[i-1];
      locY[i]=locY[i-1];
    }
    else
    {
      switch(dir)
      {
        case 0 : locX[1]+= 25; break;
        case 90 : locY[1]-= 25; break;
        case 180 : locX[1]-= 25; break;
        case 270 : locY[1]+= 25; break;
      }
    }
  }
}
void display()
{  
  if (locX[1]==appleX && locY[1]==appleY)
  {
    //grow and spawn the apple somewhere away from the snake
    //(currently some of the code below might not be working, but the game still works.)
    len+=round(random(3)+1);
    redo=true;
    while(redo)
    {
      appleX=(round(random(20))+1)*25;
      appleY=(round(random(20))+1)*25;
      for(int i=1;i<len;i++)
      {
        
        if (appleX==locX[i] && appleY==locY[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=1000;
        }
      }
    }
  }
 //strokeWeight(2);
 noStroke();
  fill(255,0,0);
  rect(locX[1],locY[1],size,size,rad);
  noStroke();
  fill(43,203,8);
  rect(locX[len],locY[len],size,size,rad);
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP && dir!=270    )
    {dir=90;}
    if(keyCode == DOWN && dir!=90  )
    {dir=270;}
    if(keyCode == LEFT && dir!=0  )
    {dir=180;}
    if(keyCode == RIGHT && dir!=180 )
    {dir=0;}
    if(keyCode == SHIFT)
    {restart();}
  }
}
void restart()
{
  background(43,203,8);
  locX[1]=height/2;
  locY[1]=width/2;
   for(int i=2;i<500;i++)
  {
    locX[i]=0;
    locY[i]=0;
  }
  appleX=(round(random(20))+1)*25;
  appleY=(round(random(20))+1)*25;
  len = 2;
  speed =1;
  score =0 ;  
  dir = 90; 
}
