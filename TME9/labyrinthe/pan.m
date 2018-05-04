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

		 /* PROC laby */
	case 3: // STATE 1 - laby.pml:17 - [go!ENTER] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 5, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 4: // STATE 3 - laby.pml:21 - [go!NORTH] (0:0:0 - 2)
		IfNotBlocked
		reached[1][3] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 5: // STATE 6 - laby.pml:25 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 6: // STATE 9 - laby.pml:26 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 7: // STATE 14 - laby.pml:31 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 8: // STATE 17 - laby.pml:32 - [go!SOUTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 9: // STATE 22 - laby.pml:37 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 10: // STATE 25 - laby.pml:38 - [go!SOUTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 11: // STATE 29 - laby.pml:42 - [go!SOUTH] (0:0:0 - 3)
		IfNotBlocked
		reached[1][29] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 12: // STATE 32 - laby.pml:46 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][32] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 35 - laby.pml:47 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][35] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 14: // STATE 40 - laby.pml:52 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][40] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 15: // STATE 43 - laby.pml:53 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][43] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 48 - laby.pml:58 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][48] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 51 - laby.pml:59 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][51] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 54 - laby.pml:60 - [go!SOUTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][54] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 59 - laby.pml:65 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][59] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 62 - laby.pml:66 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][62] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 67 - laby.pml:71 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][67] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 22: // STATE 70 - laby.pml:72 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][70] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 23: // STATE 74 - laby.pml:76 - [go!WEST] (0:0:0 - 3)
		IfNotBlocked
		reached[1][74] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 24: // STATE 77 - laby.pml:80 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][77] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 80 - laby.pml:81 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][80] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 26: // STATE 83 - laby.pml:82 - [go!SOUTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][83] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 27: // STATE 87 - laby.pml:86 - [go!EAST] (0:0:0 - 3)
		IfNotBlocked
		reached[1][87] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 90 - laby.pml:90 - [go!SOUTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][90] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 29: // STATE 93 - laby.pml:91 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][93] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 30: // STATE 98 - laby.pml:96 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][98] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 31: // STATE 101 - laby.pml:97 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][101] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 106 - laby.pml:102 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][106] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 33: // STATE 109 - laby.pml:103 - [go!NORTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][109] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 4, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 34: // STATE 114 - laby.pml:108 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][114] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 117 - laby.pml:109 - [go!SOUTH] (0:0:0 - 1)
		IfNotBlocked
		reached[1][117] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 3, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 36: // STATE 122 - laby.pml:114 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][122] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 37: // STATE 125 - laby.pml:115 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][125] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 38: // STATE 130 - laby.pml:120 - [go!WEST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][130] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 2, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 39: // STATE 133 - laby.pml:121 - [go!EAST] (0:0:0 - 1)
		IfNotBlocked
		reached[1][133] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 1, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 40: // STATE 137 - laby.pml:125 - [go!EXIT] (0:0:0 - 5)
		IfNotBlocked
		reached[1][137] = 1;
		if (q_len(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, 6, 1);
		{ boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 41: // STATE 141 - laby.pml:132 - [(0)] (0:0:0 - 2)
		IfNotBlocked
		reached[1][141] = 1;
		if (!(0))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 142 - laby.pml:134 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][142] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC observateur */
	case 43: // STATE 1 - laby.pml:8 - [go?dir] (0:0:1 - 1)
		reached[0][1] = 1;
		if (boq != now.go) continue;
		if (q_len(now.go) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->dir;
		;
		((P0 *)this)->dir = qrecv(now.go, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("observateur:dir", ((P0 *)this)->dir);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.go);
		sprintf(simtmp, "%d", ((P0 *)this)->dir); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.go))
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
	case 44: // STATE 2 - laby.pml:9 - [((dir==EXIT))] (12:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((P0 *)this)->dir==6)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: dir */  (trpt+1)->bup.oval = ((P0 *)this)->dir;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->dir = 0;
		/* merge: printf('go EXIT\\n')(0, 3, 12) */
		reached[0][3] = 1;
		Printf("go EXIT\n");
		/* merge: goto exit(0, 4, 12) */
		reached[0][4] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 45: // STATE 6 - laby.pml:10 - [printf('go %e\\n',dir)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		Printf("go %e\n", ((P0 *)this)->dir);
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 13 - laby.pml:14 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
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

