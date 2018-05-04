bool b1 = true;
bool b2 = true;
int turn = 1;

int cs_counter = 0;

proctype proc1(int repeat; int max_sleep){
  int count = 0;

  do
    ::count<repeat->
      printf("[Proc1]: demande...\n");
      b1 = false;
      C1:
        if
          ::turn!=1->
          C2:
            if
              ::!b2->goto C2;
              ::else->turn=1;goto C1;
            fi
          ::else->skip
        fi
       printf("[Proc1]: entrée section critique...\n");
       cs_counter++;
       assert (cs_counter == 1);
      int msec = max_sleep;
      cs_counter--;
      printf("[Proc1]: sortie section critique...\n");

      b1 = true;

      count++;
    ::else->goto _end_while1
  od
  _end_while1:
}

proctype proc2(int repeat; int max_sleep){
  int count = 0;
  do
    ::count<repeat->
      printf("[Proc2]: demande...\n");
      b2 = false;
      C3:
        if
          ::turn!=2->
            C4:
              if
                ::!b1->goto C4;
                ::else->turn=2;goto C3;
              fi
          ::else->skip;
       fi
       printf("[Proc2]: entrée section critique...\n");
       cs_counter++;
       assert (cs_counter == 1);
       int msec = max_sleep;
       cs_counter--;
       printf("[Proc2]: sortie section critique...\n");
       b2 = true;
       count++;
    ::else->goto _end_while2;
  od
  _end_while2:
}


init{
  atomic{
    run proc1(10,100);
    run proc2(10,100);
  }
}
