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

	case 5: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC proc2 */
;
		
	case 6: // STATE 1
		goto R999;

	case 7: // STATE 3
		;
		now.b2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 10: // STATE 8
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		
	case 11: // STATE 13
		goto R999;
;
		
	case 12: // STATE 16
		goto R999;

	case 13: // STATE 17
		;
		now.cs_counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 19
		;
		((P1 *)this)->msec = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 16: // STATE 20
		;
		now.cs_counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 18: // STATE 22
		;
		now.b2 = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 23
		;
		((P1 *)this)->count = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 30
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC proc1 */
;
		
	case 21: // STATE 1
		goto R999;

	case 22: // STATE 3
		;
		now.b1 = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 25: // STATE 8
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		
	case 26: // STATE 13
		goto R999;
;
		
	case 27: // STATE 16
		goto R999;

	case 28: // STATE 17
		;
		now.cs_counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 30: // STATE 19
		;
		((P0 *)this)->msec = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 31: // STATE 20
		;
		now.cs_counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 33: // STATE 22
		;
		now.b1 = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 23
		;
		((P0 *)this)->count = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 30
		;
		p_restor(II);
		;
		;
		goto R999;
	}

