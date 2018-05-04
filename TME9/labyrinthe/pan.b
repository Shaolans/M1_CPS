	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC laby */

	case 3: // STATE 1
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 4: // STATE 3
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 5: // STATE 6
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 6: // STATE 9
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 7: // STATE 14
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 8: // STATE 17
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 9: // STATE 22
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 10: // STATE 25
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 11: // STATE 29
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 12: // STATE 32
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 13: // STATE 35
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 14: // STATE 40
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 15: // STATE 43
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 16: // STATE 48
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 17: // STATE 51
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 18: // STATE 54
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 19: // STATE 59
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 20: // STATE 62
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 21: // STATE 67
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 22: // STATE 70
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 23: // STATE 74
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 24: // STATE 77
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 25: // STATE 80
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 26: // STATE 83
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 27: // STATE 87
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 28: // STATE 90
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 29: // STATE 93
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 30: // STATE 98
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 31: // STATE 101
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 32: // STATE 106
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 33: // STATE 109
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 34: // STATE 114
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 35: // STATE 117
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 36: // STATE 122
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 37: // STATE 125
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 38: // STATE 130
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 39: // STATE 133
		;
		_m = unsend(now.go);
		;
		goto R999;

	case 40: // STATE 137
		;
		_m = unsend(now.go);
		;
		goto R999;
;
		;
		
	case 42: // STATE 142
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC observateur */

	case 43: // STATE 1
		;
		XX = 1;
		unrecv(now.go, XX-1, 0, ((P0 *)this)->dir, 1);
		((P0 *)this)->dir = trpt->bup.oval;
		;
		;
		goto R999;

	case 44: // STATE 2
		;
	/* 0 */	((P0 *)this)->dir = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 46: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}

