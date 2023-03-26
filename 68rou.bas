10 /* 図形ワ－ドプロセッサ－/*
20 /*    Ｘ－六八郎 Jr.     /*
30 /* Copyright NankinSoft /*   Programed by Awed  Ver 0.3
   40 screen 2,0,1,1
   50 int true=1
   60 int ai,bi,ci,di,ei,fi,gi,hi,ii,ji
   70 str noji[256]
   80 dim float gdat(65535)
  200 vpage(1):window(0,0,1023,1023)
  210 mouse(0)
  215  iocs(&H7D,0,0,0,0,0,0)
  220 msarea(0,0,767,511)
  240 mouse(1)
  250 setmspos(0, 32)
  300 gamen()
  305 /*goto 20000
  310 chkmouse()
  999 end
 1000 func moji()
 1005 msbtn(0,0,0)
 1010   while true
 1020     msstat(bi,ci,di,ei):mspos(bi,ci)
 1030           if ei=-1 then break
 1040           if di<>-1 then continue
 1045      locate 0,28:print space$(90)
 1050      locate 0,28:linput noji
 1060      symbol(bi,ci,noji,1,1,2,15,0)
 1070      fi=bi+12*strlen(noji):if fi>760  then fi=0:ci=ci+24
 1080      setmspos(fi,ci)
 1090   endwhile
 1100      locate 0,28:print space$(90)
 1999 endfunc
 2000 func owari()
 2005 msbtn(0,0,0)
 2010 locate 23,15:print"右ボタンで、終了します "
 2030 while true
 2040  msstat(ai,bi,ci,di)
 2050    if di=-1 then screen 2,0,1,1:mouse(0):end
 2060    if ci=-1 then break
 2070 endwhile
 2074 locate 23,15:print"                       "
 2075 msbtn(0,0,0):return()
 2080 endfunc
 3000 func chkmouse()
 3010 while true
 3100 msstat(ai,bi,ci,di):mspos(ai,bi)
 3110    if ci<>-1 then continue
 3120 if ai>40   and  ai<56   and bi>0     and bi<16    then locate 5,0:print"★":moji():locate 5,0:print"☆"
 3130 if ai>110  and  ai<128  and bi>0     and bi<16    then locate 14,0:print"★":sen():locate 14,0:print"☆"
 3140 if ai>184  and  ai<197  and bi>0     and bi<16    then locate 23,0:print"★":idou():locate 23,0:print"☆"
 3150 if ai>249  and  ai<261  and bi>0     and bi<16    then locate 31,0:print"★":insatu():locate 31,0:print"☆"
 3160 if ai>368  and  ai<382  and bi>0     and bi<16    then locate 46,0:print"★":kesu():locate 46,0:print"☆"
 3165 if ai>511  and  ai<527  and bi>0     and bi<16    then locate 64,0:print"★":owari():locate 64,0:print"☆"
 3166 if ai>431  and  ai<444  and bi>0     and bi<16    then locate 54,0:print"★":_file():locate 54,0:print"☆"
 3170 endwhile
 3180 endfunc
 4000 func sen()
 4020 while true
 4030   msstat(bi,ci,di,ei):mspos(bi,ci)
 4040       if ei=-1 then break
 4050       if di<>-1 then continue
 4060   fi=bi:gi=ci
 4070   msbtn(1,0,0):mspos(bi,ci)
 4080    line(fi,gi,bi,ci,15,&HFFFF)
 4090 endwhile
 4100 endfunc
 4999 func _box()
 5000 int ai=1,bi,ci,di,ei,fi,gi,hi,ii,ji,ki,li
 5070 while ai
 5080     msstat(bi,ci,di,ei)
 5090          if ei=-1 then break
 5100          if di<>-1 then continue
 5110     mspos(ki,li)
 5115      ii=ki:ji=li
 5120   while ai
 5130     msstat(bi,ci,di,ei)
 5140          if di=-1 then break
 5150     box(ki,li,ii,ji,0,&HFFFF)
 5155          if di=-1 then break
 5170     mspos(gi,hi)
 5180     box(ki,li,gi,hi,12,&HFFFF)
 5190      ii=gi:ji=hi
 5200   endwhile
 5210 endwhile
 5220 endfunc
 6000 func idou()
 6005  while true
 6010    msstat(bi,ci,di,ei):mspos(bi,ci)
 6015      if bi>=256 then bi=256
 6016      if ci>=512 then ci=512
 6020      if ei= -1 then break
 6030      if di<>-1 then continue
 6040   home(0,bi,ci)
 6050  endwhile
 6060 endfunc
 7000 func kesu()
 7005 msbtn(0,0,0)
 7010   while true
 7020     msstat(bi,ci,di,ei)
 7030             if ei=-1 then break
 7040             if di<>-1 then continue
 7050     fi=msbtn(1,0,0)
 7060          if fi>70 then continue
 7070     msbtn(0,0,0):msbtn(1,0,0)
 7080     mspos(ii,ji)
 7090        while true
 7095     msstat(bi,ci,di,ei)
 7100             if ei=-1 then break
 7110             if di<>-1 then continue
 7120 /*  fi=msbtn(1,0,0)
 7130 /*        if fi>70 then continue
 7140     msbtn(0,0,0):msbtn(1,0,0)
 7150     mspos(gi,hi)
 7160          box(ii,ji,gi,hi,1)
 7170          fill(ii,ji,gi,hi,0)
 7180       endwhile
 7190   endwhile
 7200 endfunc
 8000 func _file()
 8001 gi=1
 8005 while gi
 8009   locate 0,20:print space$(90)
 8010   locate 0,20:input"１．ｌｏａｄ　２．ｓａｖｅ";ai
 8020   if ai>2 or ai<1 then continue
 8021   locate 0,20:print space$(90)
 8022   locate 0,20:input"file name ";noji
 8030   if ai=1 then g_load(noji) else g_save(noji)
 8040 endwhile
 8045   locate 0,20:print space$(90)
 8050 endfunc
 8060 func g_load(noji;str)
 8065  fi=fopen(noji,"r")
 8070       if fi=-1 then locate 0,20:print"ファイルがありません":return()
 8075  fread(gdat,65535,fi)
 8080  put(0,0,1023,1023,gdat)
 8085  gi=0
 8090 endfunc
 8095 func g_save(noji;str)
 8100  fi=fopen(noji,"c")
 8130  get(0,0,1023,1023,gdat)
 8140  fwrite(gdat,65535,fi)
 8150  gi=0
 8160 endfunc
 9000   func insatu()
 9010 /*  ?"印刷中!!!!"
 9020   /*
 9030 /*
 9040 /*
 9050 endfunc
10000 func gamen()
10010   color 3
10020   print"     ☆文字   ☆  線   ☆移動  ☆印刷         ☆消去  ☆ﾌｧｲﾙ    ☆終了            "
10030   print"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
10035 console ,,0
10040 endfunc
20000 mouse(0)
20010 msarea(0,0,767,511):mouse(1)
20015 while 1
20020 locate 20,15:print ai,bi
20025 mspos(ai,bi)
20030 endwhile
