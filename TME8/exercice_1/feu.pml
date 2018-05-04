mtype = {red, orange, green};
bool blink = true;
mtype color = orange;

proctype traffic_light(){
  color=red;
  blink=false;
  goto _red;

  _red:
    do
      ::color==red->goto _red
      ::color==green->goto _green
      ::color==orange->goto _blinking_orange
    od
  _green:

    do
      ::color==green->goto _green
      ::color==orange->goto _orange
      ::color==orange->goto _blinking_orange
    od

  _orange:
    do
      ::color==red->goto _red
      ::color==orange->goto _blinking_orange
      ::color==orange->goto _orange
    od

  _blinking_orange:
    if
      ::true->color=orange;blink=true;goto _blinking_orange;
    fi
}


init{
  atomic{
    run traffic_light();
  }
}
