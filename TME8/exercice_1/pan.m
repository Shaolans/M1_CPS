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
	case 3: // STATE 1 - feu_safe.pml:84 - [(run traffic_light())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - feu_safe.pml:86 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC observer */
	case 5: // STATE 1 - feu_safe.pml:62 - [observe?col,blk] (0:0:2 - 1)
		reached[1][1] = 1;
		if (boq != now.observe) continue;
		if (q_len(now.observe) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->col;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->blk);
		;
		((P1 *)this)->col = qrecv(now.observe, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("observer:col", ((P1 *)this)->col);
#endif
		;
		((P1 *)this)->blk = qrecv(now.observe, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("observer:blk", ((int)((P1 *)this)->blk));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.observe);
		sprintf(simtmp, "%d", ((P1 *)this)->col); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)this)->blk)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.observe))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 6: // STATE 2 - feu_safe.pml:65 - [((col==orange))] (19:0:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((P1 *)this)->col==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: col */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->col;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->col = 0;
		/* merge: assert(((blk==1)||(prec!=red)))(19, 3, 19) */
		reached[1][3] = 1;
		spin_assert(((((int)((P1 *)this)->blk)==1)||(((P1 *)this)->prec!=4)), "((blk==1)||(prec!=4))", II, tt, t);
		/* merge: prec = orange(19, 4, 19) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->prec;
		((P1 *)this)->prec = 3;
#ifdef VAR_RANGES
		logval("observer:prec", ((P1 *)this)->prec);
#endif
		;
		/* merge: .(goto)(0, 18, 19) */
		reached[1][18] = 1;
		;
		/* merge: .(goto)(0, 20, 19) */
		reached[1][20] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 7: // STATE 6 - feu_safe.pml:69 - [((col==green))] (19:0:2 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!((((P1 *)this)->col==2)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: col */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->col;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->col = 0;
		/* merge: assert((prec!=orange))(19, 7, 19) */
		reached[1][7] = 1;
		spin_assert((((P1 *)this)->prec!=3), "(prec!=3)", II, tt, t);
		/* merge: prec = green(19, 8, 19) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->prec;
		((P1 *)this)->prec = 2;
#ifdef VAR_RANGES
		logval("observer:prec", ((P1 *)this)->prec);
#endif
		;
		/* merge: .(goto)(0, 18, 19) */
		reached[1][18] = 1;
		;
		/* merge: .(goto)(0, 20, 19) */
		reached[1][20] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 8: // STATE 10 - feu_safe.pml:73 - [((col==red))] (19:0:2 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!((((P1 *)this)->col==4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: col */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->col;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->col = 0;
		/* merge: assert((prec!=green))(19, 11, 19) */
		reached[1][11] = 1;
		spin_assert((((P1 *)this)->prec!=2), "(prec!=2)", II, tt, t);
		/* merge: prec = red(19, 12, 19) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->prec;
		((P1 *)this)->prec = 4;
#ifdef VAR_RANGES
		logval("observer:prec", ((P1 *)this)->prec);
#endif
		;
		/* merge: .(goto)(0, 18, 19) */
		reached[1][18] = 1;
		;
		/* merge: .(goto)(0, 20, 19) */
		reached[1][20] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 9: // STATE 14 - feu_safe.pml:77 - [((blk==1))] (19:0:1 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!((((int)((P1 *)this)->blk)==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: blk */  (trpt+1)->bup.oval = ((P1 *)this)->blk;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->blk = 0;
		/* merge: assert((col==orange))(0, 15, 19) */
		reached[1][15] = 1;
		spin_assert((((P1 *)this)->col==3), "(col==3)", II, tt, t);
		/* merge: .(goto)(0, 18, 19) */
		reached[1][18] = 1;
		;
		/* merge: .(goto)(0, 20, 19) */
		reached[1][20] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 10: // STATE 22 - feu_safe.pml:81 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC traffic_light */
	case 11: // STATE 1 - feu_safe.pml:8 - [color = red] (0:3:2 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.color;
		now.color = 4;
#ifdef VAR_RANGES
		logval("color", now.color);
#endif
		;
		/* merge: blink = 0(3, 2, 3) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.blink);
		now.blink = 0;
#ifdef VAR_RANGES
		logval("blink", ((int)now.blink));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 3 - feu_safe.pml:10 - [observe!color,blink] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (q_len(now.observe))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.observe);
		sprintf(simtmp, "%d", now.color); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.blink)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.observe, 0, now.color, ((int)now.blink), 2);
		{ boq = now.observe; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 6 - feu_safe.pml:16 - [color = red] (0:8:2 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.color;
		now.color = 4;
#ifdef VAR_RANGES
		logval("color", now.color);
#endif
		;
		/* merge: blink = 0(8, 7, 8) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.blink);
		now.blink = 0;
#ifdef VAR_RANGES
		logval("blink", ((int)now.blink));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 14: // STATE 8 - feu_safe.pml:18 - [observe!color,blink] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (q_len(now.observe))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.observe);
		sprintf(simtmp, "%d", now.color); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.blink)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.observe, 0, now.color, ((int)now.blink), 2);
		{ boq = now.observe; };
		_m = 2; goto P999; /* 0 */
	case 15: // STATE 19 - feu_safe.pml:28 - [color = green] (0:21:2 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.color;
		now.color = 2;
#ifdef VAR_RANGES
		logval("color", now.color);
#endif
		;
		/* merge: blink = 0(21, 20, 21) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.blink);
		now.blink = 0;
#ifdef VAR_RANGES
		logval("blink", ((int)now.blink));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 21 - feu_safe.pml:30 - [observe!color,blink] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		if (q_len(now.observe))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.observe);
		sprintf(simtmp, "%d", now.color); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.blink)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.observe, 0, now.color, ((int)now.blink), 2);
		{ boq = now.observe; };
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 32 - feu_safe.pml:40 - [color = green] (0:34:2 - 1)
		IfNotBlocked
		reached[0][32] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.color;
		now.color = 2;
#ifdef VAR_RANGES
		logval("color", now.color);
#endif
		;
		/* merge: blink = 0(34, 33, 34) */
		reached[0][33] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.blink);
		now.blink = 0;
#ifdef VAR_RANGES
		logval("blink", ((int)now.blink));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 34 - feu_safe.pml:42 - [observe!color,blink] (0:0:0 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		if (q_len(now.observe))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.observe);
		sprintf(simtmp, "%d", now.color); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)now.blink)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.observe, 0, now.color, ((int)now.blink), 2);
		{ boq = now.observe; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 46 - feu_safe.pml:52 - [blink = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][46] = 1;
		(trpt+1)->bup.oval = ((int)now.blink);
		now.blink = 1;
#ifdef VAR_RANGES
		logval("blink", ((int)now.blink));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 50 - feu_safe.pml:54 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][50] = 1;
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

