// ---------------------------------------------------------------------------------------------------
#region Wobble orb shader controls
// ---------------------------------------------------------------------------------------------------

wobTime += global.second * wobTimeMul;
wobTime1 += global.second * wobTimeMul1;
wobTime2 += global.second * wobTimeMul2;
globalOffset += global.second;

var humpDist = (pi * 2) / humps;
var humpIter = 0;

if (wobTime >= pi * 2) {
	wobTime = 0;
	wobTimeMul = random_range(0.5, 1.5);
	wobHeightMul = random_range(10, 30);
	wobSize = random_range(humps, humps * 2);
	wobOffsetMax = ((2 * pi) / wobSize);
	wobOffset = random_range(humpIter, humpIter + humpDist - wobOffsetMax);
}

humpIter += humpDist;

if (wobTime1 >= pi * 2) {
	wobTime1 = 0;
	wobTimeMul1 = random_range(0.5, 1.5);
	wobHeightMul1 = random_range(10, 30);
	wobSize1 = random_range(humps, humps * 2);
	wobOffsetMax1 = ((2 * pi) / wobSize1);
	wobOffset1 = random_range(humpIter, humpIter + humpDist - wobOffsetMax1);
}

humpIter += humpDist;

if (wobTime2 >= pi * 2) {
	wobTime2 = 0;
	wobTimeMul2 = random_range(0.5, 1.5);
	wobHeightMul2 = random_range(10, 30);
	wobSize2 = random_range(humps, humps * 2);
	wobOffsetMax2 = ((2 * pi) / wobSize2);
	wobOffset2 = random_range(humpIter, humpIter + humpDist - wobOffsetMax2);
}

wobHeight	= (-cos(wobTime) + 1) / wobHeightMul;
wobHeight1	= (-cos(wobTime1) + 1) / wobHeightMul1;
wobHeight2	= (-cos(wobTime2) + 1) / wobHeightMul2;

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Zoom
// ---------------------------------------------------------------------------------------------------



#endregion
// ---------------------------------------------------------------------------------------------------