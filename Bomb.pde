class Bomb extends Cherry {
  
  public Bomb(int points){
    super(points);
  }
  
  void show(){
    float s = millis();
    if (s % 10000 > 0 && s % 10000 < 4000){
      image(bombImg,pos.x,pos.y,grid,grid);
    }
    else {
      pickLocation(snake);
    }
  }
  
}
