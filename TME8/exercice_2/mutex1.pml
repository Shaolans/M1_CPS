bool ask0 = false;
bool ask1 = false;
byte turn = 0;

int cs_counter = 0;

proctype proc1(int repeat; int max_sleep){
  int count = 0;

  do
    ::count<repeat->
      printf("[Proc1]: demande...\n");
      ask0=true;
      do
        ::ask1==true->
          if
            ::turn!=0->
              ask0=false;
              turn!=0;
              ask0=true;
            ::else->skip;
          fi
        ::else->goto _end_while2;
      od
      _end_while2:

      printf("[Proc1]: entrée section critique...\n");
      cs_counter++;
      assert (cs_counter == 1);

      int msec = 1000 % max_sleep;
      cs_counter--;
      printf("[Proc1]: sortie section critique...\n");

      turn = 1;
      ask0 = false;
      count++;

      ::else->goto _end_while1;
    od
    _end_while1:

}

proctype proc2(int repeat; int max_sleep){
  int count = 0;
  do
    ::count<repeat->
      printf("[Proc2]: demande...\n");
      ask1=true;
      do
        ::ask0==true->
          if
            ::turn!=1->
              ask1=false;
              turn!=1;
              ask1=true;
            ::else->skip;
          fi
        ::else->goto _end_while3;
      od
      _end_while3:
      
      printf("[Proc2]: entrée section critique...\n");
      cs_counter++;
      assert (cs_counter == 1);
      int msec = 1000 % max_sleep;

      cs_counter--;
      printf("[Proc2]: sortie section critique...\n");
      turn = 0;
      ask1 = false;
      count++;
    ::else->goto _end_while4;
  od
  _end_while4:
}


init{
  atomic{
    run proc1(10,100);
    run proc2(10,100);
  }
}
