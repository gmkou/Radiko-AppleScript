on myDate()
	copy (current date) to today
	
	set Y to year of today
	set M to month of today
	set D to day of today
	
	if D ≤ 9 then set D to "0" & D
	
	if M is January then set M to "01"
	if M is February then set M to "02"
	if M is March then set M to "03"
	if M is April then set M to "04"
	if M is May then set M to "05"
	if M is June then set M to "06"
	if M is July then set M to "07"
	if M is August then set M to "08"
	if M is September then set M to "09"
	if M is October then set M to "10"
	if M is November then set M to "11"
	if M is December then set M to "12"
	
	return (Y as string) & "-" & (M as string) & "-" & (D as string)
end myDate

on run
	set fDate to myDate()
	
	set RTMPDUMP to "/opt/local/bin/rtmpdump"
	set FFMPEG to "/usr/local/bin/ffmpeg"
	set fPATH to "/Users/lucy/Sites/Radio/"
	
	set fPROGRAM to "AVANTI_"
	set fMIN to 120
	set fSEC to fMIN * 60
	
	set fFLV to "" & fPATH & fPROGRAM & fDate & ".flv"
	set fMP3 to "" & fPATH & fPROGRAM & fDate & ".mp3"
	
	set fSTA to "TBS"
	-- STA = (TBS, QRR, LFR, NSB, INT, FMT, FMJ)
	--  STA = (ABC, MBS, OBC, CCL, 802, FMO)
	
	do shell script "" & RTMPDUMP & " --rtmp \"rtmpe://radiko.smartstream.ne.jp/" & fSTA & "/_defInst_/simul-stream\" --live -B " & fSEC & " --flv " & fFLV & "  --port 1935 --swfUrl \"http://radiko.jp/player/player_0.0.9.swf\""
	do shell script "" & FFMPEG & " -y -i " & fFLV & " -vn " & fMP3
	do shell script "rm " & fFLV
end run