class Snake{
  
  
  float size;
  PVector pos;
  PVector direction = new PVector(0,0);
  ArrayList<PVector> history = new ArrayList<PVector>();
  int tail = 0;
  
  
  
  
  public Snake(float size){
    this.size = size;
    pos = new PVector(width/2, height - size);
  }
  
  
  
  
  public void show(){
    for (int i = 0; i < history.size(); i++){
      noStroke();
      fill(i*5,100,127);
      rect(history.get(i).x,history.get(i).y,size,size);
    }
    fill(250);
    rect(pos.x,pos.y, size,size); 
  }
  
  
  
  
  public boolean eat(Food food){
    if (food instanceof Cherry){
      if (food.pos.equals(pos)){
        Cherry sfood = (Cherry) food;
        tail += sfood.points;
        return true;
      }
    }
    if (food instanceof Rock){
      for (PVector v : history){
        if (food.pos.equals(v)){
          tail++;
          return true;
        }
      }
    }
    if (food.pos.equals(pos)){
      tail++;
      return true;
    }
    
    return false;
  }
  
  
  
  public void update(){
    if (tail > 0){
      if (tail == history.size() && !history.isEmpty()){
        history.remove(0);
      }
      history.add(new PVector(pos.x,pos.y));
    }
    
    pos.y = pos.y + direction.y;
    pos.x = pos.x + direction.x;
    wrap();
  }
  
  
 boolean death() {
    for (int i = 0; i < history.size(); i++) {
      PVector hpos = history.get(i);
      float d = dist(pos.x, pos.y, hpos.x, hpos.y);
      if (d < 1) {
        tail = 0;
        history.clear();
        return true;
      }
    }
    return false;
  }
  
  

  
  
  public void dir(float x, float y){
    if (direction.x < 0 && x > 0 || direction.y < 0 && y > 0
        || direction.x > 0 && x < 0 || direction.y > 0 && y < 0){
      return;  
    }
    direction.x = x * size;
    direction.y = y * size;
    
  }
  
  void wrap(){
    if (pos.x >= width){
      pos.x = 0;  
    }
    else if (pos.x <= 0 - size){
      pos.x = width - size;  
    }
    if (pos.y >= height){
      pos.y = 0;  
    }
    else if (pos.y <=0 - size){
      pos.y = height - size;
    }
  }
  
  
  
  
  
  
  
}
