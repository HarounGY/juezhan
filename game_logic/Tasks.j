//--------------------------
//��Ϸ�е�����
//--------------------------

//��С����������
function IJ takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())=='I025'))
endfunction
function lJ takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local player p = GetOwningPlayer(u)
	local integer i = 1 + GetPlayerId(p)
	local location loc = null
	if((O7[i]==0))then
		if((GetRandomInt(1,100)<=35))then
			set loc = GetRectCenter(Pe)
			set O7[i]=1
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC������һ���ϵ�Ů����ר���͸������ǹ����ģ����ܰ�����һ����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�������������ǵ�|cFFADFF2F����|r\n")
			call PingMinimapLocForForce(ov(p),loc,5.)
			call RemoveLocation(loc)
		elseif((GetRandomInt(1,70)<=35))then
			set loc = GetRectCenter(Qe)
			set O7[i]=2
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC�Ա��������Ұ�Ǿ�����Ϯ���������ܰ���������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F6ֻҰ��|r\n")
			call PingMinimapLocForForce(ov(p),loc,5.)
			call RemoveLocation(loc)
		else
			set O7[i]=3
			set loc = GetRectCenter(Re)
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC��˵�����µ������������ر�죬Ϊ�β�ȥ������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�������µ�|cFFADFF2F������|r������ͨ�����Ǵ���\n")
			call PingMinimapLocForForce(ov(p),loc,5.)
			call RemoveLocation(loc)
		endif
	elseif((O7[i]==1))then
		set loc = GetRectCenter(Pe)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC����ô������������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�������������ǵ�|cFFADFF2F����|r\n")
		call PingMinimapLocForForce(ov(p),loc,5.)
		call RemoveLocation(loc)
	elseif((O7[i]==2))then
		set loc = GetRectCenter(Qe)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC���������ɱ��Ұ�ǰ�|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F6ֻҰ��|r\n")
		call PingMinimapLocForForce(ov(p),loc,5.)
		call RemoveLocation(loc)
	elseif((O7[i]==3))then
		set loc = GetRectCenter(Re)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC��˵�����µ������������ر�죬Ϊ�β�ȥ������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�������µ�|cFFADFF2F������|r������ͨ�����Ǵ���")
		call PingMinimapLocForForce(ov(p),loc,5.)
		call RemoveLocation(loc)
	elseif((O7[i]==4))then
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��С����|r |cFF99FFCC���Ѿ��������������")
	endif
	set u = null
	set p = null
	set loc = null
endfunction
//������������
function KJ takes nothing returns boolean
	return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(O7[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==1))
endfunction
function LJ takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local player p = GetOwningPlayer(u)
	local integer i = 1 + GetPlayerId(p)
	if GetRandomInt(1, 100) <= 85 then
		call unitadditembyidswapped('I024',GetTriggerUnit())
	else
		call unitadditembyidswapped('I0CH',GetTriggerUnit())
	endif
	call AddHeroXP(u,100,true)
	set shengwang[i]=shengwang[i]+$A
	call PlaySoundOnUnitBJ(Hh,100,u)
	call DisplayTextToPlayer(p,0,0,("|CFF34FF00��������þ���+100����������+10��"+GetItemName(bj_lastCreatedItem)))
	set O7[i]=4
	set u = null
	set p = null
endfunction
//ɱ�����񡪡���ͭ��
function TI takes nothing returns boolean
	return((GetUnitTypeId(GetTriggerUnit())=='nwlt'))
endfunction
function UI takes nothing returns nothing
	local unit u = GetKillingUnit()
	local player p = GetOwningPlayer(u)
	local integer i = 1 + GetPlayerId(p)
	if((O7[i]==2))then
		set P7[i]=(P7[i]+1)
		if((P7[i]>=6))then
			set P7[i]=0
			set O7[i]=4
			if GetRandomInt(1, 100) <= 85 then
				call unitadditembyidswapped('I020',GetTriggerUnit())
			else
				call unitadditembyidswapped('I0CI',GetTriggerUnit())
			endif
			call AddHeroXP(GetKillingUnit(),100,true)
			set shengwang[i]=shengwang[i]+50
			call PlaySoundOnUnitBJ(Hh,100,GetKillingUnit())
			call DisplayTextToPlayer(p,0,0,("|CFF34FF00��������þ���+100����������+50��"+GetItemName(bj_lastCreatedItem)))
		else
			call DisplayTextToPlayer(p,0,0,("Ұ�ǣ�"+(I2S(P7[i])+" / 6")))
		endif
	endif
	set u = null
	set p = null
endfunction
//������������������������
function NJ takes nothing returns boolean
	return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(O7[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==3))
endfunction
function OJ takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local player p = GetOwningPlayer(u)
	local integer i = 1 + GetPlayerId(p)
	call unitadditembyidswapped('I06H',GetTriggerUnit())
	call AddHeroXP(u,100,true)
	set shengwang[i]=shengwang[i]+$A
	call PlaySoundOnUnitBJ(Hh,100,u)
	call DisplayTextToPlayer(p,0,0,("|CFF34FF00��������þ���+100����������+10��"+GetItemName(bj_lastCreatedItem)))
	set O7[i]=4
	set u = null
	set p = null
endfunction
//Ѱ����Ʒ
globals
	integer array xunwu
	integer array yangshou
	integer array udg_yangshou
endglobals
function IsWuPin takes nothing returns boolean
	return UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO) and GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER and GetItemTypeId(GetManipulatedItem())=='I0BB'
endfunction
function LookForWuPin takes nothing returns nothing
	local unit u =GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	local integer id = LoadInteger(YDHT, GetHandleId(p), StringHash("item"))
	local string s
	if (xunwu[i]==0)then
		if xiuxing[i]<=2 then
			if GetRandomInt(1, 2)==1 then
				set id = ZhuangBei[GetRandomInt(1, 6)]
			else
				set id = ShiPin[GetRandomInt(1, 18)]
			endif
		elseif xiuxing[i]<=4 then
			if GetRandomInt(1, 2)==1 then
				set id = ZhuangBei[GetRandomInt(7, 9)]
			else
				set id = ShiPin[GetRandomInt(9, 33)]
			endif
		else
			if GetRandomInt(1, 3)==1 then
				set id = ZhuangBei[GetRandomInt(10, 14)]
			else
				set id = ShiPin[GetRandomInt(34, 44)]
			endif
		endif
		set xunwu[i]=1
		call SaveInteger(YDHT, GetHandleId(p), StringHash("item"), id)
		call createitemloc(id,v7[$B])
		set s = GetItemName(bj_lastCreatedItem)
		call RemoveItem(bj_lastCreatedItem)
		call PlaySoundOnUnitBJ(bh,100,u)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCC����Ҫ"+s+"�����ܰ�������ô|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC��������Ѱ��|cFFADFF2F"+s+"|r\n")
	else
		call createitemloc(id,v7[$B])
		set s = GetItemName(bj_lastCreatedItem)
		call RemoveItem(bj_lastCreatedItem)
		call PlaySoundOnUnitBJ(bh,100,u)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCC�����ҵ�"+s+"����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC��������Ѱ��|cFFADFF2F"+s+"|r\n")
	endif
	set u = null
	set p = null
endfunction
function IsFangQiWuPin takes nothing returns boolean
	return UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO) and GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER and GetItemTypeId(GetManipulatedItem())=='I0BC'
endfunction
function FangQiWuPin takes nothing returns nothing
	local unit u =GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	if (xunwu[i]==0)then
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCC��ǰû�н�����Ŷ|r\n")
	else
		set shengwang[i] = shengwang[i] - 100
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCC���ô�������Ȼ�Ҳ���СŮ����Ҫ�Ķ�����|r\n")
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00����������������100|r\n")
		set xunwu[i]=0
	endif
	set u = null
	set p = null
endfunction
function IsWanChengWuPin takes nothing returns boolean
	return UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO) and GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER and GetItemTypeId(GetManipulatedItem())=='I0BD'
endfunction
function WanChengWuPin takes nothing returns nothing
	local unit u =GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	local integer id = LoadInteger(YDHT, GetHandleId(p), StringHash("item"))
	if xunwu[i]==1 and UnitHaveItem(u, id) and id != 0 then
		call RemoveItem(FetchUnitItem(u, id))
		set shengwang[i] = shengwang[i] + 40 * (xiuxing[i]+1)
		call AddHeroXP(udg_hero[i],15*GetHeroLevel(udg_hero[i])*GetHeroLevel(udg_hero[i])*(xiuxing[i]+1),true)
		set xunwu[i]=0
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCCлл��İ���|r\n")
		if GetRandomInt(1, 10)<=xiuxing[i]+1 then
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00������񣬽�������"+I2S(40 * (xiuxing[i]+1))+"�㣬����"+I2S(15*GetHeroLevel(udg_hero[i])*GetHeroLevel(udg_hero[i])*(xiuxing[i]+1))+"��|r\n")
		else
			call unitadditembyidswapped('I04T',udg_hero[i])
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00������񣬽�������"+I2S(40 * (xiuxing[i]+1))+"�㣬����"+I2S(15*GetHeroLevel(udg_hero[i])*GetHeroLevel(udg_hero[i])*(xiuxing[i]+1))+"�㣬������һ��|r\n")
		endif
		if Ce[i]==6 then
			if udg_xbds[i]<9 then
				set udg_xbds[i] = udg_xbds[i]+1
				call DisplayTextToPlayer(p, 0, 0, "|CFF66FF00��ϲ�������"+I2S(udg_xbds[i])+"��Ѱ���������10�οɻ��Ѱ����ʦŶ")
			else
				if udg_xbdsbool[i] == false then
					set udg_xbdsbool[i] = true
					if udg_zhangmen[i]==true then
					else
						call SaveStr(YDHT, GetHandleId(p), GetHandleId(p),"��Ѱ����ʦ��"+LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
					endif
					call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 15, "|CFF66FF00��ϲ"+GetPlayerName(p)+"���Ѱ����ʦ")
					call SetPlayerName(p, "��Ѱ����ʦ��"+GetPlayerName(p))
				endif
			endif
		endif
	elseif xunwu[i]==1 then
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCC��û���ҵ�СŮ����Ҫ�Ķ�����|r\n")
	else
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���룺|r |cFF99FFCC��ǰû�н�����Ŷ|r\n")
	endif
	set u = null
	set p = null
endfunction
//ɱ��ϵͳ
function IsYangShou takes nothing returns boolean
	return UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO) and GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER and GetItemTypeId(GetManipulatedItem())=='I0BF'
endfunction
function KillYangShou takes nothing returns nothing
	local unit u =GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	local integer id = LoadInteger(YDHT, GetHandleId(p), StringHash("life"))
	local integer j = GetRandomInt(1,xiuxing[i]*3+3)
	local string s
	if (yangshou[i]==0)then
		set id=udg_yangshou[j]
		set yangshou[i]=1
		call SaveInteger(YDHT, GetHandleId(p), StringHash("life"), id)
		call SaveInteger(YDHT, GetHandleId(p), StringHash("life")*2, (j-1)/3)
		call CreateNUnitsAtLoc(1, id, Player(15), v7[$B], 270.)
		set s = GetUnitName(bj_lastCreatedUnit)
		call RemoveUnit(bj_lastCreatedUnit)
		call PlaySoundOnUnitBJ(bh,100,u)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ο���|r |cFF99FFCC�Ϸ�ҹ������"+s+"�����Ѿ�����ȥ���Ϸ�����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�����ο����|cFFADFF2F"+s+"|r\n")
	else
		call CreateNUnitsAtLoc(1, id, Player(15), v7[$B], 270.)
		set s = GetUnitName(bj_lastCreatedUnit)
		call RemoveUnit(bj_lastCreatedUnit)
		call PlaySoundOnUnitBJ(bh,100,u)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ο���|r |cFF99FFCC���"+s+"����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�����ο����|cFFADFF2F"+s+"|r\n")
	endif
	set u = null
	set p = null
endfunction
function IsFangQiYangShou takes nothing returns boolean
	return UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO) and GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER and GetItemTypeId(GetManipulatedItem())=='I0BE'
endfunction
function FangQiYangShou takes nothing returns nothing
	local unit u =GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	if (yangshou[i]==0)then
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ο���|r |cFF99FFCC��ǰû�н�����|r\n")
	else
		set shengwang[i] = shengwang[i] - 100
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ο���|r |cFF99FFCC���ô��������������һ��Сආ�|r\n")
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00����������������100|r\n")
		set yangshou[i]=0
	endif
	set u = null
	set p = null
endfunction
function IsWanChengYangShou takes nothing returns boolean
	return GetUnitTypeId(GetTriggerUnit()) == LoadInteger(YDHT, GetHandleId(GetOwningPlayer(GetKillingUnit())), StringHash("life")) and yangshou[1+GetPlayerId(GetOwningPlayer(GetKillingUnit()))]==1
endfunction
function WanChengYangShou takes nothing returns nothing
	local unit u =GetKillingUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	local integer id = LoadInteger(YDHT, GetHandleId(p), StringHash("life"))
	local integer j = GetRandomInt(40, 60)
	local integer l = LoadInteger(YDHT, GetHandleId(p), StringHash("life")*2)
	set shengwang[i] = shengwang[i] +  j * (l+1)
	call AdjustPlayerStateBJ(5000 * (l+1), p, PLAYER_STATE_RESOURCE_GOLD)
	call AdjustPlayerStateBJ(10 * (l+1),  p, PLAYER_STATE_RESOURCE_LUMBER)
	//call AddHeroXP(udg_hero[i],200*GetHeroLevel(udg_hero[i])*GetHeroLevel(udg_hero[i])*(xiuxing[i]+1),true)

	set yangshou[i]=0
	if GetRandomInt(1, 10)<=l+1 then
		call unitadditembyidswapped('I04T',udg_hero[i])
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00������񣬽�������"+I2S(j * (l+1))+"�㣬��Ǯ"+I2S(5000 * (l+1))+"����ϡ��"+I2S(10 * (l+1))+"��������һ��|r\n")
	else
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00������񣬽�������"+I2S(j * (l+1))+"�㣬��Ǯ"+I2S(5000 * (l+1))+"����ϡ��"+I2S(10 * (l+1)))
	endif
	set u = null
	set p = null
endfunction
//������������͵��������Ѱ�����
function IsQiuHun takes nothing returns boolean
	return(UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())=='I09T' or GetItemTypeId(GetManipulatedItem())=='I09U' or GetItemTypeId(GetManipulatedItem())=='I09L' or GetItemTypeId(GetManipulatedItem())=='I09M' or GetItemTypeId(GetManipulatedItem())=='I0AW' or GetItemTypeId(GetManipulatedItem())=='I0AT' or GetItemTypeId(GetManipulatedItem())=='I0AV')
endfunction
function QiuHun_Action takes nothing returns nothing
	local unit u=GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	if GetItemTypeId(GetManipulatedItem())=='I09T' then
		if(qiuhun[i]==0)then
			set qiuhun[i]=1
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC��Ҫ�̹����ֵܾ����澭���������ض���飬���Ǿ����澭ͻȻ�Ҳ�����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�����ܲ�ͨѰ��|cFFADFF2F�����澭���¾������澭�;����׹�צ��|r\n")
		else
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC�����ҵ���������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�����ܲ�ͨѰ��|cFFADFF2F�����澭���¾������澭�;����׹�צ��|r\n")
		endif
	elseif GetItemTypeId(GetManipulatedItem())=='I0AT' and udg_runamen[i]==2 then
		if(zhaoyangguo[i]==0)then
			set zhaoyangguo[i]=1
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00С��Ů��|r |cFF99FFCC���������������������佻����������֪����û������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC����С��Ů�ҵ�|cFFADFF2F���|r\n")
			call unitadditembyidswapped('I0AU', u)
		elseif(zhaoyangguo[i]==1)then
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00С��Ů��|r |cFF99FFCC������������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC����С��Ů�ҵ�|cFFADFF2F���|r\n")
		else
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00С��Ů��|r |cFF99FFCC��л���������������ҵ��˹���|r\n")
		endif
	elseif GetItemTypeId(GetManipulatedItem())=='I0AV' and udg_runamen[i]==2 then
		if(zhaoyangguo[i]==0)then
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�㻹û�е�С��Ů��������|r\n")
		elseif(zhaoyangguo[i]==1)then
			if UnitHaveItem(u, 'I0AU') then
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�����|r |cFF99FFCC̫���ˣ��ù�û������лл�������Ȿ�����͸�����|r\n")
				call RemoveItem(FetchUnitItem(u,'I0AU'))
				call unitadditembyidswapped('I065', u)
				set zhaoyangguo[i]=2
			else
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�����|r |cFF99FFCC�ù��Ѿ���ȥ���꣬�������Ŀ�С���ں�������|r\n")
			endif
		else
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�����|r |cFF99FFCC��л���������������ҵ��˹ù�|r\n")
		endif
	elseif GetItemTypeId(GetManipulatedItem())=='I09U' then
		if(touxiao[i]==0)then
			set touxiao[i]=1
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC����а���ҹ�����þã����촵�ﷳ���ˣ����ܰ��Ұ���������͵����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�����ܲ�ͨ͵��|cFFADFF2F����|r\n")
		else
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC����͵����������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�����ܲ�ͨ͵��|cFFADFF2F����|r\n")
		endif
	elseif GetItemTypeId(GetManipulatedItem())=='I09L' then
		if GetUnitAbilityLevel(u, 'A0D1')>=1 then
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCCС�ӣ����Ѿ����մ��书��")
		else
			if  UnitHaveItem(u,'I03I') and GetUnitAbilityLevel(u, 'A07S')>=1 and wuxing[i]>=35 then
				call RemoveItem(FetchUnitItem(u,'I03I'))
				call unitadditembyidswapped('I09J', u)
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC�������ʲ�������⼸ҳ���Ǵݼ���ץ����ϰ����|r\n")
			else
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCCС�ӣ������������|r\n")
			endif
		endif
	elseif GetItemTypeId(GetManipulatedItem())=='I0AW' and linganran[i]==0 then
		if GetUnitAbilityLevel(u, 'A07G')>=1 then
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�����|r |cFF99FFCC���������Ѿ����մ��书��")
		else
			if  fuyuan[i]>=25 and wuxing[i]>=25 then
				call unitadditembyidswapped('I039', u)
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�����|r |cFF99FFCC�������ʲ����Ȿ��Ȼ�����Ƶ��ؼ��͸�����|r\n")
				set linganran[i] = 1
			else
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�����|r |cFF99FFCC�����������������|r\n")
			endif
		endif
	elseif GetItemTypeId(GetManipulatedItem())=='I09M' then
		if GetUnitAbilityLevel(u, 'A0D4')>=1 then
			call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���߹���|r |cFF99FFCC�����ˣ����Ѿ����մ��书��")
		else
			if  UnitHaveItem(u,'I02X') and yishu[i]>=35 then
				call RemoveItem(FetchUnitItem(u,'I02X'))
				call unitadditembyidswapped('I09H', u)
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���߹���|r |cFF99FFCC�������ʲ�������⼸ҳ����ҽ��ƪ����ϰ����|r\n")
			else
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00���߹���|r |cFF99FFCC�����ˣ������������|r\n")
			endif
		endif
		call ShowUnitHide(gg_unit_n00E_0066)
	endif
	set u=null
	set p=null
endfunction
function IsQiuHunWan takes nothing returns boolean
	return(UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER) and ((qiuhun[1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]==1 and UnitHaveItem(GetTriggerUnit(),'I02X') and UnitHaveItem(GetTriggerUnit(),'I03I'))or (touxiao[1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]==1 and UnitHaveItem(GetTriggerUnit(),'I0A1')))
endfunction
function QiuHunWanCheng takes nothing returns nothing
	local unit u=GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	//call BJDebugMsg("��û�У�")
	if qiuhun[i]==1 and UnitHaveItem(u,'I02X') and UnitHaveItem(u,'I03I') then
		set L7[i] = 1
		loop
			exitwhen L7[i] > wugongshu[i]
			if (I7[(i-1)*20+L7[i]]!='AEfk')then
				if L7[i]==wugongshu[i] then
					call RemoveItem(FetchUnitItem(u,'I02X'))
					call RemoveItem(FetchUnitItem(u,'I03I'))
					call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC����С�ӣ���Ȼ�����ҵ��ˣ�����������ܣ��Ұ����������ܵķ��Ŵ����㣬������������ܾͲ���Ҫ����֮ʯ��|r\n")
					set udg_yiwang[i]=true
					set qiuhun[i]=0
					exitwhen true
				endif
			else
				call UnitAddAbility(u,'A017')
				set I7[(((i-1)*20)+L7[i])]='A017'
				call RemoveItem(FetchUnitItem(u,'I02X'))
				call RemoveItem(FetchUnitItem(u,'I03I'))
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC����С�ӣ���Ȼ�����ҵ��ˣ�����������ܣ�������ʮ��·����ȭ��������|r\n")
				call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|CFFFF0033��ϲ"+GetPlayerName(p)+"ϰ�ÿ���ȭ")
				set qiuhun[i]=0
				exitwhen true
			endif
			set L7[i] = L7[i] + 1
		endloop
	elseif touxiao[i]==1 and UnitHaveItem(u,'I0A1') then
		set L7[i] = 1
		loop
			exitwhen L7[i] > wugongshu[i]
			if (I7[(i-1)*20+L7[i]]!='AEfk')then
				if L7[i]==wugongshu[i] then
					call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCCС�ӣ���ѧ���书̫���ˣ�����һЩ�ٹ������Ұ�|r\n")
					exitwhen true
				endif
			else
				call UnitAddAbility(u,'A018')
				set I7[(((i-1)*20)+L7[i])]='A018'
				call RemoveItem(FetchUnitItem(u,'I0A1'))
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC����С�ӣ���Ȼ����͵���ˣ�����������ܣ��ҰѴӻ���а��͵ѧ�ı̺�������������|r\n")
				call DisplayTextToForce(bj_FORCE_ALL_PLAYERS,"|CFFFF0033��ϲ"+GetPlayerName(p)+"ϰ�ñ̺�������")
				call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC���������ʵ��һ���ѵõ����������͸����˰�|r\n")
				call unitadditembyidswapped('I09D',u)
				set touxiao[i]=0
				exitwhen true
			endif
			set L7[i] = L7[i] + 1
		endloop
	endif
	set u=null
	set p=null
endfunction
//---------�����������

//-------����ϵͳ-------
//³�н���������
function QJ takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227895898))
endfunction
function RJ takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]>=3))then
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFF0000���޷��ٽ�ȡ��������")
else
if((jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==0))then
if((GetRandomInt(1,100)<=35))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Bg))
set jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=1
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00³�нţ�|r |cFF99FFCCؤ���˽�����һ����ɣ������͸����鱨|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC���Ÿ�|cFFADFF2F����|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((GetRandomInt(1,70)<=35))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Xe))
set jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=2
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00³�нţ�|r |cFF99FFCCؤ���˽�����һ����ɣ������͸����鱨|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC���Ÿ�|cFFADFF2F��Ħ��ʦ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
set jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=3
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Pe))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00³�нţ�|r |cFF99FFCCؤ���˽�����һ����ɣ������͸����鱨|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC���Ÿ�|cFFADFF2F����\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
endif
endif
else
if((jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Bg))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00³�нţ�|r |cFF99FFCCؤ���˽�����һ����ɣ������͸����鱨|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC���Ÿ�|cFFADFF2F����|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==2))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Xe))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00³�нţ�|r |cFF99FFCCؤ���˽�����һ����ɣ������͸����鱨|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC���Ÿ�|cFFADFF2F��Ħ��ʦ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==3))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Pe))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00³�нţ�|r |cFF99FFCCؤ���˽�����һ����ɣ������͸����鱨|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC���Ÿ�|cFFADFF2F����\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
endif
endif
endif
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function TJ takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(jd[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==1))
endfunction
function UJ takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((GetRandomInt(1,50)<=25))then
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),0,0,500)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+500\n")
else
if((GetRandomInt(1,50)<=25))then
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),3,0,$C8)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+200")
else
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),2,0,30)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+30\n")
endif
endif
if((GetRandomInt(1,50)<=40))then
call unitadditembyidswapped(YaoCao[5],GetTriggerUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������һ��������")
endif
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),100,true)
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
set jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+$F)
call FlushChildHashtable(YDHT,id*cx)
endfunction
function WJ takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(jd[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==2))
endfunction
function XJ takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((GetRandomInt(1,50)<=25))then
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),0,0,500)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+500\n")
else
if((GetRandomInt(1,50)<=25))then
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),3,0,$C8)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+200")
else
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),2,0,30)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+30\n")
endif
endif
if((GetRandomInt(1,50)<=40))then
call unitadditembyidswapped(YaoCao[5],GetTriggerUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������һ��������")
endif
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),100,true)
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
set jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+$F)
call FlushChildHashtable(YDHT,id*cx)
endfunction
function ZJ takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(jd[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==3))
endfunction
function dK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((GetRandomInt(1,50)<=25))then
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),0,0,500)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+500\n")
else
if((GetRandomInt(1,50)<=25))then
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),3,0,$C8)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+200")
else
call YDWEGeneralBounsSystemUnitSetBonus(GetTriggerUnit(),2,0,30)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������þ���+100����������+15������+30\n")
endif
endif
if((GetRandomInt(1,50)<=40))then
call unitadditembyidswapped(YaoCao[5],GetTriggerUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������һ��������")
endif
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),100,true)
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
set jd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(kd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+$F)
call FlushChildHashtable(YDHT,id*cx)
endfunction
function fK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227895352))
endfunction
//��ɱҰ������
function gK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((e8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==0))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Se))
set e8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=1
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00Ү���룺|r |cFF99FFCC��һ���ᰮ���ԣ�ƽʱ��ʱ��ͻ�����������֣���Ը��һͬǰ����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC��ɱɽ���е�|cFFADFF2FҰ������|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((e8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Se))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00���Ѿ�����������\n|cFFFFCC00��ʾ��|r |cFF99FFCC��ɱɽ���е�|cFFADFF2FҰ������|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function iK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227895353))
endfunction
//��ԶͼѺ������
function jK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==0))then
if((GetRandomInt(1,70)<=$A))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Te))
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=1
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸�ȫ��̵������Ű�|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ��ȫ��̵�|cFFADFF2F�𴦻�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((GetRandomInt(1,60)<=$A))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Ue))
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=2
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCCȫ���ɽ�¸����Ĳ��Ǿ�����û�����ڳ�������ǰ������������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ��ȫ���ɽ�µ�ɱ��10ֻ|cFFADFF2F����|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((GetRandomInt(1,50)<=$A))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Ve))
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=3
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸��������Ľ�ݸ���|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ���������|cFFADFF2FĽ�ݸ�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((GetRandomInt(1,40)<=$A))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(We))
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=4
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC�������Ы����������û�����ڳ�������ǰ������������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ���������ɱ��3ֻ|cFFADFF2FЫ����|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((GetRandomInt(1,30)<=$A))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Xe))
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=5
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸������µĴ�Ħ��ʦ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�������µ�|cFFADFF2F��Ħ��ʦ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((GetRandomInt(1,20)<=$A))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Ye))
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=6
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸����Źص��Ƿ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�����Źص�|cFFADFF2F�Ƿ�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=7
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Je))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC����а�̳���ɧ������ԭ���֣���ʱ�������һ����ɫ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC��ס�������ɣ�ɱ��10ֻ|cFFADFF2F�����������ͽ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
endif
endif
endif
endif
endif
endif
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Te))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸�ȫ��̵������Ű�|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ��ȫ��̵�|cFFADFF2F�𴦻�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==2))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Ue))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCCȫ���ɽ�¸����Ĳ��Ǿ�����û�����ڳ�������ǰ������������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ��ȫ���ɽ�µ�ɱ��10ֻ|cFFADFF2F����|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==3))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Ve))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸��������Ľ�ݸ���|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ���������|cFFADFF2FĽ�ݸ�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==4))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(We))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC�������Ы����������û�����ڳ�������ǰ������������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ���������ɱ��5ֻ|cFFADFF2FЫ����|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==5))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Xe))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸������µĴ�Ħ��ʦ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�������µ�|cFFADFF2F��Ħ��ʦ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==6))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Ye))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC������һ���ţ�������͸����Źص��Ƿ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCǰ�����Źص�|cFFADFF2F�Ƿ�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==7))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Je))
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC����а�̳���ɧ������ԭ���֣���ʱ�������һ����ɫ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC��ס�������ɣ�ɱ��10ֻ|cFFADFF2F�����������ͽ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
endif
endif
endif
endif
endif
endif
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function mK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(g8[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==1))
endfunction
function nK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+20������ֵ+300")
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+20)
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),300,true)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function pK takes nothing returns boolean
return((GetUnitTypeId(GetTriggerUnit())=='ngns')and(g8[(1+GetPlayerId(GetOwningPlayer(GetKillingUnit())))]==2))
endfunction
function qK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetKillingUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetKillingUnit())
set h8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(h8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((h8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]>=$A))then
set h8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
call PlaySoundOnUnitBJ(Hh,100,GetKillingUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+25������ֵ+300")
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+25)
call AddHeroXP(GetKillingUnit(),300,true)
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("���ǣ�"+(I2S(h8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)])+" / 10")))
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function sK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(g8[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==3))
endfunction
function tK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+20������ֵ+300")
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+20)
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),300,true)
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function vK takes nothing returns boolean
return((GetUnitTypeId(GetTriggerUnit())=='nanb')and(g8[(1+GetPlayerId(GetOwningPlayer(GetKillingUnit())))]==4))
endfunction
function wK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetKillingUnit()))))
set i8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(i8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((i8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]>=3))then
set i8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
call PlaySoundOnUnitBJ(Hh,100,GetKillingUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+30������ֵ+300")
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+30)
call AddHeroXP(GetKillingUnit(),300,true)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("Ы������"+(I2S(i8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)])+" / 3")))
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function yK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(g8[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==5))
endfunction
function zK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+20������ֵ+300")
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+20)
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),300,true)
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function aK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(g8[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==6))
endfunction
function BK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+20������ֵ+300")
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+20)
call AddHeroXP(LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0),300,true)
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function CK takes nothing returns boolean
return GetKillingUnit()!=null and ((g8[(1+GetPlayerId(GetOwningPlayer(GetKillingUnit())))]==7))
endfunction
function cK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetKillingUnit()))))
set j8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(j8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((j8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]>=$A))then
set j8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
call PlaySoundOnUnitBJ(Hh,100,GetKillingUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+30������ֵ+300")
set g8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+30)
call AddHeroXP(GetKillingUnit(),300,true)
set qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((GetRandomInt(1,35)<=(fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]-5)))then
call unitadditembyidswapped(gudong[GetRandomInt(1,3)],LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00����������븣Ե�йأ�̫���ˣ���Ȼ��������һ���Ŷ�")
endif
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("����а�̣�"+(I2S(j8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)])+" / 10")))
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function EK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227895364))
endfunction
function FK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((qd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]>=3))then
if((o8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==false))then
if((GetRandomInt(1,100)<=25))then
call unitadditembyidswapped('I01U',GetTriggerUnit())
set o8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=true
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00���"+GetItemName(bj_lastCreatedItem)))
else
if((GetRandomInt(1,60)<=20))then
call unitadditembyidswapped('I01Z',GetTriggerUnit())
set o8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=true
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00���"+GetItemName(bj_lastCreatedItem)))
else
if((GetRandomInt(1,60)<=30))then
call unitadditembyidswapped(1227895124,GetTriggerUnit())
set o8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=true
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00���"+GetItemName(bj_lastCreatedItem)))
else
call unitadditembyidswapped(1227895109,GetTriggerUnit())
set o8[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=true
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00���"+GetItemName(bj_lastCreatedItem)))
endif
endif
endif
call SaveLocationHandle(YDHT,id*cx,$1769D332,GetUnitLoc(GetTriggerUnit()))
if((GetRandomInt(1,$B4)<=$A))then
call createitemloc(1227895627,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,$AA)<=$A))then
call createitemloc(1227895385,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,$A0)<=$A))then
call createitemloc('I03D',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,$96)<=$A))then
call createitemloc(1227895382,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,$8C)<=$A))then
call createitemloc(1227895624,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,$82)<=$A))then
call createitemloc(1227895621,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,120)<=$A))then
call createitemloc(1227895603,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,110)<=$A))then
call createitemloc('I02W',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,100)<=$A))then
call createitemloc(1227895601,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,90)<=$A))then
call createitemloc('I03G',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,80)<=$A))then
call createitemloc('I02U',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,70)<=$A))then
call createitemloc(1227895626,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,60)<=$A))then
call createitemloc('I030',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,50)<=$A))then
call createitemloc('I02X',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,40)<=$A))then
call createitemloc('I03I',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,30)<=$A))then
call createitemloc('I02Z',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,20)<=$A))then
call createitemloc('I03L',LoadLocationHandle(YDHT,id*cx,$1769D332))
else
call createitemloc('I03F',LoadLocationHandle(YDHT,id*cx,$1769D332))
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00���"+GetItemName(bj_lastCreatedItem)))
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$1769D332))
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC���Ѿ����������\n")
endif
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00��Զͼ��|r |cFF99FFCC��Ҫ�������3��Ѻ������ſ�����ȡ����Ŷ")
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
//��ɱ�ܡ��һ������͵�����
function HK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227896132 or GetItemTypeId(GetManipulatedItem())=='I09W'))
endfunction
function IK takes nothing returns nothing
	local unit u=GetTriggerUnit()
	local player p=GetOwningPlayer(u)
	local integer i=1+GetPlayerId(p)
	local location loc=null
if GetItemTypeId(GetManipulatedItem())==1227896132 then
	if((rd[i]==0))then
		set loc=GetRectCenter(Nf)
		set rd[i]=1
		call PlaySoundOnUnitBJ(bh,100,u)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��쳣�|r |cFF99FFCC��һ��ʱ�����ܳ�û���ܸ����Ƥ���Ļ�Ӧ�ÿ��������ü�Ǯ|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F30ֻ��|r\n")
		call PingMinimapLocForForce(ov(p),loc,5.)
		call RemoveLocation(loc)
	elseif((rd[i]==1))then
		set loc=GetRectCenter(Nf)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00��쳣�|r |cFF99FFCC��һ��ʱ�����ܳ�û���ܸ����Ƥ���Ļ�Ӧ�ÿ��������ü�Ǯ|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F30ֻ��|r\n")
		call PingMinimapLocForForce(ov(p),loc,5.)
		call RemoveLocation(loc)
	elseif((rd[i]==2))then
		call DisplayTextToPlayer(p,0,0,"|cFfff0000����������Ѿ���ɹ���")
	endif
elseif GetItemTypeId(GetManipulatedItem())=='I09W' then
	if((LoadInteger(YDHT,StringHash("��������"),i)==0))then
		call SaveInteger(YDHT,StringHash("��������"),i,1)
		call PlaySoundOnUnitBJ(bh,100,u)
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCC����а�����ȴ�ϵ�ʱ���һ����ϵ�����һֱ�۸��ң����ܰ���ɱ��ʮ��������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2Fʮ������|r\n")
	elseif((LoadInteger(YDHT,StringHash("��������"),i)==1))then
		call DisplayTextToPlayer(p,0,0,"|cFFFFCC00�ܲ�ͨ��|r |cFF99FFCCɱ��ʮ����������|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2Fʮ������|r\n")
	endif
endif
endfunction

//��10���Զ�������ҩ
function PK takes nothing returns boolean
	return (GetTriggerUnit()==udg_hero[1] or GetTriggerUnit()==udg_hero[2] or GetTriggerUnit()==udg_hero[3] or GetTriggerUnit()==udg_hero[4] or GetTriggerUnit()==udg_hero[5])and GetUnitLevel(GetTriggerUnit())==10 and GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER
endfunction
function QK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
if((GetRandomInt(1,60)<=$A))then
call unitadditembyidswapped(1227895375,GetTriggerUnit())
else
if((GetRandomInt(1,50)<=$A))then
call unitadditembyidswapped(1227895370,GetTriggerUnit())
else
if((GetRandomInt(1,40)<=$A))then
call unitadditembyidswapped(1227895363,GetTriggerUnit())
else
if((GetRandomInt(1,30)<=$A))then
call unitadditembyidswapped(1227895368,GetTriggerUnit())
else
if((GetRandomInt(1,60)<=30))then
call unitadditembyidswapped(1227895369,GetTriggerUnit())
else
call unitadditembyidswapped(1227895365,GetTriggerUnit())
endif
endif
endif
endif
endif
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00��ϲ����10�������"+GetItemName(bj_lastCreatedItem)))
call FlushChildHashtable(YDHT,id*cx)
endfunction
//�ɼ��ϳ���
function SK takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227895890))
endfunction
function TK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((z9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==0))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Gg))
set z9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=1
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00�������ࣺ|r |cFF99FFCC��������黨�綾��������������취�Ⱦ�����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�ɼ�����ȸ����е�|cFFADFF2F�ϳ���|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((z9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(Gg))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00���Ѿ�����������\n|cFFFFCC00��ʾ��|r |cFF99FFCC�ɼ�����ȸ�����|cFFADFF2F�ϳ���|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
//�ɼ����ϳ���
function VK takes nothing returns nothing
	local integer id=GetHandleId(GetTriggeringTrigger())
	if((GetItemTypeId(GetEnumItem())=='I04S'))then
		call SaveInteger(YDHT,id*LoadInteger(YDHT,id,-$1317DA19),-$5E9EB4B3,(LoadInteger(YDHT,id*LoadInteger(YDHT,id,-$1317DA19),-$5E9EB4B3)+1))
		set a9[LoadInteger(YDHT,id*LoadInteger(YDHT,id,-$1317DA19),-$5E9EB4B3)]=GetEnumItem()
		set B9[LoadInteger(YDHT,id*LoadInteger(YDHT,id,-$1317DA19),-$5E9EB4B3)]=GetItemLoc(GetEnumItem())
	endif
endfunction
function WK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,0)
call EnumItemsInRectBJ(Gg,function VK)
call FlushChildHashtable(YDHT,id*cx)
endfunction
//�ϳ���
function YK takes nothing returns boolean
	return((GetItemTypeId(GetManipulatedItem())=='I04S'))
endfunction
function ZK takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call SaveItemHandle(YDHT,id*cx,$1769D332,GetManipulatedItem())
if((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO)==false))then
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if((GetManipulatedItem()==a9[bj_forLoopAIndex]))then
call createitemloc('I04S',B9[bj_forLoopAIndex])
set a9[bj_forLoopAIndex]=bj_lastCreatedItem
call DisplayTimedTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,15.,"|CFFFF0000ֻ�����������ɼ�")
endif
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
else
if((z9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
set A9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(A9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
if((A9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]>=$A))then
set z9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=2
set A9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00���������ǰ���������໻ȡ����")
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("�ϳ��ݣ�"+(I2S(A9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)])+" / 10")))
endif
call CreateNUnitsAtLoc(1,1752196449,Player(15),v7[1],bj_UNIT_FACING)
call ShowUnitHide(bj_lastCreatedUnit)
call UnitApplyTimedLife(bj_lastCreatedUnit,'BHwe',GetRandomReal(20.,25.))
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if((LoadItemHandle(YDHT,id*cx,$1769D332)==a9[bj_forLoopAIndex]))then
set b9[bj_forLoopAIndex]=bj_lastCreatedUnit
endif
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
else
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if((LoadItemHandle(YDHT,id*cx,$1769D332)==a9[bj_forLoopAIndex]))then
call createitemloc('I04S',B9[bj_forLoopAIndex])
set a9[bj_forLoopAIndex]=bj_lastCreatedItem
call DisplayTimedTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,15.,"|CFFFF0000����û�и�������Ѿ������")
endif
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
//��ɶϳ�������
function eL takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(z9[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==2))
endfunction
function fL takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call PlaySoundOnUnitBJ(Hh,100,GetTriggerUnit())
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
set z9[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+100)
if((GetRandomInt(1,40)<=20))then
call unitadditembyidswapped('I00X',GetTriggerUnit())
else
call unitadditembyidswapped('I00Y',GetTriggerUnit())
endif
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00������񽭺�����+100�������"+GetItemName(bj_lastCreatedItem)))
call FlushChildHashtable(YDHT,id*cx)
endfunction
function hL takes nothing returns boolean
return((GetUnitTypeId(GetTriggerUnit())==1752196449))
endfunction
function iL takes nothing returns nothing
set bj_forLoopAIndex=1
set bj_forLoopAIndexEnd=12
loop
exitwhen bj_forLoopAIndex>bj_forLoopAIndexEnd
if((GetTriggerUnit()==b9[bj_forLoopAIndex]))then
call createitemloc('I04S',B9[bj_forLoopAIndex])
set a9[bj_forLoopAIndex]=bj_lastCreatedItem
endif
set bj_forLoopAIndex=bj_forLoopAIndex+1
endloop
endfunction
//����Ү�ɳ���
function kL takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227896387))
endfunction
function mL takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((Sd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==0))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(gh))
set Sd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=1
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00����Ƽ��|r |cFF99FFCCҮ�ɳ��������ˣ����ܰ��æ��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC����Ү�ɳ��Ļ�|cFFADFF2F���ɹ�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call SaveLocationHandle(YDHT,id*cx,1231311908,GetRectCenter(hh))
call CreateNUnitsAtLoc(1,1853254706,GetOwningPlayer(GetTriggerUnit()),LoadLocationHandle(YDHT,id*cx,1231311908),bj_UNIT_FACING)
call IssuePointOrderByIdLoc(bj_lastCreatedUnit,$D0012,LoadLocationHandle(YDHT,id*cx,$5E83114F))
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,1231311908))
else
if((Sd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(gh))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00���Ѿ�����������\n|cFFFFCC00��ʾ��|r |cFF99FFCC����Ү�ɳ��Ļ�|cFFADFF2F���ɹ�|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00���Ѿ��������������ˣ������ظ���ȡ��")
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
function oL takes nothing returns boolean
return((GetUnitTypeId(GetTriggerUnit())==1853254706))
endfunction
function pL takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetTriggerPlayer())))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFF0000����ʧ����")
set Sd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
call PlaySoundOnUnitBJ(Gh,100,udg_hero[LoadInteger(YDHT,id*cx,-$5E9EB4B3)])
call FlushChildHashtable(YDHT,id*cx)
endfunction
function rL takes nothing returns boolean
return((GetUnitTypeId(GetTriggerUnit())==1853254706))
endfunction
function sL takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call PlaySoundOnUnitBJ(Hh,100,udg_hero[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))])
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
set Sd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=2
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+$96)
set juexuelingwu[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(juexuelingwu[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+1)
call RemoveUnit(GetTriggerUnit())
call AdjustPlayerStateBJ($7530,GetOwningPlayer(GetTriggerUnit()),PLAYER_STATE_RESOURCE_GOLD)
call AdjustPlayerStateBJ(20,GetOwningPlayer(GetTriggerUnit()),PLAYER_STATE_RESOURCE_LUMBER)
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00������񽭺�����+150������ý�Ǯ+30000��ϡ�б�+20����ѧ������+1")
call ShowUnitShow(gg_unit_nvl2_0005)
call FlushChildHashtable(YDHT,id*cx)
endfunction
//�߲��Թ�����
function uL takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227896388))
endfunction
function vL takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
if((Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==0))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(xg))
set Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=1
call PlaySoundOnUnitBJ(bh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00���˷|r |cFF99FFCC�ܶ����ֶ���������֮�󶼶㵽�˸߲��Թ���|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�ֱ�ɱ��|cFFADFF2F10��������ͽ�����ֶ�ͽ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==1))then
call SaveLocationHandle(YDHT,id*cx,$5E83114F,GetRectCenter(xg))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFFFFCC00���˷|r |cFF99FFCC�ܶ����ֶ���������֮�󶼶㵽�˸߲��Թ���|r\n|cFFFFCC00��ʾ��|r |cFF99FFCC�ֱ�ɱ��|cFFADFF2F10��������ͽ�����ֶ�ͽ|r\n")
call PingMinimapLocForForce(ov(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3)))),LoadLocationHandle(YDHT,id*cx,$5E83114F),5.)
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$5E83114F))
else
if((Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]==2))then
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|cFfff0000����������޷��ٽ�ȡ��")
endif
endif
endif
call FlushChildHashtable(YDHT,id*cx)
endfunction
// ��ɸ߲��Թ�����
function xL takes nothing returns boolean
return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(Td[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==1)and(Vd[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==$A)and(Ud[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==$A))
endfunction
function yL takes nothing returns nothing
local integer id=GetHandleId(GetTriggeringTrigger())
local integer cx=LoadInteger(YDHT,id,-$3021938A)
set cx=cx+3
call SaveInteger(YDHT,id,-$3021938A,cx)
call SaveInteger(YDHT,id,-$1317DA19,cx)
call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
if((GetRandomInt(1,50)<=fuyuan[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]))then
call SaveLocationHandle(YDHT,id*cx,$1769D332,GetUnitLoc(GetTriggerUnit()))
if((GetRandomInt(1,100)<=$A))then
call createitemloc(1227896370,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,90)<=$A))then
call createitemloc(1227896371,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,80)<=$A))then
call createitemloc(1227896369,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,70)<=$A))then
call createitemloc(1227896374,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,60)<=$A))then
call createitemloc(1227896372,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,50)<=$A))then
call createitemloc(1227896368,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,40)<=$A))then
call createitemloc(1227896377,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,30)<=$A))then
call createitemloc(1227896376,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
if((GetRandomInt(1,20)<=$A))then
call createitemloc(1227896375,LoadLocationHandle(YDHT,id*cx,$1769D332))
else
call createitemloc('I065',LoadLocationHandle(YDHT,id*cx,$1769D332))
endif
endif
endif
endif
endif
endif
endif
endif
endif
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$1769D332))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+200�;�ѧ������ʽ����һ��\n")
set Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
else
if((GetRandomInt(1,50)<=15))then
call unitadditembyidswapped(1227896390,GetTriggerUnit())
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+200�ͺ���������\n")
set Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
else
call SaveLocationHandle(YDHT,id*cx,$1769D332,GetUnitLoc(GetTriggerUnit()))
call createitemloc(gudong[GetRandomInt(4,9)],LoadLocationHandle(YDHT,id*cx,$1769D332))
call RemoveLocation(LoadLocationHandle(YDHT,id*cx,$1769D332))
call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,"|CFF34FF00��������ý�������+200�͹Ŷ�һ��")
set Td[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
endif
endif
set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+$C8)
set Vd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
set Ud[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
call FlushChildHashtable(YDHT,id*cx)
endfunction
//�ɹ���һ�ȷ�����+���Ȱ�������
function AL takes nothing returns boolean
	return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(GetItemTypeId(GetManipulatedItem())==1227896389 or GetItemTypeId(GetManipulatedItem())=='I0AN'))
endfunction
function aL takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local integer i = 1 + GetPlayerId(GetOwningPlayer(u))
	local location loc = GetRectCenter(mh)
	if (GetItemTypeId(GetManipulatedItem())==1227896389) then
		if (Wd[i]==0) then
			set Wd[i]=1
			call PlaySoundOnUnitBJ(bh,100,u)
			call DisplayTextToPlayer(GetOwningPlayer(u),0,0,"|cFFFFCC00�Ƿ壺|r |cFF99FFCC����ɹ����������ƺ��Դ���������ͼ��������ס�ɹ���һ�ȷ棬���ղ��ܱ���ս��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F�ɹ���һ�ȷ�|r\n")
			call PingMinimapLocForForce(bj_FORCE_ALL_PLAYERS, loc, 5.)
			call RemoveLocation(loc)
		else
			call DisplayTextToPlayer(GetOwningPlayer(u),0,0,"|cFFFFCC00�Ƿ壺|r |cFF99FFCC����ɹ����������ƺ��Դ���������ͼ��������ס�ɹ���һ�ȷ棬���ղ��ܱ���ս��|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F�ɹ���һ�ȷ�|r\n")
			call PingMinimapLocForForce(bj_FORCE_ALL_PLAYERS, loc, 5.)
			call RemoveLocation(loc)
		endif
	else
		if jiuazi[i]==0  then
			if udg_runamen[i]==10 then
				set jiuazi[i]=1
				call DisplayTextToPlayer(GetOwningPlayer(u),0,0,"|cFFFFCC00�Ƿ壺|r |cFF99FFCC���ϱ�����ͷץ���ˣ���Ӣ�۰��һ��ܶ�����ȳ�����|r\n|cFFFFCC00��ʾ��|r |cFF99FFCCɱ��|cFFADFF2F������|r\n")
			else
				call DisplayTextToPlayer(GetOwningPlayer(u),0,0,"|cFFFFCC00�Ƿ壺|r |cFF99FFCC�㲻�����������ˣ��޷��Ӵ�����|r\n")
			endif
		else
			call DisplayTextToPlayer(GetOwningPlayer(u),0,0,"|cFFFFCC00�Ƿ壺|r |cFF99FFCC�����������|r\n")
		endif
	endif
endfunction
function bL takes nothing returns boolean
	return((GetUnitTypeId(GetTriggerUnit())==1751543663) or (GetUnitTypeId(GetTriggerUnit())=='odkt') or (GetUnitTypeId(GetTriggerUnit())=='h00J'))
endfunction
function CL takes nothing returns nothing
	local player p = GetOwningPlayer(GetKillingUnit())
	local integer i = 1 + GetPlayerId(p)
	local location loc = GetUnitLoc(GetTriggerUnit())
	if GetUnitTypeId(GetTriggerUnit())==1751543663 and GetOwningPlayer(GetTriggerUnit())==Player(12) then
		if((Wd[i]==1))then
			set Wd[i]=2
			call DisplayTextToPlayer(p,0,0,"|CFF34FF00��ϲ�����ɹ���һ�ȷ棬����Ի�ȥ�콱����")
		elseif((Wd[i]==2))then
			call DisplayTextToPlayer(p,0,0,"|CFF34FF00���Ѿ�ɱ��������ˣ������Ȼ�ȥ�������")
		endif
	elseif GetUnitTypeId(GetTriggerUnit())=='odkt' then
		if jiuazi[i]==1 then
			set jiuazi[i]=2
			call DisplayTextToPlayer(p,0,0,"|CFF34FF00���ܶ������������")
			call CreateNUnitsAtLoc(1, 'h00J', Player(12), loc, bj_UNIT_FACING)
		endif
	elseif GetUnitTypeId(GetTriggerUnit())=='h00J' then
		call createitemloc('I0AM',loc)
		call SetItemUserData(bj_lastCreatedItem,GetRandomInt(1, 5)*$989680+GetRandomInt(1, 5)*$F4240+GetRandomInt(1, 5)*$186A0+GetRandomInt(1, 5)*$2710)
		call DisplayTextToPlayer(p,0,0,"|CFF34FF00���ܰ��ϣ������ľ����")
	endif
	call RemoveLocation(loc)
	set p = null
	set loc =null
endfunction

// ����ɹ���������
function DL takes nothing returns boolean
	return((UnitTypeNotNull(GetTriggerUnit(),UNIT_TYPE_HERO))and(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))==MAP_CONTROL_USER)and(Wd[(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit())))]==2))
endfunction
function EL takes nothing returns nothing
	local integer id=GetHandleId(GetTriggeringTrigger())
	local integer cx=LoadInteger(YDHT,id,-$3021938A)
	set cx=cx+3
	call SaveInteger(YDHT,id,-$3021938A,cx)
	call SaveInteger(YDHT,id,-$1317DA19,cx)
	call SaveInteger(YDHT,id*cx,-$5E9EB4B3,(1+GetPlayerId(GetOwningPlayer(GetTriggerUnit()))))
	call SaveUnitHandle(YDHT,id*cx,-$2EC5CBA0,GetTriggerUnit())
	call PlaySoundOnUnitBJ(Hh,100,LoadUnitHandle(YDHT,id*cx,-$2EC5CBA0))
	call unitadditembyidswapped(YaoCao[4],GetTriggerUnit())
	if((GetRandomInt(1,75)<=25))then
		//����ʯ
		call unitadditembyidswapped('I06K',GetTriggerUnit())
	else
		if((GetRandomInt(1,50)<=25))then
			//��׷�
			call unitadditembyidswapped('I06N',GetTriggerUnit())
		else
			//��͵��
			call unitadditembyidswapped('I06I',GetTriggerUnit())
		endif
	endif
	//����֮һ����˫������
	if (GetRandomInt(1,3)==1)then
		if((GetRandomInt(1,75)<=25))then
			//����ʯ
			call unitadditembyidswapped('I06K',GetTriggerUnit())
		else
			if((GetRandomInt(1,50)<=25))then
				//��׷�
				call unitadditembyidswapped('I06N',GetTriggerUnit())
			else
				//��͵��
				call unitadditembyidswapped('I06I',GetTriggerUnit())
			endif
		endif
	endif
	set shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=(shengwang[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]+250)
	set Wd[LoadInteger(YDHT,id*cx,-$5E9EB4B3)]=0
	call DisplayTextToPlayer(Player(-1+(LoadInteger(YDHT,id*cx,-$5E9EB4B3))),0,0,("|CFF34FF00��������ý�������+250��������һ����"+GetItemName(bj_lastCreatedItem)))
	call FlushChildHashtable(YDHT,id*cx)
endfunction

function Tasks_Trigger takes nothing returns nothing
	local trigger t = CreateTrigger()
	set Fo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Fo,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Fo,Condition(function IJ))
	call TriggerAddAction(Fo,function lJ)
	set Go=CreateTrigger()
	call TriggerAddRect(Go,Pe)
	call TriggerAddCondition(Go,Condition(function KJ))
	call TriggerAddAction(Go,function LJ)
	set Jn=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Jn,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(Jn,Condition(function TI))
	call TriggerAddAction(Jn,function UI)
	set Ho=CreateTrigger()
	call TriggerAddRect(Ho,Re)
	call TriggerAddRect(Ho,Ie)
	call TriggerAddRect(Ho,le)
	call TriggerAddCondition(Ho,Condition(function NJ))
	call TriggerAddAction(Ho,function OJ)
	// ɱ��ϵͳ
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_PICKUP_ITEM )
	call TriggerAddCondition(t, Condition(function IsWuPin))
	call TriggerAddAction(t, function LookForWuPin)
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_PICKUP_ITEM )
	call TriggerAddCondition(t, Condition(function IsFangQiWuPin))
	call TriggerAddAction(t, function FangQiWuPin)
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_PICKUP_ITEM )
	call TriggerAddCondition(t, Condition(function IsWanChengWuPin))
	call TriggerAddAction(t, function WanChengWuPin)
	// Ѱ��ϵͳ
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_PICKUP_ITEM )
	call TriggerAddCondition(t, Condition(function IsYangShou))
	call TriggerAddAction(t, function KillYangShou)
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_PICKUP_ITEM )
	call TriggerAddCondition(t, Condition(function IsFangQiYangShou))
	call TriggerAddAction(t, function FangQiYangShou)
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_DEATH )
	call TriggerAddCondition(t, Condition(function IsWanChengYangShou))
	call TriggerAddAction(t, function WanChengYangShou)
	set t=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(t,Condition(function IsQiuHun))
	call TriggerAddAction(t,function QiuHun_Action)
	set t=CreateTrigger()
	call TriggerAddRect(t,botong)
	call TriggerAddCondition(t,Condition(function IsQiuHunWan))
	call TriggerAddAction(t,function QiuHunWanCheng)
	set Io=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Io,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Io,Condition(function QJ))
	call TriggerAddAction(Io,function RJ)
	set lo=CreateTrigger()
	call TriggerAddRect(lo,Bg)
	call TriggerAddCondition(lo,Condition(function TJ))
	call TriggerAddAction(lo,function UJ)
	set Jo=CreateTrigger()
	call TriggerAddRect(Jo,Xe)
	call TriggerAddCondition(Jo,Condition(function WJ))
	call TriggerAddAction(Jo,function XJ)
	set Ko=CreateTrigger()
	call TriggerAddRect(Ko,Pe)
	call TriggerAddCondition(Ko,Condition(function ZJ))
	call TriggerAddAction(Ko,function dK)
	set Lo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Lo,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Lo,Condition(function fK))
	call TriggerAddAction(Lo,function gK)
	set Mo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Mo,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Mo,Condition(function iK))
	call TriggerAddAction(Mo,function jK)
	set No=CreateTrigger()
	call TriggerAddRect(No,Te)
	call TriggerAddCondition(No,Condition(function mK))
	call TriggerAddAction(No,function nK)
	set Oo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Oo,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(Oo,Condition(function pK))
	call TriggerAddAction(Oo,function qK)
	set Po=CreateTrigger()
	call TriggerAddRect(Po,Ve)
	call TriggerAddCondition(Po,Condition(function sK))
	call TriggerAddAction(Po,function tK)
	set Qo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Qo,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(Qo,Condition(function vK))
	call TriggerAddAction(Qo,function wK)
	set Ro=CreateTrigger()
	call TriggerAddRect(Ro,Xe)
	call TriggerAddCondition(Ro,Condition(function yK))
	call TriggerAddAction(Ro,function zK)
	set So=CreateTrigger()
	call TriggerAddRect(So,Ye)
	call TriggerAddCondition(So,Condition(function aK))
	call TriggerAddAction(So,function BK)
	// ɱ10������а�̵�λ
	set To=CreateTrigger()
	call TriggerRegisterPlayerUnitEventSimple(To,Player(6),EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(To,Condition(function CK))
	call TriggerAddAction(To,function cK)
	// Ѻ�����ν���
	set Uo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Uo,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Uo,Condition(function EK))
	call TriggerAddAction(Uo,function FK)
	//��ɱ�ܡ��һ������͵�����
	set Vo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Vo,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Vo,Condition(function HK))
	call TriggerAddAction(Vo,function IK)
	
	//��10���Զ�������ҩ
	set Yo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Yo,EVENT_PLAYER_HERO_LEVEL)
	call TriggerAddCondition(Yo,Condition(function PK))
	call TriggerAddAction(Yo,function QK)
	// �Ӷϳ�������
	set Zo=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(Zo,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(Zo,Condition(function SK))
	call TriggerAddAction(Zo,function TK)
	// ���ɶϳ���
	set dp=CreateTrigger()
	call TriggerRegisterTimerEventSingle(dp,1.)
	call TriggerAddAction(dp,function WK)
	// �ɼ����ϳ���
	set ep=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(ep,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(ep,Condition(function YK))
	call TriggerAddAction(ep,function ZK)
	// ��ɶϳ�������
	set fp=CreateTrigger()
	call TriggerAddRect(fp,lg)
	call TriggerAddCondition(fp,Condition(function eL))
	call TriggerAddAction(fp,function fL)
	// TODO
	set gp=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gp,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(gp,Condition(function hL))
	call TriggerAddAction(gp,function iL)
	// ����Ү�ɳ�������
	set hp=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(hp,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(hp,Condition(function kL))
	call TriggerAddAction(hp,function mL)
	// ����Ү�ɳ�������ʧ��
	set jp=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(jp,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(jp,Condition(function oL))
	call TriggerAddAction(jp,function pL)
	// ��ɻ���Ү�ɳ�������
	set kp=CreateTrigger()
	call TriggerAddRect(kp,gh)
	call TriggerAddCondition(kp,Condition(function rL))
	call TriggerAddAction(kp,function sL)
	// �߲��Թ�����
	set mp=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(mp,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(mp,Condition(function uL))
	call TriggerAddAction(mp,function vL)
	// ��ɸ߲��Թ�����
	set np=CreateTrigger()
	call TriggerAddRect(np,kh)
	call TriggerAddCondition(np,Condition(function xL))
	call TriggerAddAction(np,function yL)
	//�ɹ���һ�ȷ�����+���Ȱ�������
	set op=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(op,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(op,Condition(function AL))
	call TriggerAddAction(op,function aL)
	// �����ɹ���һ�ȷ桢���������
	set pp=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(pp,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(pp,Condition(function bL))
	call TriggerAddAction(pp,function CL)
	// ����ɹ���������
	set qp=CreateTrigger()
	call TriggerAddRect(qp,Ye)
	call TriggerAddCondition(qp,Condition(function DL))
	call TriggerAddAction(qp,function EL)
	
	set t = null
endfunction
