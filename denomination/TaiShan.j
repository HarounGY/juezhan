/*
 * �����䳤�� XXXX �ͷ��ߴ����䣬�Է�Χ�������������˺����Լ���Ч��
 * �����书
 * �˺�ϵ����w1=7.2, w2=8.9
 * �˺����䣺
 *		+Ǭ����Ų�� A07W �˺�+80%
 *		+һ��ָ A06P �����ж�
 *		+�����澭�������� A0D3 �����ж�
 *		+�����澭�������׹�צ A07N ����ʹ�ж��ĵ�λ�ж�����
 *		+˫�ֻ��� A07U ���ж�/����ж��ĵ�λ+150%���˺�
 *		+�����澭���ڹ� A07S ������ж��ĵ�λ+200%���˺�
 */
 // ����������
 function IsQiXingLuo takes nothing returns boolean
	return GetSpellAbilityId()=='XXXX'
 endfunction
 /*
  * ����������
  *
  * ���滻������
  * ��Χ
  * �����ٶ�
  * w1 w2
  * ��Ч�ַ���
  * 
  * ��ѡ���䣺
  * �����˺�
  * ����BUFF
  * ��С����ķ�Χ
  */
 function QiXingLuoChangKong takes nothing returns nothing
	local group g = null
	local location loc = null
	local integer i = 0
	local unit u = GetTriggerUnit()
	local unit ut = null
	local real shxishu = 1
	call WuGongShengChong(GetTriggerUnit(), 'XXXX', 200)
	call GroupEnumUnitsInRangeOfLoc(g,loc,700,function QiXingLuo_Condition)
	loop
		exitwhen i >= 7
		set ut = GroupPickRandomUnit(g)
		//�����Ч
		call DestroyEffect(AddSpecialEffectTargetUnitBJ("origin",GetTriggerUnit(),"Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl"))
		//u��ut����˺�
		set shanghai=ShangHaiGongShi(u,ut,80,90,shxishu,'XXXX')
		call WuGongShangHai(u,ut,shanghai)
		set i = i + 1
	endloop
	//�书����
	
	call RemoveLocation(loc)
	set g = null
	set loc = null
	set u = null
	set ut = null
 endfunction



/*
 * ̩ɽ�������ܺ���
 */
function Taishan_Trigger takes nothing returns nothing
	/*
	 * �����䳤�մ�����
	 */
	local trigger t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t,Condition(function IsQiXingLuo))
    call TriggerAddAction(t,function QiXingLuoChangKong)
	
	set t = null
endfunction
