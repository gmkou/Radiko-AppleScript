boot (module loader) for me
property dateLibrary : load module "myLib:DateLib"
property radikoLibrary : load module "myLib:RadikoLib"

set fProgram to "Dummy"
set fOutputPath to "/Users/lucy/Sites/Radio/"
set fMinutes to 1
set fStation to "TBS"
-- STA = (TBS, QRR, LFR, NSB, INT, FMT, FMJ)
-- STA = (ABC, MBS, OBC, CCL, 802, FMO)

set fDate to dateLibrary's myDate()

radikoLibrary's myRecord(fProgram, fStation, fMinutes, fOutputPath, fDate)
