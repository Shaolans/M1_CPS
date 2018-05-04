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
	case 3: // STATE 1 - train.pml:77 - [(run train(change1,sense_in1,sense_out1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!(addproc(II, 1, 0, ((P4 *)this)->change1, ((P4 *)this)->sense_in1, ((P4 *)this)->sense_out1, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - train.pml:78 - [(run train(change2,sense_in2,sense_out2))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!(addproc(II, 1, 0, ((P4 *)this)->change2, ((P4 *)this)->sense_in2, ((P4 *)this)->sense_out2, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - train.pml:79 - [(run feu(switch1,change1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		if (!(addproc(II, 1, 2, ((P4 *)this)->switch1, ((P4 *)this)->change1, 0, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - train.pml:80 - [(run feu(switch2,change2))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][4] = 1;
		if (!(addproc(II, 1, 2, ((P4 *)this)->switch2, ((P4 *)this)->change2, 0, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - train.pml:81 - [(run sensor(sense_in1,signalin1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		if (!(addproc(II, 1, 3, ((P4 *)this)->sense_in1, ((P4 *)this)->signalin1, 0, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - train.pml:82 - [(run sensor(sense_in2,signalin2))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][6] = 1;
		if (!(addproc(II, 1, 3, ((P4 *)this)->sense_in2, ((P4 *)this)->signalin2, 0, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - train.pml:83 - [(run sensor(sense_out1,signalout1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][7] = 1;
		if (!(addproc(II, 1, 3, ((P4 *)this)->sense_out1, ((P4 *)this)->signalout1, 0, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - train.pml:84 - [(run sensor(sense_out2,signalout1))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][8] = 1;
		if (!(addproc(II, 1, 3, ((P4 *)this)->sense_out2, ((P4 *)this)->signalout1, 0, 0, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 9 - train.pml:85 - [(run controle(signalin1,signalin2,signalout1,signalout2,switch1,switch2))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][9] = 1;
		if (!(addproc(II, 1, 1, ((P4 *)this)->signalin1, ((P4 *)this)->signalin2, ((P4 *)this)->signalout1, ((P4 *)this)->signalout2, ((P4 *)this)->switch1, ((P4 *)this)->switch2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - train.pml:87 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC sensor */
	case 13: // STATE 1 - train.pml:60 - [sense?b] (0:0:2 - 1)
		reached[3][1] = 1;
		if (boq != ((P3 *)this)->sense) continue;
		if (q_len(((P3 *)this)->sense) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P3 *)this)->b);
		;
		((P3 *)this)->b = qrecv(((P3 *)this)->sense, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("sensor:b", ((int)((P3 *)this)->b));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P3 *)this)->sense);
		sprintf(simtmp, "%d", ((int)((P3 *)this)->b)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P3 *)this)->sense))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: b */  (trpt+1)->bup.ovals[1] = ((P3 *)this)->b;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)this)->b = 0;
		_m = 4; goto P999; /* 0 */
	case 14: // STATE 2 - train.pml:60 - [signal!1] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (q_len(((P3 *)this)->signal))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P3 *)this)->signal);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P3 *)this)->signal, 0, 1, 1);
		{ boq = ((P3 *)this)->signal; };
		_m = 2; goto P999; /* 0 */
	case 15: // STATE 6 - train.pml:62 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC feu */
	case 16: // STATE 1 - train.pml:40 - [color = RED] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->color;
		((P2 *)this)->color = 2;
#ifdef VAR_RANGES
		logval("feu:color", ((P2 *)this)->color);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - train.pml:41 - [change!color] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_len(((P2 *)this)->change))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)this)->change);
		sprintf(simtmp, "%d", ((P2 *)this)->color); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)this)->change, 0, ((P2 *)this)->color, 1);
		{ boq = ((P2 *)this)->change; };
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 3 - train.pml:44 - [switch?b] (0:0:2 - 3)
		reached[2][3] = 1;
		if (boq != ((P2 *)this)->switch) continue;
		if (q_len(((P2 *)this)->switch) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P2 *)this)->b);
		;
		((P2 *)this)->b = qrecv(((P2 *)this)->switch, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("feu:b", ((int)((P2 *)this)->b));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)this)->switch);
		sprintf(simtmp, "%d", ((int)((P2 *)this)->b)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)this)->switch))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: b */  (trpt+1)->bup.ovals[1] = ((P2 *)this)->b;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->b = 0;
		_m = 4; goto P999; /* 0 */
	case 19: // STATE 4 - train.pml:45 - [((color==RED))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((P2 *)this)->color==2)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: color */  (trpt+1)->bup.oval = ((P2 *)this)->color;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->color = 0;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 6 - train.pml:46 - [((color==GREEN))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!((((P2 *)this)->color==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: color */  (trpt+1)->bup.oval = ((P2 *)this)->color;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->color = 0;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 10 - train.pml:50 - [color = GREEN] (0:0:1 - 3)
		IfNotBlocked
		reached[2][10] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->color;
		((P2 *)this)->color = 1;
#ifdef VAR_RANGES
		logval("feu:color", ((P2 *)this)->color);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 11 - train.pml:51 - [change!color] (0:0:0 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (q_len(((P2 *)this)->change))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)this)->change);
		sprintf(simtmp, "%d", ((P2 *)this)->color); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)this)->change, 0, ((P2 *)this)->color, 1);
		{ boq = ((P2 *)this)->change; };
		_m = 2; goto P999; /* 0 */

		 /* PROC controle */
	case 23: // STATE 1 - train.pml:32 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC train */
	case 24: // STATE 2 - train.pml:9 - [sense_in!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (q_len(((P0 *)this)->sense_in))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->sense_in);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->sense_in, 0, 1, 1);
		{ boq = ((P0 *)this)->sense_in; };
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 4 - train.pml:13 - [change?color] (0:0:1 - 4)
		reached[0][4] = 1;
		if (boq != ((P0 *)this)->change) continue;
		if (q_len(((P0 *)this)->change) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->color;
		;
		((P0 *)this)->color = qrecv(((P0 *)this)->change, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("train:color", ((P0 *)this)->color);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->change);
		sprintf(simtmp, "%d", ((P0 *)this)->color); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P0 *)this)->change))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 26: // STATE 5 - train.pml:15 - [((color==GREEN))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((P0 *)this)->color==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: color */  (trpt+1)->bup.oval = ((P0 *)this)->color;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->color = 0;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 11 - train.pml:20 - [voie_milieu = (voie_milieu+1)] (0:0:1 - 3)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = now.voie_milieu;
		now.voie_milieu = (now.voie_milieu+1);
#ifdef VAR_RANGES
		logval("voie_milieu", now.voie_milieu);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 13 - train.pml:25 - [sense_out!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (q_len(((P0 *)this)->sense_out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->sense_out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->sense_out, 0, 1, 1);
		{ boq = ((P0 *)this)->sense_out; };
		_m = 2; goto P999; /* 0 */
	case 29: // STATE 14 - train.pml:26 - [voie_milieu = (voie_milieu-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = now.voie_milieu;
		now.voie_milieu = (now.voie_milieu-1);
#ifdef VAR_RANGES
		logval("voie_milieu", now.voie_milieu);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 16 - train.pml:28 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
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

