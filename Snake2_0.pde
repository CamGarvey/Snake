Snake snake;
float grid;
Food food;
Cherry cherry;
Bomb bomb;
color foodColor;
static int specialCount = 3;
int score;
int maxScore;
PImage bombImg;
PImage cherryImg;


void setup(){
  bombImg = loadImage("bomb.png");
  cherryImg = loadImage("cherry.png");
  snake = new Snake(25);
  size(600,600);
  grid = snake.size;  
  food = new Food();
  cherry = new Cherry(specialCount);
  score = 0;
  maxScore = 0;
  getMax();
  cherry.pickLocation(snake);
  bomb = new Bomb(specialCount);
}



//Retrieves highscore
void getMax(){
  byte[] mscore = loadBytes("score.dat");
  for (byte i : mscore){
    maxScore = i;  
  }
  
      
}

//Saves highScore
void saveMax(){
  byte[] scores = new byte[] {byte(maxScore)};
  saveBytes("score.dat", scores);
  
}


void draw(){
  frameRate(10);
  background(51);
  snake.show();
  snake.update();
  food.show();
  
  //Checks if snake hit tail. If it did, snake resets
  if (snake.death()){
    if (score > maxScore){
      maxScore = score;
      saveMax();
    }
    score = 0;
  }
  cherry.show();
  bomb.show();
  eatingFood();
}




//Checks if snake has eaten any food
void eatingFood(){
  
  if (snake.eat(food)){
    food = new Food();
    score += 1;
  }
  if (snake.eat(cherry)){
    specialCount++;
    score += cherry.points;
    cherry = new Cherry(specialCount);
    cherry.hideFood();
  }
  if (snake.eat(bomb)){
    specialCount--;
    score -= bomb.points;
    bomb = new Bomb(specialCount);
  }
 
  fill (255,127,255,127);
  textSize(30);
  textAlign(LEFT);
  text("Score: " +score,0, 50);
  textAlign(RIGHT);
  text("High Score: " + maxScore,width, 50);
}

void mouseClicked(){
  snake.tail += 100;
  
}

void keyPressed(){
  switch(keyCode){
    case UP:
      snake.dir(0,-1);
      break;
    case DOWN:
      snake.dir(0,1);
      break;
    case LEFT:
      snake.dir(-1,0);
      break;
    case RIGHT:
      snake.dir(1,0);
      break;
   }
}
