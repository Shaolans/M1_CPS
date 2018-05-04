	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 3
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC observer */

	case 5: // STATE 1
		;
		XX = 1;
		unrecv(now.observe, XX-1, 0, ((P1 *)this)->col, 1);
		unrecv(now.observe, XX-1, 1, ((int)((P1 *)this)->blk), 0);
		((P1 *)this)->col = trpt->bup.ovals[0];
		((P1 *)this)->blk = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 6: // STATE 4
		;
		((P1 *)this)->prec = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->col = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 7: // STATE 8
		;
		((P1 *)this)->prec = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->col = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 8: // STATE 12
		;
		((P1 *)this)->prec = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->col = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 9: // STATE 14
		;
	/* 0 */	((P1 *)this)->blk = trpt->bup.oval;
		;
		;
		goto R999;

	case 10: // STATE 22
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC traffic_light */

	case 11: // STATE 2
		;
		now.blink = trpt->bup.ovals[1];
		now.color = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 12: // STATE 3
		;
		_m = unsend(now.observe);
		;
		goto R999;

	case 13: // STATE 7
		;
		now.blink = trpt->bup.ovals[1];
		now.color = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 14: // STATE 8
		;
		_m = unsend(now.observe);
		;
		goto R999;

	case 15: // STATE 20
		;
		now.blink = trpt->bup.ovals[1];
		now.color = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 16: // STATE 21
		;
		_m = unsend(now.observe);
		;
		goto R999;

	case 17: // STATE 33
		;
		now.blink = trpt->bup.ovals[1];
		now.color = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 18: // STATE 34
		;
		_m = unsend(now.observe);
		;
		goto R999;

	case 19: // STATE 46
		;
		now.blink = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 50
		;
		p_restor(II);
		;
		;
		goto R999;
	}

