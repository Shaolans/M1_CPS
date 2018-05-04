#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - mutex2.pml:71 - [(run proc1(10,100))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0, 10, 100)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - mutex2.pml:72 - [(run proc2(10,100))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 1, 10, 100)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - mutex2.pml:74 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc2 */
	case 6: // STATE 1 - mutex2.pml:42 - [((count<repeat))] (3:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((P1 *)this)->count<((P1 *)this)->repeat)))
			continue;
		/* merge: printf('[Proc2]: demande...\\n')(0, 2, 3) */
		reached[1][2] = 1;
		Printf("[Proc2]: demande...\n");
		_m = 3; goto P999; /* 1 */
	case 7: // STATE 3 - mutex2.pml:44 - [b2 = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.b2);
		now.b2 = 0;
#ifdef VAR_RANGES
		logval("b2", ((int)now.b2));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 4 - mutex2.pml:47 - [((turn!=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((now.turn!=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 5 - mutex2.pml:50 - [(!(b1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!( !(((int)now.b1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - mutex2.pml:51 - [turn = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = now.turn;
		now.turn = 2;
#ifdef VAR_RANGES
		logval("turn", now.turn);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 13 - mutex2.pml:53 - [(1)] (17:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(17, 15, 17) */
		reached[1][15] = 1;
		;
		/* merge: printf('[Proc2]: entrée section critique...\\n')(17, 16, 17) */
		reached[1][16] = 1;
		Printf("[Proc2]: entrée section critique...\n");
		_m = 3; goto P999; /* 2 */
	case 12: // STATE 16 - mutex2.pml:55 - [printf('[Proc2]: entrée section critique...\\n')] (0:17:0 - 3)
		IfNotBlocked
		reached[1][16] = 1;
		Printf("[Proc2]: entrée section critique...\n");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 17 - mutex2.pml:56 - [cs_counter = (cs_counter+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = now.cs_counter;
		now.cs_counter = (now.cs_counter+1);
#ifdef VAR_RANGES
		logval("cs_counter", now.cs_counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 18 - mutex2.pml:57 - [assert((cs_counter==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		spin_assert((now.cs_counter==1), "(cs_counter==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 19 - mutex2.pml:59 - [msec = max_sleep] (0:0:2 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->msec;
		((P1 *)this)->msec = ((P1 *)this)->max_sleep;
#ifdef VAR_RANGES
		logval("proc2:msec", ((P1 *)this)->msec);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: msec */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->msec = 0;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 20 - mutex2.pml:59 - [cs_counter = (cs_counter-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.oval = now.cs_counter;
		now.cs_counter = (now.cs_counter-1);
#ifdef VAR_RANGES
		logval("cs_counter", now.cs_counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 21 - mutex2.pml:60 - [printf('[Proc2]: sortie section critique...\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][21] = 1;
		Printf("[Proc2]: sortie section critique...\n");
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 22 - mutex2.pml:61 - [b2 = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		(trpt+1)->bup.oval = ((int)now.b2);
		now.b2 = 1;
#ifdef VAR_RANGES
		logval("b2", ((int)now.b2));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 23 - mutex2.pml:62 - [count = (count+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][23] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->count;
		((P1 *)this)->count = (((P1 *)this)->count+1);
#ifdef VAR_RANGES
		logval("proc2:count", ((P1 *)this)->count);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 30 - mutex2.pml:66 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][30] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc1 */
	case 21: // STATE 1 - mutex2.pml:11 - [((count<repeat))] (3:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((P0 *)this)->count<((P0 *)this)->repeat)))
			continue;
		/* merge: printf('[Proc1]: demande...\\n')(0, 2, 3) */
		reached[0][2] = 1;
		Printf("[Proc1]: demande...\n");
		_m = 3; goto P999; /* 1 */
	case 22: // STATE 3 - mutex2.pml:13 - [b1 = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.b1);
		now.b1 = 0;
#ifdef VAR_RANGES
		logval("b1", ((int)now.b1));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 4 - mutex2.pml:16 - [((turn!=1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!((now.turn!=1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 5 - mutex2.pml:19 - [(!(b2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!( !(((int)now.b2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 8 - mutex2.pml:20 - [turn = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.turn;
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", now.turn);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 13 - mutex2.pml:22 - [(1)] (17:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(17, 15, 17) */
		reached[0][15] = 1;
		;
		/* merge: printf('[Proc1]: entrée section critique...\\n')(17, 16, 17) */
		reached[0][16] = 1;
		Printf("[Proc1]: entrée section critique...\n");
		_m = 3; goto P999; /* 2 */
	case 27: // STATE 16 - mutex2.pml:24 - [printf('[Proc1]: entrée section critique...\\n')] (0:17:0 - 3)
		IfNotBlocked
		reached[0][16] = 1;
		Printf("[Proc1]: entrée section critique...\n");
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 17 - mutex2.pml:25 - [cs_counter = (cs_counter+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = now.cs_counter;
		now.cs_counter = (now.cs_counter+1);
#ifdef VAR_RANGES
		logval("cs_counter", now.cs_counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 18 - mutex2.pml:26 - [assert((cs_counter==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		spin_assert((now.cs_counter==1), "(cs_counter==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 19 - mutex2.pml:28 - [msec = max_sleep] (0:0:2 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->msec;
		((P0 *)this)->msec = ((P0 *)this)->max_sleep;
#ifdef VAR_RANGES
		logval("proc1:msec", ((P0 *)this)->msec);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: msec */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->msec = 0;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 20 - mutex2.pml:28 - [cs_counter = (cs_counter-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = now.cs_counter;
		now.cs_counter = (now.cs_counter-1);
#ifdef VAR_RANGES
		logval("cs_counter", now.cs_counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 21 - mutex2.pml:29 - [printf('[Proc1]: sortie section critique...\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		Printf("[Proc1]: sortie section critique...\n");
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 22 - mutex2.pml:31 - [b1 = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)now.b1);
		now.b1 = 1;
#ifdef VAR_RANGES
		logval("b1", ((int)now.b1));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 23 - mutex2.pml:33 - [count = (count+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->count;
		((P0 *)this)->count = (((P0 *)this)->count+1);
#ifdef VAR_RANGES
		logval("proc1:count", ((P0 *)this)->count);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 30 - mutex2.pml:37 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

