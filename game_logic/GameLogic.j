//---------------------------------
// ��Ϸ�߼�����
// 1. ���ر����߼�
//---------------------------------

//���ر�������
function IsJiDiBaoHu takes nothing returns boolean
	return (GetTriggerUnit() == udg_ZhengPaiWL) and GetEventDamage() > GetUnitState(udg_ZhengPaiWL, UNIT_STATE_MAX_LIFE) * 0.03
endfunction
function JiDiBaoHu takes nothing returns nothing
	call WuDi(udg_ZhengPaiWL)
	call SetUnitLifePercentBJ(udg_ZhengPaiWL, GetUnitLifePercent(udg_ZhengPaiWL) - 3.00)
endfunction
//�ƴ�ȼ�
function Trig_YunDaXianShenConditions takes nothing returns boolean
    return ((GetTriggerUnit() == udg_ZhengPaiWL) and (GetUnitLifePercent(udg_ZhengPaiWL) <= 25.00) and (udg_yunyangxianshen == false))
endfunction
function Trig_YunDaXianShenActions takes nothing returns nothing
    set udg_yunyangxianshen = true
    call CreateNUnitsAtLoc( 1, 'Hblm', Player(5), OffsetLocation(GetUnitLoc(udg_ZhengPaiWL), 0, 200), 90.00 )
    call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,15,"|cFFFF6600���������ܴ���������������")
    call UnitApplyTimedLife( GetLastCreatedUnit(), 'BHwe', 20.00 )
    call UnitAddAbility( udg_ZhengPaiWL, 'Avul' )
    call YDWEPolledWaitNull(20.00)
    call UnitRemoveAbilityBJ( 'Avul', udg_ZhengPaiWL )
endfunction
