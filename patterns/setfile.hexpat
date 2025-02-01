#pragma author ItsEasyActually
#pragma description Sonic Adventure 1 & 2 Set Files

bitfield info {
    id : 12;
    clip : 4;
};

struct obj_itementry {
    info objinfo; 
    
    s16 rx;
    s16 ry;
    s16 rz;
    
    float posx;
    float posy;
    float posz;
    
    float prop1;
    float prop2;
    float prop3;
};

u32 count @ 0x00;

obj_itementry setitem[count] @ 0x20;