class PTimeVector extends PVector {
 
  Date date;
  
  PTimeVector(float _x, float _y, float _z, Date _d) {
    super(_x,_y,_z);
    date = _d;
  }
}