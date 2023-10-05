# warnings-disable
extends RefCounted

var True = true
var False = false
var None = null


var data = \
{
1:{ "id":1,  "name":'铁刺锤',  "icon":'武器/W_Mace004.png',  "des":'攻击+4，速度-1',  "slotID":0,  "buffID":1,  "rare":1, },
2:{ "id":2,  "name":'木刺锤',  "icon":'武器/icon_03.png',  "des":'攻击+3',  "slotID":0,  "buffID":2,  "rare":1, },
3:{ "id":3,  "name":'铁斧',  "icon":'武器/W_Axe001.png',  "des":'攻击+3，防御+1，速度-1',  "slotID":0,  "buffID":3,  "rare":1, },
4:{ "id":4,  "name":'木弓',  "icon":'武器/W_Bow02.png',  "des":'攻击+2，幸运+1',  "slotID":0,  "buffID":4,  "rare":1, },
5:{ "id":5,  "name":'小匕首',  "icon":'武器/W_Dagger003.png',  "des":'攻击+1，速度+2',  "slotID":0,  "buffID":5,  "rare":1, },
6:{ "id":6,  "name":'玻璃杖',  "icon":'武器/icon_06.png',  "des":'速度+3，幸运+3',  "slotID":0,  "buffID":6,  "rare":2, },
7:{ "id":7,  "name":'链锤',  "icon":'武器/W_Mace005.png',  "des":'防御+3，速度+3',  "slotID":0,  "buffID":7,  "rare":2, },
8:{ "id":8,  "name":'手枪',  "icon":'武器/W_Gun003.png',  "des":'攻击+12，攻击6次后损坏',  "slotID":0,  "buffID":8,  "rare":2, },
9:{ "id":9,  "name":'巨矛',  "icon":'武器/W_Spear009.png',  "des":'攻击+3，防御+2',  "slotID":0,  "buffID":9,  "rare":2, },
10:{ "id":10,  "name":'骨头杖',  "icon":'武器/icon_09.png',  "des":'攻击+10，对亡灵伤害+100%',  "slotID":0,  "buffID":10,  "rare":3, },
11:{ "id":11,  "name":'黄金弓',  "icon":'武器/W_Bow12.png',  "des":'攻击+3，速度+3\n击杀敌人获得X金币',  "slotID":0,  "buffID":11,  "rare":3, },
12:{ "id":12,  "name":'火刀',  "icon":'武器/W_Dagger016.png',  "des":'攻击+5，速度+3，攻击引燃敌人\n引燃：每回合生命-1，持续3回合',  "slotID":0,  "buffID":12,  "rare":3, },
13:{ "id":13,  "name":'“拐杖糖”',  "icon":'武器/W_Mace010.png',  "des":'攻击+5，防御-5\n攻击使生命最大值+1',  "slotID":0,  "buffID":13,  "rare":4, },
14:{ "id":14,  "name":'猎龙巨斧',  "icon":'武器/W_Axe012.png',  "des":'攻击+40，速度-40',  "slotID":0,  "buffID":14,  "rare":4, },
1001:{ "id":1001,  "name":'皮甲',  "icon":'防具/A_Armor04.png',  "des":'防御+2，速度-1',  "slotID":1,  "buffID":1001,  "rare":1, },
1002:{ "id":1002,  "name":'银甲',  "icon":'防具/A_Armor04.png',  "des":'防御+4，速度-2',  "slotID":1,  "buffID":1002,  "rare":2, },
1003:{ "id":1003,  "name":'金甲',  "icon":'防具/A_Armor03.png',  "des":'防御+8，速度-3',  "slotID":1,  "buffID":1003,  "rare":3, },
1004:{ "id":1004,  "name":'火龙甲',  "icon":'防具/A_Armor05.png',  "des":'防御+12，速度-4，受到伤害时反弹5伤害',  "slotID":1,  "buffID":1004,  "rare":4, },
2001:{ "id":2001,  "name":'布鞋',  "icon":'防具/A_Shoes01.png',  "des":'速度+2',  "slotID":3,  "buffID":2001,  "rare":1, },
2002:{ "id":2002,  "name":'绿鞋',  "icon":'防具/A_Shoes02.png',  "des":'速度+4，防御+1',  "slotID":3,  "buffID":2002,  "rare":2, },
2003:{ "id":2003,  "name":'运动鞋',  "icon":'防具/A_Shoes04.png',  "des":'速度+7',  "slotID":3,  "buffID":2003,  "rare":3, },
2004:{ "id":2004,  "name":'魔法鞋',  "icon":'防具/A_Shoes06.png',  "des":'速度+3，幸运+3，主动道具效果+100%',  "slotID":3,  "buffID":2004,  "rare":4, },
3001:{ "id":3001,  "name":'锅盖',  "icon":'防具/E_Wood01.png',  "des":'防御+2',  "slotID":2,  "buffID":3001,  "rare":1, },
3002:{ "id":3002,  "name":'铁盾',  "icon":'防具/E_Metal04.png',  "des":'防御+5',  "slotID":2,  "buffID":3002,  "rare":2, },
3003:{ "id":3003,  "name":'黄金盾',  "icon":'防具/E_Gold02.png',  "des":'防御+4，幸运+3',  "slotID":2,  "buffID":3003,  "rare":3, },
3004:{ "id":3004,  "name":'龙骨盾',  "icon":'防具/E_Bones02.png',  "des":'防御+12',  "slotID":2,  "buffID":3004,  "rare":4, },
4001:{ "id":4001,  "name":'火戒指',  "icon":'防具/icon_18.png',  "des":'攻击时20%使敌人着火',  "slotID":4,  "buffID":4001,  "rare":3, },
4002:{ "id":4002,  "name":'石戒指',  "icon":'防具/icon_19.png',  "des":'物理伤害+3',  "slotID":4,  "buffID":4002,  "rare":3, },
4003:{ "id":4003,  "name":'毒戒指',  "icon":'防具/icon_21.png',  "des":'攻击时20%使敌人中毒',  "slotID":4,  "buffID":4003,  "rare":3, },
4004:{ "id":4004,  "name":'钻石戒指',  "icon":'防具/icon_22.png',  "des":'受到持续伤害减少1回合',  "slotID":4,  "buffID":4004,  "rare":3, },
4005:{ "id":4005,  "name":'重生项链',  "icon":'防具/icon_25.png',  "des":'受到致命伤害时，恢复所有生命并摧毁此物品',  "slotID":4,  "buffID":4005,  "rare":3, },

}

