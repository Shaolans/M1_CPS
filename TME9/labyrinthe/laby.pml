mtype = {EXIT, ENTER, NORTH, SOUTH, WEST, EAST};
chan go = [0] of {mtype};


active proctype observateur(){
  mtype dir;
  do
  ::go?(dir) -> if
                ::dir==EXIT->printf("go EXIT\n"); goto exit;
                ::else->printf("go %e\n", dir);
                fi
  od
  exit:
}

active proctype laby(){
  go! ENTER;
  goto case51;

  case51:
    go! NORTH; goto case52;

  case52:
    if
    ::true -> go! NORTH; goto case53;
    ::true -> go! WEST; goto case42;
    fi

  case53:
    if
    ::true -> go! NORTH; goto case54;
    ::true -> go! SOUTH; goto case52;
    fi

  case54:
    if
    ::true -> go! NORTH; goto case55;
    ::true -> go! SOUTH; goto case53;
    fi

  case55:
    go! SOUTH; goto case54;

  case42 :
    if
    ::true -> go! WEST; goto case32;
    ::true -> go! EAST; goto case52;
    fi

  case32 :
    if
    ::true -> go! WEST; goto case22;
    ::true -> go! EAST; goto case42;
    fi

  case22 :
    if
    ::true -> go! NORTH; goto case23;
    ::true -> go! EAST; goto case32;
    ::true -> go! SOUTH; goto case21;
    fi

  case21 :
    if
    ::true -> go! NORTH; goto case22;
    ::true -> go! EAST; goto case31;
    fi

  case31 :
    if
    ::true -> go! WEST; goto case21;
    ::true -> go! EAST; goto case41;
    fi

  case41 :
    go! WEST; goto case31;

  case23 :
    if
    ::true -> go! WEST; goto case13;
    ::true -> go! NORTH; goto case24;
    ::true -> go! SOUTH; goto case22;
    fi

  case13 :
    go! EAST; goto case23;

  case24 :
    if
    ::true -> go! SOUTH; goto case23;
    ::true -> go! EAST; goto case34;
    fi

  case34 :
    if
    ::true -> go! WEST; goto case24;
    ::true -> go! EAST; goto case44;
    fi

  case44 :
    if
    ::true -> go! WEST; goto case34;
    ::true -> go! NORTH; goto case45;
    fi

  case45 :
    if
    ::true -> go! WEST; goto case35;
    ::true -> go! SOUTH; goto case44;
    fi

  case35 :
    if
    ::true -> go! WEST; goto case25;
    ::true -> go! EAST; goto case45;
    fi

  case25 :
    if
    ::true -> go! WEST; goto case15;
    ::true -> go! EAST; goto case35;
    fi

  case15 :
    go! EXIT; goto exit;

  case14:
    go! NORTH; goto case15;


  exit:
    false;

}
