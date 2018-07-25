class Cherry extends Food{
  
  int points;
  
  
  public Cherry(int points){
    super();
    this.points = points;
  }
  
  

  
  public void show(){
    float s = millis();
    if (s % 10000 > 0 && s % 10000 < 4000){
      image(cherryImg,pos.x,pos.y,grid,grid);
    }
    else {
      pickLocation(snake);
    }
  }
  
  void hideFood(){
    pos = new PVector(width + 100, height + 100);
  }
  
  
  
  
  
}
