   10 /* 図形ワ－ドプロセッサ－/*
   20 /*    Ｘ－六八郎 Jr.     /*
   30 /* Copyright YochanSoft  /*   Programed by Awed  Ver 0.85
   40 screen 2,0,1,1
   50 int true=1
   60 int ai,bi,ci,di,ei,fi,gi,hi,ii,ji,bmx,bmy,bmx1,bmy1
   70 str noji[256]
   75 dim int vv(65535)
   80 dim float gdat(65535)
   90 int hm=0,hn=0
  100 error off
  200 vpage(1):window(0,16,1023,1023)
  210 mouse(4)
  220 msarea(0,0,767,511)
  240 mouse(1)
  250 setmspos(32,0)
  300 gamen()
  310 chkmouse()
  999 end
 1000 func moji()
 1005 msbtn(0,0,0)
 1006 color 6
 1010   while true
 1015   locate 0,28:print"表示位置指定"
 1020     msstat(bi,ci,di,ei):mspos(bi,ci)
 1030           if ei=-1 then break
 1040           if di<>-1 then continue
 1045      locate 0,28:print"文字列入力 >";:noji=_keysns0()
 1050      if noji="\\\" then break
 1060      symbol(bi+hm,ci+hn,noji,1,1,2,15,0)
 1070      fi=bi+12*strlen(noji):if fi>760  then fi=0:ci=ci+24
 1080      setmspos(fi,ci)
 1085      locate 0,28:print space$(150)
 1090   endwhile
 1100      locate 0,28:print space$(150)
 1110 color 7
 1999 endfunc
 2000 func owari()
 2005 msbtn(0,0,0)
 2008 vpage(0)
 2010 locate 23,15:print"右ボタンで、終了します "
 2030 while true
 2040  msstat(ai,bi,ci,di)
 2050    if di=-1 then screen 2,0,1,1:mouse(0):end
 2060    if ci=-1 then vpage(1):break
 2070 endwhile
 2074 locate 23,15:print"                       "
 2075 msbtn(0,0,0):return()
 2080 endfunc
 3000 func chkmouse()
 3010 while true
 3100 msstat(ai,bi,ci,di):mspos(ai,bi)
 3110    if ci<>-1 then continue
 3120 if ai>39  and ai<52  and bi>0 and bi<16 then locate 5,0:print"★":moji():locate 5,0:print"☆"
 3130 if ai>110 and ai<128 and bi>0 and bi<16 then locate 14,0:print"★":sen():locate 14,0:print"☆"
 3140 if ai>184 and ai<197 and bi>0 and bi<16 then locate 23,0:print"★":idou():locate 23,0:print"☆"
 3150 if ai>258 and ai<269 and bi>0 and bi<16 then locate 32,0:print"★":insatu():locate 32,0:print"☆"
 3160 if ai>328 and ai<341 and bi>0 and bi<16 then locate 41,0:print"★":gcopy():locate 41,0:print"☆"
 3164 if ai>400 and ai<414 and bi>0 and bi<16 then locate 50,0:print"★":kesu():locate 50,0:print"☆"
 3165 if ai>472 and ai<486 and bi>0 and bi<16 then locate 59,0:print"★":ksen():locate 59,0:print"☆"
 3166 if ai>544 and ai<558 and bi>0 and bi<16 then locate 68,0:print"★":_file():locate 68,0:print"☆"
 3167 if ai>617 and ai<629 and bi>0 and bi<16 then locate 77,0:print"★":spray():locate 77,0:print"☆"
 3169 if ai>688 and ai<702 and bi>0 and bi<16 then locate 86,0:print"★":owari():locate 86,0:print"☆"
 3170 endwhile
 3180 endfunc
 4000 func sen()
 4020 while true
 4030   msstat(bi,ci,di,ei):mspos(bi,ci)
 4040       if ei=-1 then break
 4050       if di<>-1 then continue
 4060       fi=bi:gi=ci
 4070       mspos(bi,ci)
 4080    line(fi+hm,gi+hn,bi+hm,ci+hn,15)
 4090 endwhile
 4100 endfunc
 6000 func idou()
 6003 setmspos(0,0)
 6005  while true
 6010    msstat(bi,ci,di,ei):mspos(bi,ci)
 6015      if bi>=256 then bi=256
 6016      if ci>=512 then ci=512
 6020      if ei= -1 then break
 6030      if di<>-1 then continue
 6040   home(0,bi,ci)
 6045   hm=bi:hn=ci
 6050  endwhile
 6060 endfunc
 7000 func kesu()
 7005 msbtn(0,0,0)
 7010 bmove()
 7170          fill(bmx+hm,bmy+hn,bmx1+hm,bmy1+hn,0)
 7200 endfunc
 8000 func _file()
 8001 str f_name,kk
 8002 color 5
 8009   locate 0,28:print space$(90)
 8010   locate 0,28:print"１．ｌｏａｄ　２．ｓａｖｅ ";:kk=_keysns0()
 8020   if kk="\\\" then return
 8021   locate 0,28:print space$(90)
 8022   locate 0,28:print"file name >";:f_name=_keysns0()
 8030   if kk="1" then g_load(f_name) else g_save(f_name)
 8040 color 7
 8045   locate 0,28:print space$(90)
 8050 endfunc
 8060 func g_load(noji;str)
 8065  fi=fopen(noji,"r")
 8070       if fi=-1 then {locate 0,28:beep:print"ファイルがありません"
 8074                                       for ci=0 to 5000:next:return()}
 8075  fread(gdat,65535,fi)
 8076 window(0,0,1023,1023)
 8080  put(0,0,1023,1023,gdat)
 8085 window(0,16,1023,1023)
 8090 endfunc
 8095 func g_save(noji;str)
 8096 ai=dskf(0)
 8097 if ai<524200 then {locate 0,28:beep:print"ﾃﾞｨｽｸ容量がたりません"
 8098                                      for ci=0 to 5000:next:return()}
 8100  fi=fopen(noji,"c")
 8120 window(0,0,1023,1023)
 8130  get(0,0,1023,1023,gdat)
 8135 window(0,16,1023,1023)
 8140  fwrite(gdat,65535,fi)
 8150  gi=0
 8160 endfunc
 9000   func insatu()
 9003 msbtn(0,0,0)
 9005  while true
 9010    msstat(bi,ci,di,ei)
 9020        if ei=-1 then return()
 9030        if di=-1  then break
 9035  endwhile
 9040  cls
 9045  /*  iocs(&H10,&H112,0,0,0,0,0)
 9050  while true
 9060    msstat(bi,ci,di,ei)
 9070        if di=-1  then break
 9085  endwhile
 9090  gamen()
 9095  cls
 9100  /*  iocs(&H10,&H110,0,0,0,0,0)
 9999  endfunc
10000 func gamen()
10010   color 7
10020   print"     ☆文字   ☆  線   ☆移動   ☆印刷   ☆複写   ☆箱消　 ☆線消   ☆ﾌｧｲﾙ   ☆ｽﾌﾟﾚｰ  ☆終了   "
10030   print string$(95,"~")
10035 console ,,0
10040 endfunc
11000 func ksen()
11010 while true
11020   msstat(bi,ci,di,ei):mspos(bi,ci)
11030       if ei=-1 then break
11040       if di<>-1 then continue
11050   fi=bi:gi=ci
11060   mspos(bi,ci)
11070    line(fi+hm,gi+hn,bi+hm,ci+hn,0,&HFFFF)
11080 endwhile
11090 endfunc
13000 func spray()
13005 int spx,spy
13010 while true
13020   msstat(bi,ci,di,ei):mspos(bi,ci)
13030     if ei=-1 then break
13040     if di<>-1 then continue
13050   for fi=1 to 5
13060     spx=bi-5+rand()/3276
13070     spy=ci-5+rand()/3276
13080     pset(spx+hm,spy+hn,15)
13090   next
13100 endwhile
13110 endfunc
14000 func gcopy()
14005 msbtn(0,0,0)
14006 int cx,cy,mx,my,x,y,l,r,i
14010 /*while true
14020 /*msstat(bi,ci,di,ei):mspos(bi,ci)
14030 /*  if ei=-1 then break
14040 /*  if di<>-1 then continue
14045 bmove()
14050 get(bmx+hm,bmy+hn,bmx1+hm,bmy1+hn,vv)
14060 cx=bmx1-bmx:cy=bmy1-bmy
14070 /* apage(0)
14080 while l=0
14090  msstat(x,y,l,r)
14100  mspos(mx,my)
14110  /*box(mx+hm,my+hn,mx+cx+hm,my+cy+hn,2)
14120  for i=0 to 100:next
14130  /*box(mx+hm,my+hn,mx+cx+hm,my+cy+hn,0)
14135   endwhile
14140 /*apage(0)
14150 put(mx+hm,my+hn,mx+cx+hm,my+cy+hn,vv)
14160  for i=0 to 1000:next
14998 /*endwhile
14999 endfunc
15000 func bmove()
15010 int x,y,l,r,i
15020 /*apage(0)
15030 while l=0
15040  msstat(x,y,l,r)
15050   endwhile
15060 mspos(bmx,bmy)
15070 while l=-1
15080  msstat(x,y,l,r)
15090 mspos(bmx1,bmy1)
15100 /* box(bmx+hm,bmy+hn,bmx1+hm,bmy1+hn,2)
15110  for i=0 to 100:next
15120 /* box(bmx+hm,bmy+hn,bmx1+hm,bmy1+hn,0)
15130   endwhile
15140 /*apage(1)
15999 endfunc
16000 func str _keysns0()
16005 int fl,del,x,y
16010   str f_name,kk
16020   while true
16030     kk= inkey$
16040     if kk=chr$(27) then return("\\\")
16050     if kk=chr$(8) then {
16060     fl=len(f_name)
16070     f_name=left$(f_name,fl-1)
16080     kk="":del=1}
16090     if kk=chr$(13) then break
16100     f_name=f_name+kk
16101    print kk;
16105    if del=1 then locate pos-1,csrlin else locate pos,csrlin
16110   endwhile
16120 return(f_name)
16139 endfunc
