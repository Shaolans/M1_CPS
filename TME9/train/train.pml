mtype = {RED, GREEN};
int voie_milieu = 0;

proctype train(chan change; chan sense_in; chan sense_out){
  mtype color;
  goto arrivee;

  arrivee:
    sense_in! true;
    goto attente;

  attente:
    change? color;
    if
      ::color==GREEN->goto pass;
      ::else->goto attente;
    fi

  pass:
    voie_milieu = voie_milieu + 1;
    goto sortie;

  sortie:
    atomic{
      sense_out! true;
      voie_milieu = voie_milieu - 1;
    }
}

proctype controle(chan signalin1; chan signalin2; chan signalout1; chan signalout2; chan switch1; chan switch2){
  goto RRNN:

  RRNN:
    if
      ::true->goto RRIN;
      ::true->goto RRNI;
    fi

  RRIN:
    if
      ::true->goto VRIN;
      ::true->goto RRII;
    fi

  RRNI:
    if
      ::true->goto RVIN;
      ::true->goto RRII;
    fi

  VRIN:
    if
      ::true->goto VRIN;
      ::true->goto VRPN;
    fi

  RVNI:
    if
      ::true->goto RVII;
      ::true->goto RVNP;
    fi

  VRPN:
    if
      ::true->goto RRPN;
      ::true->goto RNPI;
    fi


}

proctype feu(chan switch; chan change){

  bool b;
  mtype color;

  end_red_color:
    color = RED;
    change! color;

  end_wait_switch:
    switch?(b) -> if
      :: color == RED -> goto end_green_color;
      :: color == GREEN -> goto end_red_color;
      fi

  end_green_color:
    color = GREEN;
    change! color;
    goto end_wait_switch;
}


proctype sensor(chan sense; chan signal){
  bool b;
  end :
    do
      :: sense?b-> signal !true;
    od
}

init{
  chan change1 = [0] of {bool};
  chan sense_in1 = [0] of {bool};
  chan sense_out1 = [0] of {bool};
  chan change2 = [0] of {bool};
  chan sense_in2 = [0] of {bool};
  chan sense_out2 = [0] of {bool};
  chan switch1 = [0] of {mtype};
  chan switch2 = [0] of {mtype};
  chan signalin1 = [0] of {bool};
  chan signalin2 = [0] of {bool};
  chan signalout1 = [0] of {bool};
  chan signalout2 = [0] of {bool};
  run train(change1, sense_in1, sense_out1);
  run train(change2, sense_in2, sense_out2);
  run feu(switch1,change1);
  run feu(switch2,change2);
  run sensor(sense_in1, signalin1);
  run sensor(sense_in2, signalin2);
  run sensor(sense_out1, signalout1);
  run sensor(sense_out2, signalout1);
  run controle(signalin1, signalin2, signalout1, signalout2, switch1, switch2);

}
