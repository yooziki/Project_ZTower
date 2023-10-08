# warnings-disable
extends RefCounted

var True = true
var False = false
var None = null


var data = \
{
1:{ "id":1,  "name":'攻击+4，速度-1',  "des":'',  "HP":0,  "ATT":4,  "DEF":0,  "SPD":-1,  "DOG":0,  "LUCK":0,  "CRI":0, },
2:{ "id":2,  "name":'攻击+3',  "des":'',  "HP":0,  "ATT":3,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
3:{ "id":3,  "name":'攻击+3，防御+1，速度-1',  "des":'',  "HP":0,  "ATT":3,  "DEF":1,  "SPD":-1,  "DOG":0,  "LUCK":0,  "CRI":0, },
4:{ "id":4,  "name":'攻击+2，幸运+1',  "des":'',  "HP":0,  "ATT":2,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":1,  "CRI":0, },
5:{ "id":5,  "name":'攻击+1，速度+2',  "des":'',  "HP":0,  "ATT":1,  "DEF":0,  "SPD":2,  "DOG":0,  "LUCK":0,  "CRI":0, },
6:{ "id":6,  "name":'速度+3，幸运+3',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":3,  "DOG":0,  "LUCK":3,  "CRI":0, },
7:{ "id":7,  "name":'防御+3，速度+3',  "des":'',  "HP":0,  "ATT":0,  "DEF":3,  "SPD":3,  "DOG":0,  "LUCK":0,  "CRI":0, },
8:{ "id":8,  "name":'攻击+12，攻击6次后损坏',  "des":'',  "HP":0,  "ATT":12,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
9:{ "id":9,  "name":'攻击+3，防御+2',  "des":'',  "HP":0,  "ATT":3,  "DEF":2,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
10:{ "id":10,  "name":'攻击+10，对亡灵伤害+100%',  "des":'',  "HP":0,  "ATT":10,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
11:{ "id":11,  "name":'攻击+3，速度+3\n击杀敌人获得X金币',  "des":'',  "HP":0,  "ATT":3,  "DEF":0,  "SPD":3,  "DOG":0,  "LUCK":0,  "CRI":0, },
12:{ "id":12,  "name":'攻击+5，速度+3，攻击引燃敌人\n引燃：每回合生命-1，持续3回合',  "des":'',  "HP":0,  "ATT":5,  "DEF":0,  "SPD":3,  "DOG":0,  "LUCK":0,  "CRI":0, },
13:{ "id":13,  "name":'攻击+5，防御-5\n攻击使生命最大值+1',  "des":'',  "HP":0,  "ATT":5,  "DEF":-5,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
14:{ "id":14,  "name":'攻击+40，速度-40',  "des":'',  "HP":0,  "ATT":40,  "DEF":0,  "SPD":-40,  "DOG":0,  "LUCK":0,  "CRI":0, },
1001:{ "id":1001,  "name":'防御+2，速度-1',  "des":'',  "HP":0,  "ATT":0,  "DEF":2,  "SPD":-1,  "DOG":0,  "LUCK":0,  "CRI":0, },
1002:{ "id":1002,  "name":'防御+4，速度-2',  "des":'',  "HP":0,  "ATT":0,  "DEF":4,  "SPD":-2,  "DOG":0,  "LUCK":0,  "CRI":0, },
1003:{ "id":1003,  "name":'防御+8，速度-3',  "des":'',  "HP":0,  "ATT":0,  "DEF":8,  "SPD":-3,  "DOG":0,  "LUCK":0,  "CRI":0, },
1004:{ "id":1004,  "name":'防御+12，速度-4，受到伤害时反弹5伤害',  "des":'',  "HP":0,  "ATT":0,  "DEF":12,  "SPD":-4,  "DOG":0,  "LUCK":0,  "CRI":0, },
2001:{ "id":2001,  "name":'速度+2',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":2,  "DOG":0,  "LUCK":0,  "CRI":0, },
2002:{ "id":2002,  "name":'速度+4，防御+1',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":4,  "DOG":0,  "LUCK":0,  "CRI":0, },
2003:{ "id":2003,  "name":'速度+7',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":7,  "DOG":0,  "LUCK":0,  "CRI":0, },
2004:{ "id":2004,  "name":'速度+3，幸运+3，主动道具效果+100%',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":3,  "DOG":0,  "LUCK":3,  "CRI":0, },
3001:{ "id":3001,  "name":'防御+2',  "des":'',  "HP":0,  "ATT":0,  "DEF":2,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
3002:{ "id":3002,  "name":'防御+5',  "des":'',  "HP":0,  "ATT":0,  "DEF":5,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
3003:{ "id":3003,  "name":'防御+4，幸运+3',  "des":'',  "HP":0,  "ATT":0,  "DEF":4,  "SPD":0,  "DOG":0,  "LUCK":3,  "CRI":0, },
3004:{ "id":3004,  "name":'防御+12',  "des":'',  "HP":0,  "ATT":0,  "DEF":12,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
4001:{ "id":4001,  "name":'攻击时20%使敌人着火',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
4002:{ "id":4002,  "name":'物理伤害+3',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
4003:{ "id":4003,  "name":'攻击时20%使敌人中毒',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
4004:{ "id":4004,  "name":'受到持续伤害减少1回合',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
4005:{ "id":4005,  "name":'受到致命伤害时，恢复所有生命并摧毁此物品',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
100001:{ "id":100001,  "name":'HP+3',  "des":'',  "HP":3,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
100002:{ "id":100002,  "name":'攻击+1',  "des":'',  "HP":0,  "ATT":1,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
100003:{ "id":100003,  "name":'防御+1',  "des":'',  "HP":0,  "ATT":0,  "DEF":1,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },
100004:{ "id":100004,  "name":'速度+1',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":1,  "DOG":0,  "LUCK":0,  "CRI":0, },
100005:{ "id":100005,  "name":'幸运+1',  "des":'',  "HP":0,  "ATT":0,  "DEF":0,  "SPD":0,  "DOG":0,  "LUCK":0,  "CRI":0, },

}

