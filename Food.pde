class Food {
  
  int rows = floor(width/grid);
  int cols = floor(height/grid);
  PVector pos;
  color foodColor;

  
  public Food(){
    pickLocation(snake);
    foodColor = color(floor(random(255)),floor(random(255)),floor(random(255)));
  }
  
  
  void show(){
    fill(foodColor);
    rect(pos.x,pos.y,grid,grid);
  }
  
  
  
  void pickLocation(Snake s) {
    pos = new PVector(floor(random(rows)),floor(random(cols)));
    pos.mult(grid);
    for (PVector v : s.history) {
       if (s.pos.equals(v)){
         pickLocation(s); 
       }
    }
  }
  
  

}
