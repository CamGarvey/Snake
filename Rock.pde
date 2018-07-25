class Rock extends Food {
  
  private PVector pos;
  private float gravity = 1;
  int rows = floor(width/grid);
  int cols = floor(height/grid);
  
  public Rock(){
    super();
  }
  
  
  
  public void show(){
    fill(0);
    rect(pos.x,pos.y, grid, grid);
  }
  
  public void update(){
    pos.y += gravity * grid;
    if (pos.y > height){
      pickLocation(); 
    }
    
  }
  
  
  public void pickLocation(){
    pos = new PVector(floor(random(rows)),0);
    pos.mult(grid);
  }
  
  
  
  
  
}
