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

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 8
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 9
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC sensor */

	case 13: // STATE 1
		;
	/* 0 */	((P3 *)this)->b = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P3 *)this)->sense, XX-1, 0, ((int)((P3 *)this)->b), 1);
		((P3 *)this)->b = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 14: // STATE 2
		;
		_m = unsend(((P3 *)this)->signal);
		;
		goto R999;

	case 15: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC feu */

	case 16: // STATE 1
		;
		((P2 *)this)->color = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 2
		;
		_m = unsend(((P2 *)this)->change);
		;
		goto R999;

	case 18: // STATE 3
		;
	/* 0 */	((P2 *)this)->b = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P2 *)this)->switch, XX-1, 0, ((int)((P2 *)this)->b), 1);
		((P2 *)this)->b = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 19: // STATE 4
		;
	/* 0 */	((P2 *)this)->color = trpt->bup.oval;
		;
		;
		goto R999;

	case 20: // STATE 6
		;
	/* 0 */	((P2 *)this)->color = trpt->bup.oval;
		;
		;
		goto R999;

	case 21: // STATE 10
		;
		((P2 *)this)->color = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 11
		;
		_m = unsend(((P2 *)this)->change);
		;
		goto R999;

		 /* PROC controle */

	case 23: // STATE 1
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC train */

	case 24: // STATE 2
		;
		_m = unsend(((P0 *)this)->sense_in);
		;
		goto R999;

	case 25: // STATE 4
		;
		XX = 1;
		unrecv(((P0 *)this)->change, XX-1, 0, ((P0 *)this)->color, 1);
		((P0 *)this)->color = trpt->bup.oval;
		;
		;
		goto R999;

	case 26: // STATE 5
		;
	/* 0 */	((P0 *)this)->color = trpt->bup.oval;
		;
		;
		goto R999;

	case 27: // STATE 11
		;
		now.voie_milieu = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 13
		;
		_m = unsend(((P0 *)this)->sense_out);
		;
		goto R999;

	case 29: // STATE 14
		;
		now.voie_milieu = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 16
		;
		p_restor(II);
		;
		;
		goto R999;
	}

