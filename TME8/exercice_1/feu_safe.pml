mtype = {red, orange, green, unknown};
bool blink = true;
mtype color = orange;
chan observe = [0] of {mtype, bool};

proctype traffic_light(){
  atomic{
    color=red;
    blink=false;
    observe!color,blink;
  }
  goto _red;

  _red:
    atomic{
      color=red;
      blink=false;
      observe!color,blink;
    }
    do
      ::true->goto _red
      ::true->goto _green
      ::true->goto _blinking_orange
    od

  _green:
    atomic{
      color=green;
      blink=false;
      observe!color,blink;
    }
    do
      ::true->goto _green
      ::true->goto _orange
      ::true->goto _blinking_orange
    od

  _orange:
    atomic{
      color=green;
      blink=false;
      observe!color,blink;
    }
    do
      ::true->goto _red
      ::true->goto _orange
      ::true->goto _blinking_orange
    od

  _blinking_orange:
    if
      ::true->blink=true;goto _blinking_orange;
    fi
}

proctype observer(){
  mtype prec = unknown;
  mtype col = unknown;
  bool blk = false;

  do
    ::observe?col,blk->
      if
        ::atomic{
          col==orange->assert(blk==true || prec!=red);
                        prec=orange;
        }
        ::atomic{
          col==green->assert(prec!=orange);
                      prec=green;
        }
        ::atomic{
          col==red->assert(prec!=green);
                    prec=red;
        }
        ::atomic{
          blk==true->assert(col==orange);
        }
      fi
    od
}
init{
  atomic{
    run traffic_light();
  }
}
