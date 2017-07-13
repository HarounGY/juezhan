/*
 * @version����ս����1.53
 * @author: zei_kale
 * @date:2017.7.12
 *
 * ̩ɽ�����书�������䳤�ա������Ρ�̩ɽʮ���̡����򽣡��������
 */


/*
 * �����䳤�� A08A �ͷ��ߴ����䣬�Է�Χ�������������˺����Լ���Ч��
 * �����书
 * �˺�ϵ����w1=20, w2=20
 * �˺����䣺
 *		+Ǭ����Ų�� A07W �˺�+60%
 *		+�������� A07T �˺�+100%
 *		+���Ǵ� A07R ���ʷ�Ѩ�����
 *		+��ת���� A07Q �����Χ����
 *		+�����غ� A03V �����Χ����
 */
 // ����������
 function IsQiXingLuo takes nothing returns boolean
	return GetSpellAbilityId()=='A08A'
 endfunction
 
 function QiXingLuo_Condition takes nothing returns boolean
	return DamageFilter(GetTriggerUnit(), GetFilterUnit())
 endfunction
 
 /*
  * ����������
  *
  * ���滻������
  * ��Χ 800
  * �����ٶ� 200
  * w1=20 w2=20
  * ��Ч�ַ��� Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl
  * 
  * ��ѡ���䣺
  * �����˺� Ǭ����Ų��+60% ��������+100% 
  * ����BUFF ���Ǵ�+��Ѩ�����
  * ��С����ķ�Χ ��תA07Q+��Χ���� �����غ�A03V+��Χ����
  */
 function QiXingLuoChangKong takes nothing returns nothing
	local group g = CreateGroup()
	local integer i = 0
	local real shanghai = 0.
	local unit u = GetTriggerUnit()
	local location loc = GetUnitLoc(u)
	local unit ut = null
	local real shxishu = 1 + DamageCoefficientByAbility(GetTriggerUnit(),'A07W', 0.6) + DamageCoefficientByAbility(GetTriggerUnit(),'A07T', 1) // Ǭ����Ų��+60% ��������+100%
	local real range = 800
	if (GetUnitAbilityLevel(GetTriggerUnit(), 'A07Q')>=1) then // +��ת����
		set range = range / 2
	endif
	if (GetUnitAbilityLevel(GetTriggerUnit(), 'A03V')>=1) then // +�����غ�
		set range = range / 2
	endif
	call WuGongShengChong(GetTriggerUnit(), 'A08A', 200) //�书����
	call GroupEnumUnitsInRangeOfLoc(g, loc, range, function QiXingLuo_Condition)
	loop
		exitwhen i >= 7
		set ut = GroupPickRandomUnit(g)
		//�����Ч
		call DestroyEffect(AddSpecialEffectTargetUnitBJ("origin",ut,"Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl"))
		call PolledWait(0.2)
		//u��ut����˺�
		set shanghai=ShangHaiGongShi(u,ut,20,20,shxishu,'A08A')
		call WuGongShangHai(u,ut,shanghai)
		if (GetUnitAbilityLevel(GetTriggerUnit(), 'A07R')>=1) then // +���Ǵ�
			if (GetRandomInt(0, 100)<=50) then
				call WanBuff(u, ut, 4) //����
			else
				call WanBuff(u, ut, 11) //��Ѩ
			endif
		endif
		set i = i + 1
	endloop
	call RemoveLocation(loc)
	set g = null
	set loc = null
	set u = null
	set ut = null
 endfunction

/*
 * ������ A08B ʩ�ź������ڴ����������������50*�书������
 * �����书
 * �˺����䣺
 *		+�������� A07T �����˺�����+20%
 *		+˫�ֻ��� A07U �����˺�����+20%
 *		+С���๦ A083 �������ѷ�Ӣ��ʩ��������
 */
 // ����������
function IsDaiZongRuHe takes nothing returns boolean
	return GetSpellAbilityId()=='A08B'
endfunction

// �Ƴ������ε�BUFF
function removeDaiZongBuff takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local unit u = LoadUnitHandle(YDHT, GetHandleId(t), 0)
	local real extraHit = LoadReal(YDHT, GetHandleId(t), 1)
	local integer i = LoadInteger(YDHT, GetHandleId(t), 2)
	// call BJDebugMsg("t:"+I2S(GetHandleId(t))+", i:"+I2S(i))
	//���ٱ�������
	set udg_baojishanghai[i] = udg_baojishanghai[i] - extraHit
	//ֹͣ��ʱ��
	call clearTimer(t)
	set t = null
endfunction

// ��Ŀ��ʩ��������
function issueTargetDaiZong takes unit u, integer i, timer t, real extraHit returns nothing
	// ��׶�Ӣ��ʩ���׻�
	call maJiaUseAbilityAtEnemysLoc(u, 'e01F',  'A08C', $D0097, u, 3)
	// ��һ��׶�Ӣ��ʩ�����漼�ܣ�Ӣ�ۻ��BUFF
	call maJiaUseAbilityAtEnemysLoc(u, 'e000',  'A08D', $D0062, u, 3)
	// Ӣ�۱�����������
	set udg_baojishanghai[i] = udg_baojishanghai[i] + extraHit
	// 1�봥��1�εĶ�ʱ�������Ӣ��ʧȥBUFF����ʧȥ��������
	call SaveUnitHandle(YDHT, GetHandleId(t), 0, u)
	call SaveReal(YDHT, GetHandleId(t), 1, extraHit)
	call SaveInteger(YDHT, GetHandleId(t), 2, i)
	call TimerStart(t, 10, false, function removeDaiZongBuff)
endfunction
 /*
  * ����������
  *
  * ���滻������
  * �����ٶ� 100
  * 
  * ��ѡ���䣺
  * �����˺� �������� A07T ˫�ֻ��� A07U ÿ�������˺�����+20% 
  * Ⱥ��BUFF С���๦ A083 �������ѷ�Ӣ��ʩ��������
  */
function DaiZongRuHe takes nothing returns nothing
	local integer i = 1 + GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
	local real extraHit = (0.5 + 0.2 * GetUnitAbilityLevel(GetTriggerUnit(), 'A07T') + 0.2 * GetUnitAbilityLevel(GetTriggerUnit(), 'A07U')) * GetUnitAbilityLevel(GetTriggerUnit(), 'A08B')
	call WuGongShengChong(GetTriggerUnit(), 'A08B', 100) //�书����
	if GetUnitAbilityLevel(GetTriggerUnit(), 'A083') >= 1 then // С���๦
		call issueTargetDaiZong(udg_hero[1], 1, CreateTimer(), extraHit)
		call issueTargetDaiZong(udg_hero[2], 2, CreateTimer(), extraHit)
		call issueTargetDaiZong(udg_hero[3], 3, CreateTimer(), extraHit)
		call issueTargetDaiZong(udg_hero[4], 4, CreateTimer(), extraHit)
		call issueTargetDaiZong(udg_hero[5], 5, CreateTimer(), extraHit)
	else
		call issueTargetDaiZong(GetTriggerUnit(), i, CreateTimer(), extraHit)
	endif
endfunction


/*
 * ̩ɽʮ���� A08E ������С�����ڶ�ʱ���ڴ�����ӹ��� ����ͨ��
 * �����书
 * �书���䣺
 *		�书�ȼ�����������
 *		+�������� A07T �񱩳���ʱ��+1s
 *		+���Ǵ� A07R �񱩳���ʱ��+1s
 *		+Ǭ����Ų�� A07W �񱩳���ʱ��+1s
 *		+���������书 ������������
 *		+С���๦ A083 �����ѷ�Ӣ�۴���̩ɽʮ����
 */
// ����������
function IsShiBaPan takes nothing returns boolean
	return PassiveWuGongCondition(GetAttacker(), GetTriggerUnit(), 'A08E')
endfunction

// ����������
function ShiBaPan takes nothing returns nothing
	local unit u = GetAttacker()
	local unit ut = GetTriggerUnit()
	local integer i = 1 + GetPlayerId(GetOwningPlayer(u))
	local integer abilityLevel = IMinBJ(1 + GetUnitAbilityLevel(u, 'A07T') + GetUnitAbilityLevel(u, 'A07R') + GetUnitAbilityLevel(u, 'A07W'), 4)
	if (GetRandomInt(1, 100) <= 5 + GetUnitAbilityLevel(u, 'A08F') + fuyuan[i] / 5 and not(UnitHasBuffBJ(u, 'B01L'))) then
		call WuGongShengChong(u, 'A08E', 700)
		if GetUnitAbilityLevel(GetTriggerUnit(), 'A083') >= 1 then
			call maJiaUseLeveldAbilityAtTargetLoc(udg_hero[1], 'e000',  'A08F', abilityLevel, $D0085, udg_hero[1], 3)
			call maJiaUseLeveldAbilityAtTargetLoc(udg_hero[2], 'e000',  'A08F', abilityLevel, $D0085, udg_hero[2], 3)
			call maJiaUseLeveldAbilityAtTargetLoc(udg_hero[3], 'e000',  'A08F', abilityLevel, $D0085, udg_hero[3], 3)
			call maJiaUseLeveldAbilityAtTargetLoc(udg_hero[4], 'e000',  'A08F', abilityLevel, $D0085, udg_hero[4], 3)
			call maJiaUseLeveldAbilityAtTargetLoc(udg_hero[5], 'e000',  'A08F', abilityLevel, $D0085, udg_hero[5], 3)
		else
			call maJiaUseLeveldAbilityAtTargetLoc(u, 'e000',  'A08F', abilityLevel, $D0085, u, 3)
		endif
	endif
	set u = null
	set ut = null
endfunction

/*
 * ���� A08G
 * �����书
 * �˺�ϵ����w1=20, w2=20
 * �˺����䣺
 *		+������ A07P �˺�+100%
 *		+�������� A07T �˺�+100%
 *		+���콣 I00B �˺�+300%
 *		+˫�ֻ��� A07U ���򽣷ֱ�����ɻ��ҡ����ԡ���Ѫ���ж����Ʒ�
 */
// ����������
function IsWuDaFu takes nothing returns boolean
	return PassiveWuGongCondition(GetAttacker(), GetTriggerUnit(), 'A08G')
endfunction

function WuDaFuJianDamageFilter takes nothing returns boolean
	return DamageFilter(GetAttacker(), GetFilterUnit())
endfunction

function WuDaFuJian_Action takes nothing returns nothing
	local unit u = GetAttacker()
	local unit ut = GetEnumUnit()
	local string modelName1 = "Abilities\\Spells\\Other\\Tornado\\TornadoElementalSmall.mdl" //��
	local string modelName2 = "Abilities\\Spells\\Demon\\RainOfFire\\RainOfFireTarget.mdl" //��
	local string modelName3 = "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl" //��
	local string modelName4 = "Abilities\\Spells\\NightElf\\EntanglingRoots\\EntanglingRootsTarget.mdl" //ľ
	local string modelName5 = "Abilities\\Spells\\Human\\Blizzard\\BlizzardTarget.mdl" //��
	local real shxishu = 1 + DamageCoefficientByAbility(u, 'A07P', 1.0) + DamageCoefficientByAbility(u, 'A07T', 1.0) + DamageCoefficientByItem(u, 'I00B', 3.0)
	local integer i = GetRandomInt(0, 100)
	if (i <= 20) then
		call PassiveWuGongEffectAndDamage(u, ut, modelName1, 10, 50, shxishu, 'A08G')
		if (GetRandomInt(0, 100) < 20 and GetUnitAbilityLevel(u, 'A07U') >= 1) then
			call WanBuff(u, ut, 4)
		endif
	elseif (i<= 40) then
		call PassiveWuGongEffectAndDamage(u, ut, modelName2, 20, 40, shxishu, 'A08G')
		if (GetRandomInt(0, 100) < 20 and GetUnitAbilityLevel(u, 'A07U') >= 1) then
			call WanBuff(u, ut, 5)
		endif
	elseif (i<= 60) then
		call PassiveWuGongEffectAndDamage(u, ut, modelName3, 30, 30, shxishu, 'A08G')
		if (GetRandomInt(0, 100) < 20 and GetUnitAbilityLevel(u, 'A07U') >= 1) then
			call WanBuff(u, ut, 3)
		endif
	elseif (i<= 80) then
		call PassiveWuGongEffectAndDamage(u, ut, modelName4, 40, 20, shxishu, 'A08G')
		if (GetRandomInt(0, 100) < 20 and GetUnitAbilityLevel(u, 'A07U') >= 1) then
			call WanBuff(u, ut, 13)
		endif
	else
		call PassiveWuGongEffectAndDamage(u, ut, modelName5, 50, 10, shxishu, 'A08G')
		if (GetRandomInt(0, 100) < 20 and GetUnitAbilityLevel(u, 'A07U') >= 1) then
			call WanBuff(u, ut, 9)
		endif
	endif
		
	set u = null
	set ut = null
endfunction

// ����������
function WuDaFuJian takes nothing returns nothing
	call PassiveWuGongAction(GetAttacker(), GetTriggerUnit(), 15, 700, Condition(function WuDaFuJianDamageFilter), function WuDaFuJian_Action, 'A08G', 500)
endfunction

// ����������
function IsKuaiHuoSan takes nothing returns boolean
	return true
endfunction

// ����������
function KuaiHuoSanJian takes nothing returns nothing

endfunction
/*
 * ̩ɽ�������ܺ���
 */
function TaiShan_Trigger takes nothing returns nothing
	/*
	 * �����䳤�մ�����
	 */
	local trigger t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t,Condition(function IsQiXingLuo))
    call TriggerAddAction(t,function QiXingLuoChangKong)
	/*
	 * �����δ�����
	 */
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t, Condition(function IsDaiZongRuHe))
	call TriggerAddAction(t, function DaiZongRuHe)
	/*
	 * ̩ɽʮ���̴�����
	 */
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(t, Condition(function IsShiBaPan))
	call TriggerAddAction(t, function ShiBaPan)
	/*
	 * ���򽣴�����
	 */
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(t, Condition(function IsWuDaFu))
	call TriggerAddAction(t, function WuDaFuJian)
	/*
	 * �������������
	 */
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(t, Condition(function IsKuaiHuoSan))
	call TriggerAddAction(t, function KuaiHuoSanJian)
	set t = null
endfunction
