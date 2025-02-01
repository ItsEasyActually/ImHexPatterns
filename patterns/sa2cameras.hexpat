#pragma author ItsEasyActually
#pragma description SA2 Camera Files
#include <std/io.pat>

enum CamMode : u32 {
    None = 0,
    User = 1,
    Follow = 2,
    Knuckles = 3,
    Editor = 4,
    Editor2 = 5,
    SnapShot = 6,
    Klamath = 7,
    Point = 8,
    Ashland = 9,
    Fix = 10,
    Leave = 11,
    Space = 12,
    Carmel = 13,
    Motion = 14,
    BossInit = 15,
    BossPoint = 16,
    Collision = 17,
    PStone = 18,
    Init = 19,
    EasySet = 20,
    BossKlamath = 21,
    GakuGaku = 22,
    Knuckles_L = 23,
    Fix2 = 24,
    PStone2 = 25,
    SS = 26,
    Colli_LR = 27,
};

enum AdjustMode : u32 {
    None = 0,
    User = 1,
    Half = 2,
    Three1 = 3,
    Three2 = 4,
    Three3 = 5,
    Three4 = 6,
    Three5 = 7,
    Relative1 = 8,
    Relative2 = 9,
    Relative3 = 10,
    Relative4 = 11,
    Relative5 = 12,
    Relative6 = 13,
};

enum ColliShape : u32 {
    Sphere = 1,
    Plane = 2,
    Block = 3 
};

struct FloatVector {
    float X;
    float Y;
    float Z;
};

struct RotationVector {
    u32 X;
    u32 Y;
    u32 Z;
};

struct Camera {
    CamMode Mode [[color("4293D9")]];
    AdjustMode AdjustMode [[color("55A859")]];
    u32 Priority [[color("F8E539")]];
    ColliShape CollisionShape [[color("4FC9D8")]];
    FloatVector CollisionPosition [[color("F78C6C")]];
    RotationVector CollisionRotation [[color("FFB74D")]];
    FloatVector CollisionScale [[color("FFD54F")]];
    FloatVector CameraPosition [[color("D93A70")]];
    RotationVector CameraRotation [[color("9C27B0")]];
    FloatVector CameraTarget [[color("673AB7")]];
    s32 IntProperties[8] [[color("EB673E")]];
    float FloatProperties[8] [[color("BD7DC7")]]; 
};

struct Point {
   FloatVector PlayerPoint [[color("42A5F5")]];
   float PlayerPointRadius [[color("EC407A")]];
   FloatVector CameraPoint [[color("9CCC65")]];
   float CameraPointRadius [[color("FFA726")]];
   s16 Links[6] [[color("FF2633")]];
   s16 FlowIndex [[color("13F800")]];
   u8 PlayerPointEnabled [[color("00FEEF")]];
   u8 CenterOnPlayer [[color("FEFE00")]]; 
};

u32 Content @ 0x00;
u32 CameraData @ 0x04;
u32 PointData @ 0x08;
u32 DemoCameraData @ 0x0C;
u32 DemoPointData @ 0x10;
u32 MultiplayerCameraData @ 0x14;
u32 MultiplayerPointData @ 0x18;
 
Camera Cameras[CameraData / sizeof(Camera)] @ 0x20;
Point CameraPoints[PointData / sizeof(Point)] @ (CameraData + 0x20);

Camera DemoCameras[DemoCameraData / sizeof(Camera)] @ (PointData + CameraData + 0x20);
Point DemoPoints[DemoPointData / sizeof(Point)] @ (DemoCameraData + PointData + CameraData + 0x20);

Camera MultiplayerCameras[MultiplayerCameraData / sizeof(Camera)] @ (DemoPointData + DemoCameraData + PointData + CameraData + 0x20);
Point MultiplayerPoints[MultiplayerPointData / sizeof(Point)] @ (MultiplayerCameraData + DemoPointData + DemoCameraData + PointData + CameraData + 0x20);