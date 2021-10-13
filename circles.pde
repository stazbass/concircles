void setup(){
    frameRate(40);
    //size(1024, 768);
    fullScreen();
}
int angle = 0 ;

void drawCircleAtAngle(PVector center, int circleSize, int radius, float angle){
  //PVector posNorm = center.fromAngle(,)().normalize();
  //float x = posNorm.x * cos(angle)*radius + center.x; //<>//
  //float y = posNorm.y * sin(angle)*radius + center.y;
  PVector pos = PVector.fromAngle(angle);
  pos.mult(radius);
  pos.add(center);
  circle(pos.x, pos.y, circleSize);  
}

void draw(){
  //clear();
  float distance = frameCount/10.0;
  int radius = 10;
  int maxI = 2450;
  for(int i = 0; i < maxI; i++){
    radius = i*10;
    float angle = getAngle(distance, radius);
    fill(radius%255, angle*PI/180t);
    drawCircleAtAngle(new PVector(1024/2.0, 768/2.0), 10, radius, angle);
  }
}

float getAngle(float arc_len, float radius){
  return (arc_len*360.0)/(2.0*PI*radius);
}
//speed = distance/time
//arc_len = 2*PI*radius*(angle/360.0);
// speed = constant
// angle = arc_len*360/2*PI*radius
// arc_len -> shared
// find angle at radius
//
