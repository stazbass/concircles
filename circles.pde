void setup(){
    frameRate(40);
    //size(1024, 768);
    fullScreen();
}
int angle = 0 ;

void drawCircleAtAngle(PVector center, float circleSize, float radius, float angle){
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
  float circleSize = 10;
  int maxI = 2450;
  for(int i = 0; i < maxI; i++){
    float localRadius = i*circleSize;
    float angle = getAngle(distance, localRadius);
    println(angle*180.0/PI);
    fill(localRadius%255, angle*PI/180.0);
    drawCircleAtAngle(new PVector(displayWidth/2.0, displayHeight/2.0), 10, localRadius, angle);
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
