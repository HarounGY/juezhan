//-----------------------
//��Ϸϸ�ڴ�����һ������²���Ҫ�޸�
//-----------------------
function rx takes nothing returns boolean
	return((GetPlayerController(GetOwningPlayer(GetOrderedUnit()))==MAP_CONTROL_USER)and((GetIssuedOrderId()==$D0012)or(GetIssuedOrderId()==$D0016)))
endfunction
//���ƶ�ģ�⹥����Ѳ��ģ���ƶ� �Ե���
function sx takes nothing returns nothing
	set udg_loc1=GetOrderPointLoc()
	if((GetIssuedOrderId()==$D0012))then
		call IssuePointOrderByIdLoc(GetOrderedUnit(),$D000F,udg_loc1)
	else
		if((GetIssuedOrderId()==$D0016))then
			call IssuePointOrderByIdLoc(GetOrderedUnit(),$D0012,udg_loc1)
		endif
	endif
	call RemoveLocation(udg_loc1)
endfunction
//�Ҽ����������λ
function uuxx takes nothing returns boolean
	return((GetPlayerController(GetOwningPlayer(GetOrderedUnit()))==MAP_CONTROL_USER)and(IsPlayerAlly(GetOwningPlayer(GetOrderedUnit()),GetOwningPlayer(GetOrderTargetUnit())))and(GetIssuedOrderId()==$D0003))
endfunction
function vvxx takes nothing returns nothing
	set udg_loc1=GetUnitLoc(GetOrderTargetUnit())
	call IssuePointOrderByIdLoc(GetOrderedUnit(),$D0003,udg_loc1)
	call RemoveLocation(udg_loc1)
endfunction
//���ƶ�ģ�⹥�� �Ե�
function xx takes nothing returns boolean
	return((GetPlayerController(GetOwningPlayer(GetOrderedUnit()))==MAP_CONTROL_USER)and(GetIssuedOrderId()==$D0012))
endfunction
function yx takes nothing returns nothing
	call IssueTargetOrderById(GetOrderedUnit(),$D000F,GetOrderTargetUnit())
endfunction
//�Ż��ٶȼӿ�
function Ax takes nothing returns nothing
	call Cheat("DooConV")
endfunction

//�ѷ���λA����
function Ux takes nothing returns boolean
	return((GetTriggerUnit()==udg_ZhengPaiWL)and(IsUnitAlly(GetAttacker(),Player(5))))
endfunction
function Vx takes nothing returns nothing
	call IssueImmediateOrderById(GetAttacker(),$D0004)
endfunction
function ga takes nothing returns nothing
	call IssuePointOrderByIdLoc(GetEnumUnit(),$D000F,v7[4])
endfunction
function ha takes nothing returns nothing
	call ForGroupBJ(w7,function ga)
endfunction

function GameDetail_trigger takes nothing returns nothing
	local trigger t = CreateTrigger()
	//���ƶ�ģ�⹥����Ѳ��ģ���ƶ� �Ե���
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
	call TriggerAddCondition(t,Condition(function rx))
	call TriggerAddAction(t,function sx)
	set t=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
	call TriggerAddCondition(t,Condition(function uuxx))
	call TriggerAddAction(t,function vvxx)
	set t=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
	call TriggerAddCondition(t,Condition(function xx))
	call TriggerAddAction(t,function yx)
	// �ѷ���λA����
	set ei=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(ei,EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(ei,Condition(function Ux))
	call TriggerAddAction(ei,function Vx)
	// �ù�A����
	set kj=CreateTrigger()
	call TriggerRegisterTimerEventPeriodic(kj,5.)
	call TriggerAddAction(kj,function ha)
	set t = null
endfunction
