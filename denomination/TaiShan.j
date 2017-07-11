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

function IsDaiZongRuHe takes nothing returns boolean
	return GetSpellAbilityId()=='XXXX'
endfunction

function DaiZongRuHe takes nothing returns nothing
	// ��׶�Ӣ��ʩ���׻�
	// ��һ��׶�Ӣ��ʩ�����漼�ܣ�Ӣ�ۻ��BUFF
	// Ӣ�۱����������ӣ�1�봥��1�εĶ�ʱ�������Ӣ��ʧȥBUFF����ʧȥ��������
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
	set trigger t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t, Condition(function IsDaiZongRuHe))
	call TriggerAddAction(t, function DaiZongRuHe)
	set t = null
endfunction
