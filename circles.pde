void setup(){
    frameRate(100);
    //size(1024, 768);
    fullScreen();
    blendMode(LIGHTEST  );
    clear();
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
  float distance = frameCount*30.0;
  float circleSize = 4;
  int maxI = 500;
  for(int i = 0; i < maxI; i++){
    float localRadius = i*circleSize;
    float angle = (frameCount%2==0?1:1)* getAngle(distance/(log(distance)), localRadius);
    println(angle*180.0/PI);
    fill(255, (angle*180.0/PI)%255, localRadius%255);
    stroke(0, i%255, 100);
    //noStroke();
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
