import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: root
    objectName: "Root"

    // Resources
    Texture {
        id: textures_MI_Troll_Body_Mountain01_Upper_baseColor_png_texture
        objectName: "textures/MI_Troll_Body_Mountain01_Upper_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Body_Mountain01_Upper_baseColor.png"
    }
    Texture {
        id: textures_MI_Troll_Body_Mountain01_Upper_normal_png_texture
        objectName: "textures/MI_Troll_Body_Mountain01_Upper_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Body_Mountain01_Upper_normal.png"
    }
    Texture {
        id: textures_MI_Troll_Body_Mountain01_Lower_baseColor_png_texture
        objectName: "textures/MI_Troll_Body_Mountain01_Lower_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Body_Mountain01_Lower_baseColor.png"
    }
    Texture {
        id: textures_MI_Troll_Body_Mountain01_Lower_normal_png_texture
        objectName: "textures/MI_Troll_Body_Mountain01_Lower_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Body_Mountain01_Lower_normal.png"
    }
    Texture {
        id: textures_MI_Troll_Heads_Eye_Master_baseColor_png_texture
        objectName: "textures/MI_Troll_Heads_Eye_Master_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Heads_Eye_Master_baseColor.png"
    }
    Texture {
        id: textures_MI_Troll_Heads_Cave_baseColor_png_texture
        objectName: "textures/MI_Troll_Heads_Cave_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Heads_Cave_baseColor.png"
    }
    Texture {
        id: textures_MI_Troll_Heads_Cave_normal_png_texture
        objectName: "textures/MI_Troll_Heads_Cave_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Heads_Cave_normal.png"
    }
    Texture {
        id: textures_MI_Troll_Heads_Teeth_baseColor_png_texture
        objectName: "textures/MI_Troll_Heads_Teeth_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/MI_Troll_Heads_Teeth_baseColor.png"
    }
    PrincipledMaterial {
        id: mi_Troll_Body_Mountain01_Upper_material
        objectName: "MI_Troll_Body_Mountain01_Upper"
        baseColorMap: textures_MI_Troll_Body_Mountain01_Upper_baseColor_png_texture
        metalness: 0.6009243130683899
        roughness: 0.5023168921470642
        normalMap: textures_MI_Troll_Body_Mountain01_Upper_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            _rootJoint,
            ik_Spine3_02,
            ik_Spine3_end_0137,
            ik_RightHand_03,
            ik_RightHand_end_0138,
            skt_FX_Reference2_04,
            skt_FX_Reference2_end_0139,
            skt_FX_Reference1_05,
            skt_FX_Reference1_end_0140,
            skt_Reference_06,
            skt_Reference_end_0141,
            ik_LeftHand_07,
            ik_LeftHand_end_0142,
            skt_HeadCamera_08,
            skt_HeadCamera_end_0143,
            hips_09,
            rightUpLeg_010,
            rightLeg_011,
            rightLegTwist1_012,
            rightLegTwist1_end_0144,
            rightFoot_013,
            rightToeBase_014,
            rightFootIndex1_015,
            rightFootIndex2_016,
            rightFootIndex3_017,
            rightFootIndex3_end_0145,
            rightFootBigToe1_018,
            rightFootBigToe2_019,
            rightFootBigToe3_020,
            rightFootBigToe3_end_0146,
            rightToeBaseEnd_021,
            rightToeBaseEnd_end_0147,
            rightUpLegTwist1_022,
            rightUpLegTwist1_end_0148,
            rightUpLegTwist2_023,
            rightUpLegTwist2_end_0149,
            skt_FX_Hips_024,
            skt_FX_Hips_end_0150,
            spine_025,
            spine1_026,
            spine2_027,
            spine3_028,
            skt_Back_029,
            skt_Back_end_0151,
            skt_Chest_030,
            skt_Chest_end_0152,
            leftShoulder_031,
            leftArm_032,
            leftForeArm_033,
            leftForeArmTwist3_034,
            leftForeArmTwist3_end_0153,
            leftForeArmTwist1_035,
            leftForeArmTwist1_end_0154,
            leftHand_036,
            leftInHandPinky_037,
            leftHandPinky1_038,
            leftHandPinky2_039,
            leftHandPinky3_040,
            leftHandPinky4_041,
            leftHandPinky4_end_0156,
            skt_LeftHand_042,
            skt_LeftHand_end_0157,
            leftInHandIndex_043,
            leftHandIndex1_044,
            leftHandIndex2_045,
            leftHandIndex3_046,
            leftHandIndex4_047,
            leftHandIndex4_end_0158,
            skt_FX_LeftHand_00,
            skt_FX_LeftHand_end_0159,
            leftHandThumb1_01,
            leftHandThumb2_048,
            leftHandThumb3_049,
            leftHandThumb4_050,
            leftHandThumb4_end_0160,
            leftInHandMiddle_051,
            leftHandMiddle1_052,
            leftHandMiddle2_053,
            leftHandMiddle3_054,
            leftHandMiddle4_055,
            leftHandMiddle4_end_0161,
            leftForeArmTwist2_056,
            leftForeArmTwist2_end_0162,
            leftArmTwist1_057,
            leftArmTwist1_end_0163,
            leftArmTwist2_058,
            leftArmTwist2_end_0164,
            neck_059,
            neck1_060,
            head_061,
            skt_Head_062,
            skt_Head_end_0165,
            headEnd_063,
            headEnd_end_0166,
            face_064,
            jaw_065,
            jaw_end_0167,
            eye_left_066,
            eye_left_end_0168,
            nose_067,
            nose_end_0169,
            lip_corners_068,
            lip_upper_069,
            lip_upper_end_0170,
            lip_lower_070,
            lip_lower_end_0171,
            eye_lid_right_071,
            eye_lid_in_right_072,
            eye_lid_in_right_end_0172,
            eye_lid_out_right_073,
            eye_lid_out_right_end_0173,
            mouth_bag_074,
            tongue_jaw_075,
            tongue_01_076,
            tongue_02_077,
            tongue_03_078,
            tongue_04_079,
            tongue_05_080,
            tongue_06_081,
            tongue_06_end_0174,
            teeth_lwr_082,
            teeth_lwr_end_0175,
            teeth_upr_083,
            teeth_upr_end_0155,
            eye_right_084,
            eye_right_end_0177,
            eye_lid_left_085,
            eye_lid_out_left_086,
            eye_lid_out_left_end_0178,
            eye_lid_in_left_087,
            eye_lid_in_left_end_0179,
            rightShoulder_088,
            rightArm_089,
            rightArmTwist1_090,
            rightArmTwist1_end_0180,
            rightForeArm_091,
            rightHand_092,
            skt_FX_RightHand_093,
            skt_FX_RightHand_end_0181,
            rightHandThumb1_094,
            rightHandThumb2_095,
            rightHandThumb3_096,
            rightHandThumb4_097,
            rightHandThumb4_end_0182,
            rightInHandMiddle_098,
            rightHandMiddle1_099,
            rightHandMiddle2_0100,
            rightHandMiddle3_0101,
            rightHandMiddle4_0102,
            rightHandMiddle4_end_0183,
            skt_RightHand_0103,
            skt_RightHand_end_0184,
            rightInHandIndex_0104,
            rightHandIndex1_0105,
            rightHandIndex2_0106,
            rightHandIndex3_0107,
            rightHandIndex4_0108,
            rightHandIndex4_end_0185,
            rightInHandPinky_0109,
            rightHandPinky1_0110,
            rightHandPinky2_0111,
            rightHandPinky3_0112,
            rightHandPinky4_0113,
            rightHandPinky4_end_0186,
            rightForeArmTwist3_0114,
            rightForeArmTwist3_end_0187,
            rightForeArmTwist2_0115,
            rightForeArmTwist2_end_0188,
            rightForeArmTwist1_0116,
            rightForeArmTwist1_end_0189,
            rightArmTwist2_0117,
            rightArmTwist2_end_0190,
            leftUpLeg_0118,
            leftLeg_0119,
            leftLegTwist1_0120,
            leftLegTwist1_end_0191,
            leftFoot_0121,
            leftToeBase_0122,
            leftFootBigToe1_0123,
            leftFootBigToe2_0124,
            leftFootBigToe3_0125,
            leftFootBigToe3_end_0192,
            leftFootIndex1_0126,
            leftFootIndex2_0127,
            leftFootIndex3_0128,
            leftFootIndex3_end_0193,
            leftToeBaseEnd_0129,
            leftToeBaseEnd_end_0194,
            leftUpLegTwist1_0130,
            leftUpLegTwist1_end_0195,
            leftUpLegTwist2_0131,
            leftUpLegTwist2_end_0176,
            skt_Hips_0132,
            skt_Hips_end_0196,
            ik_Hips_0133,
            ik_Hips_end_0197,
            ik_LeftFoot_0134,
            ik_LeftFoot_end_0198,
            ik_RightFoot_0135,
            ik_RightFoot_end_0199,
            ik_Head_0136,
            ik_Head_end_0200
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393701, 0, 0, -2.10309e-14, 0, 0.393701, -1.23589e-07, -193.625, 0, 1.23589e-07, 0.393701, 0.768954, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194054, 0.387315, -0.067906, -163.813, -0.00272997, -0.0678543, -0.3878, 26.4824, -0.393213, 0.0195854, -0.000658825, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, 0.365658, 0.144816, -87.9083, 0.00781599, 0.144606, -0.366099, -22.8358, -0.393213, 0.0195852, -0.000658853, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, 0.365658, 0.144815, -68.1571, 0.007816, 0.144606, -0.366099, -22.8359, -0.393213, 0.0195854, -0.00065879, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250579, 0.243036, -0.308716, -28.2432, 0.0209258, -0.30973, -0.242136, 23.8399, -0.392345, -0.000997496, -0.0326312, -45.6545, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326222, 0.00310541, -0.392335, 18.8604, 0.00125296, -0.393687, -0.00301194, 15.5573, -0.392345, -0.000999042, -0.032631, -45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696651, 0.00318602, -0.387475, 41.3986, 0.00125218, -0.393687, -0.00301197, 16.9021, -0.387486, -0.000699418, -0.0696729, -65.2641, 0, 0, 0, 1),
            Qt.matrix4x4(0.0686039, 0.0650144, -0.382187, 49.7479, 0.0121842, -0.388295, -0.0638664, 25.0309, -0.387486, -0.000698919, -0.069674, -65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00434356, 0.00718906, -0.393611, 19.4089, 0.00126082, -0.393633, -0.00717555, 21.4516, -0.393675, -0.00118136, -0.00436584, -30.9217, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186385, 0.121855, -0.373904, 29.8998, -0.00902871, -0.374358, -0.121553, 31.6623, -0.393156, 0.00282016, 0.0205173, -33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, 0.387315, -0.067906, -153.473, -0.00273003, -0.0678543, -0.3878, 26.4825, -0.393213, 0.0195854, -0.000658759, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-5.91801e-10, 0.393468, 0.0135351, -200.635, -3.81758e-08, 0.0135351, -0.393468, -4.90527, -0.393701, -1.9039e-09, 3.81329e-08, 7.77236e-07, 0, 0, 0, 1),
            Qt.matrix4x4(2.57571e-08, 0.390347, -0.0512782, -221.861, -2.67425e-08, -0.0512782, -0.390347, 31.9709, -0.393701, 2.90208e-08, 2.31599e-08, -1.66981e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-3.58487e-08, 0.388986, -0.0607465, -245.439, -4.14643e-08, -0.0607465, -0.388986, 37.9583, -0.393701, -2.90216e-08, 4.64991e-08, 1.80012e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.28895e-08, 0.386733, -0.0737436, -275.647, -8.70361e-08, -0.0737436, -0.386733, 47.2191, -0.393701, -2.58278e-08, 9.35293e-08, 1.87443e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, 0.010452, -0.0152312, -12.3193, 0.00957816, -0.39295, -0.022345, 285.685, -0.0157954, 0.0219498, -0.392771, -28.9278, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596668, 205.288, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729563, -0.371585, 55.0382, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, -0.269584, 0.146543, 98.5805, -0.306643, -0.209871, 0.130096, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246678, -0.269584, 0.146542, 38.7266, -0.306643, -0.209871, 0.130095, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, -0.269682, 0.095223, 12.997, -0.28587, -0.258957, 0.07887, 219.756, 0.00860766, -0.123344, -0.373781, 64.2652, 0, 0, 0, 1),
            Qt.matrix4x4(0.254654, -0.262181, 0.146331, 8.63408, -0.296463, -0.249947, 0.0680912, 221.494, 0.0475559, -0.154232, -0.359098, 42.2644, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735805, -0.359221, 0.143341, 83.9324, -0.380975, -0.0421679, 0.0898889, 186.843, -0.0666637, -0.155508, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506144, -0.361017, 0.156976, 96.0873, -0.387983, 0.0220099, 0.0631288, 172.467, -0.0666638, -0.155507, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430921, -0.355501, 0.163592, 106.46, -0.385616, 0.0666103, 0.0431747, 160.504, -0.0666638, -0.155507, -0.355491, 89.8327, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255003, -0.257623, 0.153636, 6.48442, -0.279203, -0.277565, -0.00201473, 227.811, 0.109634, -0.10765, -0.362481, 28.574, 0, 0, 0, 1),
            Qt.matrix4x4(0.13068, -0.347117, 0.132034, 55.5361, -0.366378, -0.143393, -0.0143569, 224.41, 0.0607472, -0.118105, -0.370623, 56.7679, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402106, -0.375286, 0.118932, 107.897, -0.388965, -0.0145656, -0.059112, 199.405, 0.0607471, -0.118105, -0.370623, 56.7678, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545026, -0.373999, 0.110247, 115.691, -0.385149, 0.0342969, -0.0740572, 185.293, 0.0607471, -0.118105, -0.370623, 56.7677, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219666, -0.154902, 0.36128, 26.7368, 0.091848, -0.349805, -0.155567, 126.813, 0.382207, 0.0929642, 0.0166203, -176.356, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134911, -0.206103, 0.335172, 37.8204, 0.0833917, -0.326252, -0.203975, 126.186, 0.384531, 0.077984, 0.0324758, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444807, -0.315588, 0.231141, 70.7153, 0.071817, -0.222088, -0.317048, 107.253, 0.384531, 0.077984, 0.0324763, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, -0.326564, 0.124227, 71.0265, -0.346597, -0.185914, 0.017525, 213.163, 0.044126, -0.117441, -0.373177, 45.7714, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, -0.360419, 0.120599, 71.9804, -0.380027, -0.099069, 0.0276564, 213.135, 0.00502857, -0.123628, -0.373753, 66.947, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108465, -0.373598, 0.123722, 95.1038, -0.393519, -0.0118772, -0.00136596, 196.318, 0.00502869, -0.123628, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394787, -0.372058, 0.122535, 105.34, -0.391684, 0.0359134, -0.0171491, 184.379, 0.00502866, -0.123627, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222188, -0.325012, -0.00059676, 193.3, -0.306643, -0.20987, 0.130096, 204.186, -0.107716, -0.0729558, -0.371585, 55.0379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596791, 158.272, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729561, -0.371585, 55.0381, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-4.00634e-07, 0.257691, 0.29765, -207.307, -5.04721e-07, 0.29765, -0.257691, -229.86, -0.393701, -6.43814e-07, 2.74665e-08, 0.000502841, 0, 0, 0, 1),
            Qt.matrix4x4(8.2134e-08, 0.361953, 0.154889, -296.11, -3.14391e-07, 0.154889, -0.361953, -111.539, -0.393701, -4.81766e-08, 3.21352e-07, 1.77883e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.52152e-08, 0.39368, 0.00406061, -325.901, -8.54108e-08, 0.00406061, -0.39368, 14.706, -0.393701, -4.60937e-08, 8.49399e-08, 2.61067e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, -0.0104519, 0.0152318, 12.3192, 0.00957801, 0.39295, 0.0223447, -285.684, -0.0157959, -0.0219496, 0.392771, 28.9275, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596062, -205.288, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729569, 0.371584, -55.0388, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596035, -193.299, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729568, 0.371585, -55.0386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -98.5801, -0.306643, 0.209871, -0.130096, -204.187, -0.0109642, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, 0.269681, -0.0952237, -12.9963, -0.28587, 0.258957, -0.078871, -219.756, 0.00860753, 0.123345, 0.373781, -64.266, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219683, 0.154901, -0.361281, -26.735, 0.0918497, 0.349805, 0.155565, -126.812, 0.382206, -0.0929665, -0.0166191, 176.357, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134919, 0.206102, -0.335172, -37.8192, 0.0833931, 0.326253, 0.203974, -126.186, 0.384531, -0.0779857, -0.0324757, 173.065, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444822, 0.315587, -0.231142, -70.7141, 0.0718177, 0.222089, 0.317048, -107.253, 0.384531, -0.0779856, -0.0324758, 173.064, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, 0.326564, -0.124228, -71.0255, -0.346597, 0.185914, -0.0175258, -213.164, 0.044126, 0.117442, 0.373177, -45.7721, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, 0.360418, -0.120601, -71.9796, -0.380027, 0.0990695, -0.0276568, -213.135, 0.0050288, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108476, 0.373598, -0.123724, -95.1032, -0.393519, 0.0118783, 0.00136568, -196.319, 0.00502881, 0.123629, 0.373753, -66.948, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394777, 0.372057, -0.122537, -105.339, -0.391684, -0.0359122, 0.017149, -184.38, 0.0050287, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255004, 0.257622, -0.153637, -6.48325, -0.279202, 0.277566, 0.00201373, -227.811, 0.109634, 0.107651, 0.362481, -28.5746, 0, 0, 0, 1),
            Qt.matrix4x4(0.130681, 0.347116, -0.132035, -55.5355, -0.366378, 0.143394, 0.0143561, -224.411, 0.0607472, 0.118107, 0.370623, -56.7689, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402026, 0.375285, -0.118934, -107.896, -0.388965, 0.0145666, 0.0591119, -199.406, 0.0607474, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545015, 0.373999, -0.110249, -115.69, -0.385149, -0.0342954, 0.0740571, -185.294, 0.0607471, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.254655, 0.26218, -0.146332, -8.63357, -0.296462, 0.249948, -0.0680925, -221.494, 0.0475558, 0.154234, 0.359097, -42.2654, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735814, 0.35922, -0.143343, -83.9317, -0.380975, 0.0421684, -0.0898891, -186.843, -0.0666633, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506219, 0.361016, -0.156978, -96.0868, -0.387983, -0.0220093, -0.0631286, -172.467, -0.0666633, 0.155509, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430916, 0.3555, -0.163595, -106.46, -0.385616, -0.06661, -0.0431741, -160.504, -0.0666635, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -38.7256, -0.306643, 0.20987, -0.130096, -204.187, -0.0109643, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.22219, 0.325011, 0.000596767, -158.271, -0.306642, 0.209871, -0.130096, -204.187, -0.107716, 0.0729565, 0.371585, -55.0385, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.0679061, 163.813, -0.00273026, 0.0678544, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658538, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, -0.365658, -0.144816, 87.9082, 0.00781589, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195854, 0.000658678, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, -0.365658, -0.144816, 68.1571, 0.00781608, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195853, 0.000658909, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250576, -0.243036, 0.308717, 28.2433, 0.0209257, 0.30973, 0.242135, -23.8399, -0.392345, 0.000997606, 0.0326308, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326224, -0.00310523, 0.392335, -18.8605, 0.00125134, 0.393687, 0.00301188, -15.5571, -0.392345, 0.000997432, 0.0326311, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.00413564, -0.00302487, 0.393667, -21.1656, 0.00124899, 0.393687, 0.0030119, -21.4972, -0.393677, 0.00121724, 0.0041451, 30.9046, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186383, -0.121855, 0.373904, -29.8999, -0.00902856, 0.374358, 0.121553, -31.6623, -0.393156, -0.00282011, -0.020517, 33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696663, -0.00318584, 0.387475, -41.3988, 0.00125156, 0.393687, 0.0030119, -16.9019, -0.387486, 0.000698806, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(0.068604, -0.0650142, 0.382187, -49.7479, 0.0121837, 0.388295, 0.0638662, -25.0307, -0.387486, 0.000698457, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.067906, 153.473, -0.00272996, 0.0678543, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658833, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }
    PrincipledMaterial {
        id: mi_Troll_Body_Mountain01_Lower_material
        objectName: "MI_Troll_Body_Mountain01_Lower"
        baseColorMap: textures_MI_Troll_Body_Mountain01_Lower_baseColor_png_texture
        metalness: 0.6312893629074097
        roughness: 0.44158676266670227
        normalMap: textures_MI_Troll_Body_Mountain01_Lower_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin225
        joints: [
            _rootJoint,
            ik_Spine3_02,
            ik_Spine3_end_0137,
            ik_RightHand_03,
            ik_RightHand_end_0138,
            skt_FX_Reference2_04,
            skt_FX_Reference2_end_0139,
            skt_FX_Reference1_05,
            skt_FX_Reference1_end_0140,
            skt_Reference_06,
            skt_Reference_end_0141,
            ik_LeftHand_07,
            ik_LeftHand_end_0142,
            skt_HeadCamera_08,
            skt_HeadCamera_end_0143,
            hips_09,
            rightUpLeg_010,
            rightLeg_011,
            rightLegTwist1_012,
            rightLegTwist1_end_0144,
            rightFoot_013,
            rightToeBase_014,
            rightFootIndex1_015,
            rightFootIndex2_016,
            rightFootIndex3_017,
            rightFootIndex3_end_0145,
            rightFootBigToe1_018,
            rightFootBigToe2_019,
            rightFootBigToe3_020,
            rightFootBigToe3_end_0146,
            rightToeBaseEnd_021,
            rightToeBaseEnd_end_0147,
            rightUpLegTwist1_022,
            rightUpLegTwist1_end_0148,
            rightUpLegTwist2_023,
            rightUpLegTwist2_end_0149,
            skt_FX_Hips_024,
            skt_FX_Hips_end_0150,
            spine_025,
            spine1_026,
            spine2_027,
            spine3_028,
            skt_Back_029,
            skt_Back_end_0151,
            skt_Chest_030,
            skt_Chest_end_0152,
            leftShoulder_031,
            leftArm_032,
            leftForeArm_033,
            leftForeArmTwist3_034,
            leftForeArmTwist3_end_0153,
            leftForeArmTwist1_035,
            leftForeArmTwist1_end_0154,
            leftHand_036,
            leftInHandPinky_037,
            leftHandPinky1_038,
            leftHandPinky2_039,
            leftHandPinky3_040,
            leftHandPinky4_041,
            leftHandPinky4_end_0156,
            skt_LeftHand_042,
            skt_LeftHand_end_0157,
            leftInHandIndex_043,
            leftHandIndex1_044,
            leftHandIndex2_045,
            leftHandIndex3_046,
            leftHandIndex4_047,
            leftHandIndex4_end_0158,
            skt_FX_LeftHand_00,
            skt_FX_LeftHand_end_0159,
            leftHandThumb1_01,
            leftHandThumb2_048,
            leftHandThumb3_049,
            leftHandThumb4_050,
            leftHandThumb4_end_0160,
            leftInHandMiddle_051,
            leftHandMiddle1_052,
            leftHandMiddle2_053,
            leftHandMiddle3_054,
            leftHandMiddle4_055,
            leftHandMiddle4_end_0161,
            leftForeArmTwist2_056,
            leftForeArmTwist2_end_0162,
            leftArmTwist1_057,
            leftArmTwist1_end_0163,
            leftArmTwist2_058,
            leftArmTwist2_end_0164,
            neck_059,
            neck1_060,
            head_061,
            skt_Head_062,
            skt_Head_end_0165,
            headEnd_063,
            headEnd_end_0166,
            face_064,
            jaw_065,
            jaw_end_0167,
            eye_left_066,
            eye_left_end_0168,
            nose_067,
            nose_end_0169,
            lip_corners_068,
            lip_upper_069,
            lip_upper_end_0170,
            lip_lower_070,
            lip_lower_end_0171,
            eye_lid_right_071,
            eye_lid_in_right_072,
            eye_lid_in_right_end_0172,
            eye_lid_out_right_073,
            eye_lid_out_right_end_0173,
            mouth_bag_074,
            tongue_jaw_075,
            tongue_01_076,
            tongue_02_077,
            tongue_03_078,
            tongue_04_079,
            tongue_05_080,
            tongue_06_081,
            tongue_06_end_0174,
            teeth_lwr_082,
            teeth_lwr_end_0175,
            teeth_upr_083,
            teeth_upr_end_0155,
            eye_right_084,
            eye_right_end_0177,
            eye_lid_left_085,
            eye_lid_out_left_086,
            eye_lid_out_left_end_0178,
            eye_lid_in_left_087,
            eye_lid_in_left_end_0179,
            rightShoulder_088,
            rightArm_089,
            rightArmTwist1_090,
            rightArmTwist1_end_0180,
            rightForeArm_091,
            rightHand_092,
            skt_FX_RightHand_093,
            skt_FX_RightHand_end_0181,
            rightHandThumb1_094,
            rightHandThumb2_095,
            rightHandThumb3_096,
            rightHandThumb4_097,
            rightHandThumb4_end_0182,
            rightInHandMiddle_098,
            rightHandMiddle1_099,
            rightHandMiddle2_0100,
            rightHandMiddle3_0101,
            rightHandMiddle4_0102,
            rightHandMiddle4_end_0183,
            skt_RightHand_0103,
            skt_RightHand_end_0184,
            rightInHandIndex_0104,
            rightHandIndex1_0105,
            rightHandIndex2_0106,
            rightHandIndex3_0107,
            rightHandIndex4_0108,
            rightHandIndex4_end_0185,
            rightInHandPinky_0109,
            rightHandPinky1_0110,
            rightHandPinky2_0111,
            rightHandPinky3_0112,
            rightHandPinky4_0113,
            rightHandPinky4_end_0186,
            rightForeArmTwist3_0114,
            rightForeArmTwist3_end_0187,
            rightForeArmTwist2_0115,
            rightForeArmTwist2_end_0188,
            rightForeArmTwist1_0116,
            rightForeArmTwist1_end_0189,
            rightArmTwist2_0117,
            rightArmTwist2_end_0190,
            leftUpLeg_0118,
            leftLeg_0119,
            leftLegTwist1_0120,
            leftLegTwist1_end_0191,
            leftFoot_0121,
            leftToeBase_0122,
            leftFootBigToe1_0123,
            leftFootBigToe2_0124,
            leftFootBigToe3_0125,
            leftFootBigToe3_end_0192,
            leftFootIndex1_0126,
            leftFootIndex2_0127,
            leftFootIndex3_0128,
            leftFootIndex3_end_0193,
            leftToeBaseEnd_0129,
            leftToeBaseEnd_end_0194,
            leftUpLegTwist1_0130,
            leftUpLegTwist1_end_0195,
            leftUpLegTwist2_0131,
            leftUpLegTwist2_end_0176,
            skt_Hips_0132,
            skt_Hips_end_0196,
            ik_Hips_0133,
            ik_Hips_end_0197,
            ik_LeftFoot_0134,
            ik_LeftFoot_end_0198,
            ik_RightFoot_0135,
            ik_RightFoot_end_0199,
            ik_Head_0136,
            ik_Head_end_0200
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393701, 0, 0, -2.10309e-14, 0, 0.393701, -1.23589e-07, -193.625, 0, 1.23589e-07, 0.393701, 0.768954, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194054, 0.387315, -0.067906, -163.813, -0.00272997, -0.0678543, -0.3878, 26.4824, -0.393213, 0.0195854, -0.000658825, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, 0.365658, 0.144816, -87.9083, 0.00781599, 0.144606, -0.366099, -22.8358, -0.393213, 0.0195852, -0.000658853, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, 0.365658, 0.144815, -68.1571, 0.007816, 0.144606, -0.366099, -22.8359, -0.393213, 0.0195854, -0.00065879, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250579, 0.243036, -0.308716, -28.2432, 0.0209258, -0.30973, -0.242136, 23.8399, -0.392345, -0.000997496, -0.0326312, -45.6545, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326222, 0.00310541, -0.392335, 18.8604, 0.00125296, -0.393687, -0.00301194, 15.5573, -0.392345, -0.000999042, -0.032631, -45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696651, 0.00318602, -0.387475, 41.3986, 0.00125218, -0.393687, -0.00301197, 16.9021, -0.387486, -0.000699418, -0.0696729, -65.2641, 0, 0, 0, 1),
            Qt.matrix4x4(0.0686039, 0.0650144, -0.382187, 49.7479, 0.0121842, -0.388295, -0.0638664, 25.0309, -0.387486, -0.000698919, -0.069674, -65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00434356, 0.00718906, -0.393611, 19.4089, 0.00126082, -0.393633, -0.00717555, 21.4516, -0.393675, -0.00118136, -0.00436584, -30.9217, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186385, 0.121855, -0.373904, 29.8998, -0.00902871, -0.374358, -0.121553, 31.6623, -0.393156, 0.00282016, 0.0205173, -33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, 0.387315, -0.067906, -153.473, -0.00273003, -0.0678543, -0.3878, 26.4825, -0.393213, 0.0195854, -0.000658759, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-5.91801e-10, 0.393468, 0.0135351, -200.635, -3.81758e-08, 0.0135351, -0.393468, -4.90527, -0.393701, -1.9039e-09, 3.81329e-08, 7.77236e-07, 0, 0, 0, 1),
            Qt.matrix4x4(2.57571e-08, 0.390347, -0.0512782, -221.861, -2.67425e-08, -0.0512782, -0.390347, 31.9709, -0.393701, 2.90208e-08, 2.31599e-08, -1.66981e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-3.58487e-08, 0.388986, -0.0607465, -245.439, -4.14643e-08, -0.0607465, -0.388986, 37.9583, -0.393701, -2.90216e-08, 4.64991e-08, 1.80012e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.28895e-08, 0.386733, -0.0737436, -275.647, -8.70361e-08, -0.0737436, -0.386733, 47.2191, -0.393701, -2.58278e-08, 9.35293e-08, 1.87443e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, 0.010452, -0.0152312, -12.3193, 0.00957816, -0.39295, -0.022345, 285.685, -0.0157954, 0.0219498, -0.392771, -28.9278, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596668, 205.288, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729563, -0.371585, 55.0382, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, -0.269584, 0.146543, 98.5805, -0.306643, -0.209871, 0.130096, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246678, -0.269584, 0.146542, 38.7266, -0.306643, -0.209871, 0.130095, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, -0.269682, 0.095223, 12.997, -0.28587, -0.258957, 0.07887, 219.756, 0.00860766, -0.123344, -0.373781, 64.2652, 0, 0, 0, 1),
            Qt.matrix4x4(0.254654, -0.262181, 0.146331, 8.63408, -0.296463, -0.249947, 0.0680912, 221.494, 0.0475559, -0.154232, -0.359098, 42.2644, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735805, -0.359221, 0.143341, 83.9324, -0.380975, -0.0421679, 0.0898889, 186.843, -0.0666637, -0.155508, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506144, -0.361017, 0.156976, 96.0873, -0.387983, 0.0220099, 0.0631288, 172.467, -0.0666638, -0.155507, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430921, -0.355501, 0.163592, 106.46, -0.385616, 0.0666103, 0.0431747, 160.504, -0.0666638, -0.155507, -0.355491, 89.8327, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255003, -0.257623, 0.153636, 6.48442, -0.279203, -0.277565, -0.00201473, 227.811, 0.109634, -0.10765, -0.362481, 28.574, 0, 0, 0, 1),
            Qt.matrix4x4(0.13068, -0.347117, 0.132034, 55.5361, -0.366378, -0.143393, -0.0143569, 224.41, 0.0607472, -0.118105, -0.370623, 56.7679, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402106, -0.375286, 0.118932, 107.897, -0.388965, -0.0145656, -0.059112, 199.405, 0.0607471, -0.118105, -0.370623, 56.7678, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545026, -0.373999, 0.110247, 115.691, -0.385149, 0.0342969, -0.0740572, 185.293, 0.0607471, -0.118105, -0.370623, 56.7677, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219666, -0.154902, 0.36128, 26.7368, 0.091848, -0.349805, -0.155567, 126.813, 0.382207, 0.0929642, 0.0166203, -176.356, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134911, -0.206103, 0.335172, 37.8204, 0.0833917, -0.326252, -0.203975, 126.186, 0.384531, 0.077984, 0.0324758, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444807, -0.315588, 0.231141, 70.7153, 0.071817, -0.222088, -0.317048, 107.253, 0.384531, 0.077984, 0.0324763, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, -0.326564, 0.124227, 71.0265, -0.346597, -0.185914, 0.017525, 213.163, 0.044126, -0.117441, -0.373177, 45.7714, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, -0.360419, 0.120599, 71.9804, -0.380027, -0.099069, 0.0276564, 213.135, 0.00502857, -0.123628, -0.373753, 66.947, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108465, -0.373598, 0.123722, 95.1038, -0.393519, -0.0118772, -0.00136596, 196.318, 0.00502869, -0.123628, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394787, -0.372058, 0.122535, 105.34, -0.391684, 0.0359134, -0.0171491, 184.379, 0.00502866, -0.123627, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222188, -0.325012, -0.00059676, 193.3, -0.306643, -0.20987, 0.130096, 204.186, -0.107716, -0.0729558, -0.371585, 55.0379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596791, 158.272, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729561, -0.371585, 55.0381, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-4.00634e-07, 0.257691, 0.29765, -207.307, -5.04721e-07, 0.29765, -0.257691, -229.86, -0.393701, -6.43814e-07, 2.74665e-08, 0.000502841, 0, 0, 0, 1),
            Qt.matrix4x4(8.2134e-08, 0.361953, 0.154889, -296.11, -3.14391e-07, 0.154889, -0.361953, -111.539, -0.393701, -4.81766e-08, 3.21352e-07, 1.77883e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.52152e-08, 0.39368, 0.00406061, -325.901, -8.54108e-08, 0.00406061, -0.39368, 14.706, -0.393701, -4.60937e-08, 8.49399e-08, 2.61067e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, -0.0104519, 0.0152318, 12.3192, 0.00957801, 0.39295, 0.0223447, -285.684, -0.0157959, -0.0219496, 0.392771, 28.9275, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596062, -205.288, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729569, 0.371584, -55.0388, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596035, -193.299, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729568, 0.371585, -55.0386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -98.5801, -0.306643, 0.209871, -0.130096, -204.187, -0.0109642, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, 0.269681, -0.0952237, -12.9963, -0.28587, 0.258957, -0.078871, -219.756, 0.00860753, 0.123345, 0.373781, -64.266, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219683, 0.154901, -0.361281, -26.735, 0.0918497, 0.349805, 0.155565, -126.812, 0.382206, -0.0929665, -0.0166191, 176.357, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134919, 0.206102, -0.335172, -37.8192, 0.0833931, 0.326253, 0.203974, -126.186, 0.384531, -0.0779857, -0.0324757, 173.065, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444822, 0.315587, -0.231142, -70.7141, 0.0718177, 0.222089, 0.317048, -107.253, 0.384531, -0.0779856, -0.0324758, 173.064, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, 0.326564, -0.124228, -71.0255, -0.346597, 0.185914, -0.0175258, -213.164, 0.044126, 0.117442, 0.373177, -45.7721, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, 0.360418, -0.120601, -71.9796, -0.380027, 0.0990695, -0.0276568, -213.135, 0.0050288, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108476, 0.373598, -0.123724, -95.1032, -0.393519, 0.0118783, 0.00136568, -196.319, 0.00502881, 0.123629, 0.373753, -66.948, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394777, 0.372057, -0.122537, -105.339, -0.391684, -0.0359122, 0.017149, -184.38, 0.0050287, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255004, 0.257622, -0.153637, -6.48325, -0.279202, 0.277566, 0.00201373, -227.811, 0.109634, 0.107651, 0.362481, -28.5746, 0, 0, 0, 1),
            Qt.matrix4x4(0.130681, 0.347116, -0.132035, -55.5355, -0.366378, 0.143394, 0.0143561, -224.411, 0.0607472, 0.118107, 0.370623, -56.7689, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402026, 0.375285, -0.118934, -107.896, -0.388965, 0.0145666, 0.0591119, -199.406, 0.0607474, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545015, 0.373999, -0.110249, -115.69, -0.385149, -0.0342954, 0.0740571, -185.294, 0.0607471, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.254655, 0.26218, -0.146332, -8.63357, -0.296462, 0.249948, -0.0680925, -221.494, 0.0475558, 0.154234, 0.359097, -42.2654, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735814, 0.35922, -0.143343, -83.9317, -0.380975, 0.0421684, -0.0898891, -186.843, -0.0666633, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506219, 0.361016, -0.156978, -96.0868, -0.387983, -0.0220093, -0.0631286, -172.467, -0.0666633, 0.155509, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430916, 0.3555, -0.163595, -106.46, -0.385616, -0.06661, -0.0431741, -160.504, -0.0666635, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -38.7256, -0.306643, 0.20987, -0.130096, -204.187, -0.0109643, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.22219, 0.325011, 0.000596767, -158.271, -0.306642, 0.209871, -0.130096, -204.187, -0.107716, 0.0729565, 0.371585, -55.0385, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.0679061, 163.813, -0.00273026, 0.0678544, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658538, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, -0.365658, -0.144816, 87.9082, 0.00781589, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195854, 0.000658678, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, -0.365658, -0.144816, 68.1571, 0.00781608, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195853, 0.000658909, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250576, -0.243036, 0.308717, 28.2433, 0.0209257, 0.30973, 0.242135, -23.8399, -0.392345, 0.000997606, 0.0326308, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326224, -0.00310523, 0.392335, -18.8605, 0.00125134, 0.393687, 0.00301188, -15.5571, -0.392345, 0.000997432, 0.0326311, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.00413564, -0.00302487, 0.393667, -21.1656, 0.00124899, 0.393687, 0.0030119, -21.4972, -0.393677, 0.00121724, 0.0041451, 30.9046, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186383, -0.121855, 0.373904, -29.8999, -0.00902856, 0.374358, 0.121553, -31.6623, -0.393156, -0.00282011, -0.020517, 33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696663, -0.00318584, 0.387475, -41.3988, 0.00125156, 0.393687, 0.0030119, -16.9019, -0.387486, 0.000698806, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(0.068604, -0.0650142, 0.382187, -49.7479, 0.0121837, 0.388295, 0.0638662, -25.0307, -0.387486, 0.000698457, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.067906, 153.473, -0.00272996, 0.0678543, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658833, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }
    PrincipledMaterial {
        id: mi_Troll_Heads_Eye_Master_material
        objectName: "MI_Troll_Heads_Eye_Master"
        baseColorMap: textures_MI_Troll_Heads_Eye_Master_baseColor_png_texture
        roughness: 0.830820620059967
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
        clearcoatAmount: 1
        clearcoatRoughnessAmount: 0.03999999910593033
    }
    Skin {
        id: skin230
        joints: [
            _rootJoint,
            ik_Spine3_02,
            ik_Spine3_end_0137,
            ik_RightHand_03,
            ik_RightHand_end_0138,
            skt_FX_Reference2_04,
            skt_FX_Reference2_end_0139,
            skt_FX_Reference1_05,
            skt_FX_Reference1_end_0140,
            skt_Reference_06,
            skt_Reference_end_0141,
            ik_LeftHand_07,
            ik_LeftHand_end_0142,
            skt_HeadCamera_08,
            skt_HeadCamera_end_0143,
            hips_09,
            rightUpLeg_010,
            rightLeg_011,
            rightLegTwist1_012,
            rightLegTwist1_end_0144,
            rightFoot_013,
            rightToeBase_014,
            rightFootIndex1_015,
            rightFootIndex2_016,
            rightFootIndex3_017,
            rightFootIndex3_end_0145,
            rightFootBigToe1_018,
            rightFootBigToe2_019,
            rightFootBigToe3_020,
            rightFootBigToe3_end_0146,
            rightToeBaseEnd_021,
            rightToeBaseEnd_end_0147,
            rightUpLegTwist1_022,
            rightUpLegTwist1_end_0148,
            rightUpLegTwist2_023,
            rightUpLegTwist2_end_0149,
            skt_FX_Hips_024,
            skt_FX_Hips_end_0150,
            spine_025,
            spine1_026,
            spine2_027,
            spine3_028,
            skt_Back_029,
            skt_Back_end_0151,
            skt_Chest_030,
            skt_Chest_end_0152,
            leftShoulder_031,
            leftArm_032,
            leftForeArm_033,
            leftForeArmTwist3_034,
            leftForeArmTwist3_end_0153,
            leftForeArmTwist1_035,
            leftForeArmTwist1_end_0154,
            leftHand_036,
            leftInHandPinky_037,
            leftHandPinky1_038,
            leftHandPinky2_039,
            leftHandPinky3_040,
            leftHandPinky4_041,
            leftHandPinky4_end_0156,
            skt_LeftHand_042,
            skt_LeftHand_end_0157,
            leftInHandIndex_043,
            leftHandIndex1_044,
            leftHandIndex2_045,
            leftHandIndex3_046,
            leftHandIndex4_047,
            leftHandIndex4_end_0158,
            skt_FX_LeftHand_00,
            skt_FX_LeftHand_end_0159,
            leftHandThumb1_01,
            leftHandThumb2_048,
            leftHandThumb3_049,
            leftHandThumb4_050,
            leftHandThumb4_end_0160,
            leftInHandMiddle_051,
            leftHandMiddle1_052,
            leftHandMiddle2_053,
            leftHandMiddle3_054,
            leftHandMiddle4_055,
            leftHandMiddle4_end_0161,
            leftForeArmTwist2_056,
            leftForeArmTwist2_end_0162,
            leftArmTwist1_057,
            leftArmTwist1_end_0163,
            leftArmTwist2_058,
            leftArmTwist2_end_0164,
            neck_059,
            neck1_060,
            head_061,
            skt_Head_062,
            skt_Head_end_0165,
            headEnd_063,
            headEnd_end_0166,
            face_064,
            jaw_065,
            jaw_end_0167,
            eye_left_066,
            eye_left_end_0168,
            nose_067,
            nose_end_0169,
            lip_corners_068,
            lip_upper_069,
            lip_upper_end_0170,
            lip_lower_070,
            lip_lower_end_0171,
            eye_lid_right_071,
            eye_lid_in_right_072,
            eye_lid_in_right_end_0172,
            eye_lid_out_right_073,
            eye_lid_out_right_end_0173,
            mouth_bag_074,
            tongue_jaw_075,
            tongue_01_076,
            tongue_02_077,
            tongue_03_078,
            tongue_04_079,
            tongue_05_080,
            tongue_06_081,
            tongue_06_end_0174,
            teeth_lwr_082,
            teeth_lwr_end_0175,
            teeth_upr_083,
            teeth_upr_end_0155,
            eye_right_084,
            eye_right_end_0177,
            eye_lid_left_085,
            eye_lid_out_left_086,
            eye_lid_out_left_end_0178,
            eye_lid_in_left_087,
            eye_lid_in_left_end_0179,
            rightShoulder_088,
            rightArm_089,
            rightArmTwist1_090,
            rightArmTwist1_end_0180,
            rightForeArm_091,
            rightHand_092,
            skt_FX_RightHand_093,
            skt_FX_RightHand_end_0181,
            rightHandThumb1_094,
            rightHandThumb2_095,
            rightHandThumb3_096,
            rightHandThumb4_097,
            rightHandThumb4_end_0182,
            rightInHandMiddle_098,
            rightHandMiddle1_099,
            rightHandMiddle2_0100,
            rightHandMiddle3_0101,
            rightHandMiddle4_0102,
            rightHandMiddle4_end_0183,
            skt_RightHand_0103,
            skt_RightHand_end_0184,
            rightInHandIndex_0104,
            rightHandIndex1_0105,
            rightHandIndex2_0106,
            rightHandIndex3_0107,
            rightHandIndex4_0108,
            rightHandIndex4_end_0185,
            rightInHandPinky_0109,
            rightHandPinky1_0110,
            rightHandPinky2_0111,
            rightHandPinky3_0112,
            rightHandPinky4_0113,
            rightHandPinky4_end_0186,
            rightForeArmTwist3_0114,
            rightForeArmTwist3_end_0187,
            rightForeArmTwist2_0115,
            rightForeArmTwist2_end_0188,
            rightForeArmTwist1_0116,
            rightForeArmTwist1_end_0189,
            rightArmTwist2_0117,
            rightArmTwist2_end_0190,
            leftUpLeg_0118,
            leftLeg_0119,
            leftLegTwist1_0120,
            leftLegTwist1_end_0191,
            leftFoot_0121,
            leftToeBase_0122,
            leftFootBigToe1_0123,
            leftFootBigToe2_0124,
            leftFootBigToe3_0125,
            leftFootBigToe3_end_0192,
            leftFootIndex1_0126,
            leftFootIndex2_0127,
            leftFootIndex3_0128,
            leftFootIndex3_end_0193,
            leftToeBaseEnd_0129,
            leftToeBaseEnd_end_0194,
            leftUpLegTwist1_0130,
            leftUpLegTwist1_end_0195,
            leftUpLegTwist2_0131,
            leftUpLegTwist2_end_0176,
            skt_Hips_0132,
            skt_Hips_end_0196,
            ik_Hips_0133,
            ik_Hips_end_0197,
            ik_LeftFoot_0134,
            ik_LeftFoot_end_0198,
            ik_RightFoot_0135,
            ik_RightFoot_end_0199,
            ik_Head_0136,
            ik_Head_end_0200
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393701, 0, 0, -2.10309e-14, 0, 0.393701, -1.23589e-07, -193.625, 0, 1.23589e-07, 0.393701, 0.768954, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194054, 0.387315, -0.067906, -163.813, -0.00272997, -0.0678543, -0.3878, 26.4824, -0.393213, 0.0195854, -0.000658825, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, 0.365658, 0.144816, -87.9083, 0.00781599, 0.144606, -0.366099, -22.8358, -0.393213, 0.0195852, -0.000658853, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, 0.365658, 0.144815, -68.1571, 0.007816, 0.144606, -0.366099, -22.8359, -0.393213, 0.0195854, -0.00065879, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250579, 0.243036, -0.308716, -28.2432, 0.0209258, -0.30973, -0.242136, 23.8399, -0.392345, -0.000997496, -0.0326312, -45.6545, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326222, 0.00310541, -0.392335, 18.8604, 0.00125296, -0.393687, -0.00301194, 15.5573, -0.392345, -0.000999042, -0.032631, -45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696651, 0.00318602, -0.387475, 41.3986, 0.00125218, -0.393687, -0.00301197, 16.9021, -0.387486, -0.000699418, -0.0696729, -65.2641, 0, 0, 0, 1),
            Qt.matrix4x4(0.0686039, 0.0650144, -0.382187, 49.7479, 0.0121842, -0.388295, -0.0638664, 25.0309, -0.387486, -0.000698919, -0.069674, -65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00434356, 0.00718906, -0.393611, 19.4089, 0.00126082, -0.393633, -0.00717555, 21.4516, -0.393675, -0.00118136, -0.00436584, -30.9217, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186385, 0.121855, -0.373904, 29.8998, -0.00902871, -0.374358, -0.121553, 31.6623, -0.393156, 0.00282016, 0.0205173, -33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, 0.387315, -0.067906, -153.473, -0.00273003, -0.0678543, -0.3878, 26.4825, -0.393213, 0.0195854, -0.000658759, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-5.91801e-10, 0.393468, 0.0135351, -200.635, -3.81758e-08, 0.0135351, -0.393468, -4.90527, -0.393701, -1.9039e-09, 3.81329e-08, 7.77236e-07, 0, 0, 0, 1),
            Qt.matrix4x4(2.57571e-08, 0.390347, -0.0512782, -221.861, -2.67425e-08, -0.0512782, -0.390347, 31.9709, -0.393701, 2.90208e-08, 2.31599e-08, -1.66981e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-3.58487e-08, 0.388986, -0.0607465, -245.439, -4.14643e-08, -0.0607465, -0.388986, 37.9583, -0.393701, -2.90216e-08, 4.64991e-08, 1.80012e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.28895e-08, 0.386733, -0.0737436, -275.647, -8.70361e-08, -0.0737436, -0.386733, 47.2191, -0.393701, -2.58278e-08, 9.35293e-08, 1.87443e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, 0.010452, -0.0152312, -12.3193, 0.00957816, -0.39295, -0.022345, 285.685, -0.0157954, 0.0219498, -0.392771, -28.9278, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596668, 205.288, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729563, -0.371585, 55.0382, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, -0.269584, 0.146543, 98.5805, -0.306643, -0.209871, 0.130096, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246678, -0.269584, 0.146542, 38.7266, -0.306643, -0.209871, 0.130095, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, -0.269682, 0.095223, 12.997, -0.28587, -0.258957, 0.07887, 219.756, 0.00860766, -0.123344, -0.373781, 64.2652, 0, 0, 0, 1),
            Qt.matrix4x4(0.254654, -0.262181, 0.146331, 8.63408, -0.296463, -0.249947, 0.0680912, 221.494, 0.0475559, -0.154232, -0.359098, 42.2644, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735805, -0.359221, 0.143341, 83.9324, -0.380975, -0.0421679, 0.0898889, 186.843, -0.0666637, -0.155508, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506144, -0.361017, 0.156976, 96.0873, -0.387983, 0.0220099, 0.0631288, 172.467, -0.0666638, -0.155507, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430921, -0.355501, 0.163592, 106.46, -0.385616, 0.0666103, 0.0431747, 160.504, -0.0666638, -0.155507, -0.355491, 89.8327, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255003, -0.257623, 0.153636, 6.48442, -0.279203, -0.277565, -0.00201473, 227.811, 0.109634, -0.10765, -0.362481, 28.574, 0, 0, 0, 1),
            Qt.matrix4x4(0.13068, -0.347117, 0.132034, 55.5361, -0.366378, -0.143393, -0.0143569, 224.41, 0.0607472, -0.118105, -0.370623, 56.7679, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402106, -0.375286, 0.118932, 107.897, -0.388965, -0.0145656, -0.059112, 199.405, 0.0607471, -0.118105, -0.370623, 56.7678, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545026, -0.373999, 0.110247, 115.691, -0.385149, 0.0342969, -0.0740572, 185.293, 0.0607471, -0.118105, -0.370623, 56.7677, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219666, -0.154902, 0.36128, 26.7368, 0.091848, -0.349805, -0.155567, 126.813, 0.382207, 0.0929642, 0.0166203, -176.356, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134911, -0.206103, 0.335172, 37.8204, 0.0833917, -0.326252, -0.203975, 126.186, 0.384531, 0.077984, 0.0324758, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444807, -0.315588, 0.231141, 70.7153, 0.071817, -0.222088, -0.317048, 107.253, 0.384531, 0.077984, 0.0324763, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, -0.326564, 0.124227, 71.0265, -0.346597, -0.185914, 0.017525, 213.163, 0.044126, -0.117441, -0.373177, 45.7714, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, -0.360419, 0.120599, 71.9804, -0.380027, -0.099069, 0.0276564, 213.135, 0.00502857, -0.123628, -0.373753, 66.947, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108465, -0.373598, 0.123722, 95.1038, -0.393519, -0.0118772, -0.00136596, 196.318, 0.00502869, -0.123628, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394787, -0.372058, 0.122535, 105.34, -0.391684, 0.0359134, -0.0171491, 184.379, 0.00502866, -0.123627, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222188, -0.325012, -0.00059676, 193.3, -0.306643, -0.20987, 0.130096, 204.186, -0.107716, -0.0729558, -0.371585, 55.0379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596791, 158.272, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729561, -0.371585, 55.0381, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-4.00634e-07, 0.257691, 0.29765, -207.307, -5.04721e-07, 0.29765, -0.257691, -229.86, -0.393701, -6.43814e-07, 2.74665e-08, 0.000502841, 0, 0, 0, 1),
            Qt.matrix4x4(8.2134e-08, 0.361953, 0.154889, -296.11, -3.14391e-07, 0.154889, -0.361953, -111.539, -0.393701, -4.81766e-08, 3.21352e-07, 1.77883e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.52152e-08, 0.39368, 0.00406061, -325.901, -8.54108e-08, 0.00406061, -0.39368, 14.706, -0.393701, -4.60937e-08, 8.49399e-08, 2.61067e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, -0.0104519, 0.0152318, 12.3192, 0.00957801, 0.39295, 0.0223447, -285.684, -0.0157959, -0.0219496, 0.392771, 28.9275, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596062, -205.288, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729569, 0.371584, -55.0388, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596035, -193.299, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729568, 0.371585, -55.0386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -98.5801, -0.306643, 0.209871, -0.130096, -204.187, -0.0109642, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, 0.269681, -0.0952237, -12.9963, -0.28587, 0.258957, -0.078871, -219.756, 0.00860753, 0.123345, 0.373781, -64.266, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219683, 0.154901, -0.361281, -26.735, 0.0918497, 0.349805, 0.155565, -126.812, 0.382206, -0.0929665, -0.0166191, 176.357, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134919, 0.206102, -0.335172, -37.8192, 0.0833931, 0.326253, 0.203974, -126.186, 0.384531, -0.0779857, -0.0324757, 173.065, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444822, 0.315587, -0.231142, -70.7141, 0.0718177, 0.222089, 0.317048, -107.253, 0.384531, -0.0779856, -0.0324758, 173.064, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, 0.326564, -0.124228, -71.0255, -0.346597, 0.185914, -0.0175258, -213.164, 0.044126, 0.117442, 0.373177, -45.7721, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, 0.360418, -0.120601, -71.9796, -0.380027, 0.0990695, -0.0276568, -213.135, 0.0050288, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108476, 0.373598, -0.123724, -95.1032, -0.393519, 0.0118783, 0.00136568, -196.319, 0.00502881, 0.123629, 0.373753, -66.948, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394777, 0.372057, -0.122537, -105.339, -0.391684, -0.0359122, 0.017149, -184.38, 0.0050287, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255004, 0.257622, -0.153637, -6.48325, -0.279202, 0.277566, 0.00201373, -227.811, 0.109634, 0.107651, 0.362481, -28.5746, 0, 0, 0, 1),
            Qt.matrix4x4(0.130681, 0.347116, -0.132035, -55.5355, -0.366378, 0.143394, 0.0143561, -224.411, 0.0607472, 0.118107, 0.370623, -56.7689, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402026, 0.375285, -0.118934, -107.896, -0.388965, 0.0145666, 0.0591119, -199.406, 0.0607474, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545015, 0.373999, -0.110249, -115.69, -0.385149, -0.0342954, 0.0740571, -185.294, 0.0607471, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.254655, 0.26218, -0.146332, -8.63357, -0.296462, 0.249948, -0.0680925, -221.494, 0.0475558, 0.154234, 0.359097, -42.2654, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735814, 0.35922, -0.143343, -83.9317, -0.380975, 0.0421684, -0.0898891, -186.843, -0.0666633, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506219, 0.361016, -0.156978, -96.0868, -0.387983, -0.0220093, -0.0631286, -172.467, -0.0666633, 0.155509, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430916, 0.3555, -0.163595, -106.46, -0.385616, -0.06661, -0.0431741, -160.504, -0.0666635, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -38.7256, -0.306643, 0.20987, -0.130096, -204.187, -0.0109643, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.22219, 0.325011, 0.000596767, -158.271, -0.306642, 0.209871, -0.130096, -204.187, -0.107716, 0.0729565, 0.371585, -55.0385, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.0679061, 163.813, -0.00273026, 0.0678544, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658538, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, -0.365658, -0.144816, 87.9082, 0.00781589, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195854, 0.000658678, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, -0.365658, -0.144816, 68.1571, 0.00781608, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195853, 0.000658909, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250576, -0.243036, 0.308717, 28.2433, 0.0209257, 0.30973, 0.242135, -23.8399, -0.392345, 0.000997606, 0.0326308, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326224, -0.00310523, 0.392335, -18.8605, 0.00125134, 0.393687, 0.00301188, -15.5571, -0.392345, 0.000997432, 0.0326311, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.00413564, -0.00302487, 0.393667, -21.1656, 0.00124899, 0.393687, 0.0030119, -21.4972, -0.393677, 0.00121724, 0.0041451, 30.9046, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186383, -0.121855, 0.373904, -29.8999, -0.00902856, 0.374358, 0.121553, -31.6623, -0.393156, -0.00282011, -0.020517, 33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696663, -0.00318584, 0.387475, -41.3988, 0.00125156, 0.393687, 0.0030119, -16.9019, -0.387486, 0.000698806, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(0.068604, -0.0650142, 0.382187, -49.7479, 0.0121837, 0.388295, 0.0638662, -25.0307, -0.387486, 0.000698457, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.067906, 153.473, -0.00272996, 0.0678543, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658833, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }
    PrincipledMaterial {
        id: mi_Troll_Heads_Cave_material
        objectName: "MI_Troll_Heads_Cave"
        baseColorMap: textures_MI_Troll_Heads_Cave_baseColor_png_texture
        metalness: 0.6069973111152649
        roughness: 0.5023168921470642
        normalMap: textures_MI_Troll_Heads_Cave_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin236
        joints: [
            _rootJoint,
            ik_Spine3_02,
            ik_Spine3_end_0137,
            ik_RightHand_03,
            ik_RightHand_end_0138,
            skt_FX_Reference2_04,
            skt_FX_Reference2_end_0139,
            skt_FX_Reference1_05,
            skt_FX_Reference1_end_0140,
            skt_Reference_06,
            skt_Reference_end_0141,
            ik_LeftHand_07,
            ik_LeftHand_end_0142,
            skt_HeadCamera_08,
            skt_HeadCamera_end_0143,
            hips_09,
            rightUpLeg_010,
            rightLeg_011,
            rightLegTwist1_012,
            rightLegTwist1_end_0144,
            rightFoot_013,
            rightToeBase_014,
            rightFootIndex1_015,
            rightFootIndex2_016,
            rightFootIndex3_017,
            rightFootIndex3_end_0145,
            rightFootBigToe1_018,
            rightFootBigToe2_019,
            rightFootBigToe3_020,
            rightFootBigToe3_end_0146,
            rightToeBaseEnd_021,
            rightToeBaseEnd_end_0147,
            rightUpLegTwist1_022,
            rightUpLegTwist1_end_0148,
            rightUpLegTwist2_023,
            rightUpLegTwist2_end_0149,
            skt_FX_Hips_024,
            skt_FX_Hips_end_0150,
            spine_025,
            spine1_026,
            spine2_027,
            spine3_028,
            skt_Back_029,
            skt_Back_end_0151,
            skt_Chest_030,
            skt_Chest_end_0152,
            leftShoulder_031,
            leftArm_032,
            leftForeArm_033,
            leftForeArmTwist3_034,
            leftForeArmTwist3_end_0153,
            leftForeArmTwist1_035,
            leftForeArmTwist1_end_0154,
            leftHand_036,
            leftInHandPinky_037,
            leftHandPinky1_038,
            leftHandPinky2_039,
            leftHandPinky3_040,
            leftHandPinky4_041,
            leftHandPinky4_end_0156,
            skt_LeftHand_042,
            skt_LeftHand_end_0157,
            leftInHandIndex_043,
            leftHandIndex1_044,
            leftHandIndex2_045,
            leftHandIndex3_046,
            leftHandIndex4_047,
            leftHandIndex4_end_0158,
            skt_FX_LeftHand_00,
            skt_FX_LeftHand_end_0159,
            leftHandThumb1_01,
            leftHandThumb2_048,
            leftHandThumb3_049,
            leftHandThumb4_050,
            leftHandThumb4_end_0160,
            leftInHandMiddle_051,
            leftHandMiddle1_052,
            leftHandMiddle2_053,
            leftHandMiddle3_054,
            leftHandMiddle4_055,
            leftHandMiddle4_end_0161,
            leftForeArmTwist2_056,
            leftForeArmTwist2_end_0162,
            leftArmTwist1_057,
            leftArmTwist1_end_0163,
            leftArmTwist2_058,
            leftArmTwist2_end_0164,
            neck_059,
            neck1_060,
            head_061,
            skt_Head_062,
            skt_Head_end_0165,
            headEnd_063,
            headEnd_end_0166,
            face_064,
            jaw_065,
            jaw_end_0167,
            eye_left_066,
            eye_left_end_0168,
            nose_067,
            nose_end_0169,
            lip_corners_068,
            lip_upper_069,
            lip_upper_end_0170,
            lip_lower_070,
            lip_lower_end_0171,
            eye_lid_right_071,
            eye_lid_in_right_072,
            eye_lid_in_right_end_0172,
            eye_lid_out_right_073,
            eye_lid_out_right_end_0173,
            mouth_bag_074,
            tongue_jaw_075,
            tongue_01_076,
            tongue_02_077,
            tongue_03_078,
            tongue_04_079,
            tongue_05_080,
            tongue_06_081,
            tongue_06_end_0174,
            teeth_lwr_082,
            teeth_lwr_end_0175,
            teeth_upr_083,
            teeth_upr_end_0155,
            eye_right_084,
            eye_right_end_0177,
            eye_lid_left_085,
            eye_lid_out_left_086,
            eye_lid_out_left_end_0178,
            eye_lid_in_left_087,
            eye_lid_in_left_end_0179,
            rightShoulder_088,
            rightArm_089,
            rightArmTwist1_090,
            rightArmTwist1_end_0180,
            rightForeArm_091,
            rightHand_092,
            skt_FX_RightHand_093,
            skt_FX_RightHand_end_0181,
            rightHandThumb1_094,
            rightHandThumb2_095,
            rightHandThumb3_096,
            rightHandThumb4_097,
            rightHandThumb4_end_0182,
            rightInHandMiddle_098,
            rightHandMiddle1_099,
            rightHandMiddle2_0100,
            rightHandMiddle3_0101,
            rightHandMiddle4_0102,
            rightHandMiddle4_end_0183,
            skt_RightHand_0103,
            skt_RightHand_end_0184,
            rightInHandIndex_0104,
            rightHandIndex1_0105,
            rightHandIndex2_0106,
            rightHandIndex3_0107,
            rightHandIndex4_0108,
            rightHandIndex4_end_0185,
            rightInHandPinky_0109,
            rightHandPinky1_0110,
            rightHandPinky2_0111,
            rightHandPinky3_0112,
            rightHandPinky4_0113,
            rightHandPinky4_end_0186,
            rightForeArmTwist3_0114,
            rightForeArmTwist3_end_0187,
            rightForeArmTwist2_0115,
            rightForeArmTwist2_end_0188,
            rightForeArmTwist1_0116,
            rightForeArmTwist1_end_0189,
            rightArmTwist2_0117,
            rightArmTwist2_end_0190,
            leftUpLeg_0118,
            leftLeg_0119,
            leftLegTwist1_0120,
            leftLegTwist1_end_0191,
            leftFoot_0121,
            leftToeBase_0122,
            leftFootBigToe1_0123,
            leftFootBigToe2_0124,
            leftFootBigToe3_0125,
            leftFootBigToe3_end_0192,
            leftFootIndex1_0126,
            leftFootIndex2_0127,
            leftFootIndex3_0128,
            leftFootIndex3_end_0193,
            leftToeBaseEnd_0129,
            leftToeBaseEnd_end_0194,
            leftUpLegTwist1_0130,
            leftUpLegTwist1_end_0195,
            leftUpLegTwist2_0131,
            leftUpLegTwist2_end_0176,
            skt_Hips_0132,
            skt_Hips_end_0196,
            ik_Hips_0133,
            ik_Hips_end_0197,
            ik_LeftFoot_0134,
            ik_LeftFoot_end_0198,
            ik_RightFoot_0135,
            ik_RightFoot_end_0199,
            ik_Head_0136,
            ik_Head_end_0200
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393701, 0, 0, -2.10309e-14, 0, 0.393701, -1.23589e-07, -193.625, 0, 1.23589e-07, 0.393701, 0.768954, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194054, 0.387315, -0.067906, -163.813, -0.00272997, -0.0678543, -0.3878, 26.4824, -0.393213, 0.0195854, -0.000658825, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, 0.365658, 0.144816, -87.9083, 0.00781599, 0.144606, -0.366099, -22.8358, -0.393213, 0.0195852, -0.000658853, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, 0.365658, 0.144815, -68.1571, 0.007816, 0.144606, -0.366099, -22.8359, -0.393213, 0.0195854, -0.00065879, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250579, 0.243036, -0.308716, -28.2432, 0.0209258, -0.30973, -0.242136, 23.8399, -0.392345, -0.000997496, -0.0326312, -45.6545, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326222, 0.00310541, -0.392335, 18.8604, 0.00125296, -0.393687, -0.00301194, 15.5573, -0.392345, -0.000999042, -0.032631, -45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696651, 0.00318602, -0.387475, 41.3986, 0.00125218, -0.393687, -0.00301197, 16.9021, -0.387486, -0.000699418, -0.0696729, -65.2641, 0, 0, 0, 1),
            Qt.matrix4x4(0.0686039, 0.0650144, -0.382187, 49.7479, 0.0121842, -0.388295, -0.0638664, 25.0309, -0.387486, -0.000698919, -0.069674, -65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00434356, 0.00718906, -0.393611, 19.4089, 0.00126082, -0.393633, -0.00717555, 21.4516, -0.393675, -0.00118136, -0.00436584, -30.9217, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186385, 0.121855, -0.373904, 29.8998, -0.00902871, -0.374358, -0.121553, 31.6623, -0.393156, 0.00282016, 0.0205173, -33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, 0.387315, -0.067906, -153.473, -0.00273003, -0.0678543, -0.3878, 26.4825, -0.393213, 0.0195854, -0.000658759, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-5.91801e-10, 0.393468, 0.0135351, -200.635, -3.81758e-08, 0.0135351, -0.393468, -4.90527, -0.393701, -1.9039e-09, 3.81329e-08, 7.77236e-07, 0, 0, 0, 1),
            Qt.matrix4x4(2.57571e-08, 0.390347, -0.0512782, -221.861, -2.67425e-08, -0.0512782, -0.390347, 31.9709, -0.393701, 2.90208e-08, 2.31599e-08, -1.66981e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-3.58487e-08, 0.388986, -0.0607465, -245.439, -4.14643e-08, -0.0607465, -0.388986, 37.9583, -0.393701, -2.90216e-08, 4.64991e-08, 1.80012e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.28895e-08, 0.386733, -0.0737436, -275.647, -8.70361e-08, -0.0737436, -0.386733, 47.2191, -0.393701, -2.58278e-08, 9.35293e-08, 1.87443e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, 0.010452, -0.0152312, -12.3193, 0.00957816, -0.39295, -0.022345, 285.685, -0.0157954, 0.0219498, -0.392771, -28.9278, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596668, 205.288, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729563, -0.371585, 55.0382, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, -0.269584, 0.146543, 98.5805, -0.306643, -0.209871, 0.130096, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246678, -0.269584, 0.146542, 38.7266, -0.306643, -0.209871, 0.130095, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, -0.269682, 0.095223, 12.997, -0.28587, -0.258957, 0.07887, 219.756, 0.00860766, -0.123344, -0.373781, 64.2652, 0, 0, 0, 1),
            Qt.matrix4x4(0.254654, -0.262181, 0.146331, 8.63408, -0.296463, -0.249947, 0.0680912, 221.494, 0.0475559, -0.154232, -0.359098, 42.2644, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735805, -0.359221, 0.143341, 83.9324, -0.380975, -0.0421679, 0.0898889, 186.843, -0.0666637, -0.155508, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506144, -0.361017, 0.156976, 96.0873, -0.387983, 0.0220099, 0.0631288, 172.467, -0.0666638, -0.155507, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430921, -0.355501, 0.163592, 106.46, -0.385616, 0.0666103, 0.0431747, 160.504, -0.0666638, -0.155507, -0.355491, 89.8327, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255003, -0.257623, 0.153636, 6.48442, -0.279203, -0.277565, -0.00201473, 227.811, 0.109634, -0.10765, -0.362481, 28.574, 0, 0, 0, 1),
            Qt.matrix4x4(0.13068, -0.347117, 0.132034, 55.5361, -0.366378, -0.143393, -0.0143569, 224.41, 0.0607472, -0.118105, -0.370623, 56.7679, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402106, -0.375286, 0.118932, 107.897, -0.388965, -0.0145656, -0.059112, 199.405, 0.0607471, -0.118105, -0.370623, 56.7678, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545026, -0.373999, 0.110247, 115.691, -0.385149, 0.0342969, -0.0740572, 185.293, 0.0607471, -0.118105, -0.370623, 56.7677, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219666, -0.154902, 0.36128, 26.7368, 0.091848, -0.349805, -0.155567, 126.813, 0.382207, 0.0929642, 0.0166203, -176.356, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134911, -0.206103, 0.335172, 37.8204, 0.0833917, -0.326252, -0.203975, 126.186, 0.384531, 0.077984, 0.0324758, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444807, -0.315588, 0.231141, 70.7153, 0.071817, -0.222088, -0.317048, 107.253, 0.384531, 0.077984, 0.0324763, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, -0.326564, 0.124227, 71.0265, -0.346597, -0.185914, 0.017525, 213.163, 0.044126, -0.117441, -0.373177, 45.7714, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, -0.360419, 0.120599, 71.9804, -0.380027, -0.099069, 0.0276564, 213.135, 0.00502857, -0.123628, -0.373753, 66.947, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108465, -0.373598, 0.123722, 95.1038, -0.393519, -0.0118772, -0.00136596, 196.318, 0.00502869, -0.123628, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394787, -0.372058, 0.122535, 105.34, -0.391684, 0.0359134, -0.0171491, 184.379, 0.00502866, -0.123627, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222188, -0.325012, -0.00059676, 193.3, -0.306643, -0.20987, 0.130096, 204.186, -0.107716, -0.0729558, -0.371585, 55.0379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596791, 158.272, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729561, -0.371585, 55.0381, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-4.00634e-07, 0.257691, 0.29765, -207.307, -5.04721e-07, 0.29765, -0.257691, -229.86, -0.393701, -6.43814e-07, 2.74665e-08, 0.000502841, 0, 0, 0, 1),
            Qt.matrix4x4(8.2134e-08, 0.361953, 0.154889, -296.11, -3.14391e-07, 0.154889, -0.361953, -111.539, -0.393701, -4.81766e-08, 3.21352e-07, 1.77883e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.52152e-08, 0.39368, 0.00406061, -325.901, -8.54108e-08, 0.00406061, -0.39368, 14.706, -0.393701, -4.60937e-08, 8.49399e-08, 2.61067e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, -0.0104519, 0.0152318, 12.3192, 0.00957801, 0.39295, 0.0223447, -285.684, -0.0157959, -0.0219496, 0.392771, 28.9275, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596062, -205.288, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729569, 0.371584, -55.0388, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596035, -193.299, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729568, 0.371585, -55.0386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -98.5801, -0.306643, 0.209871, -0.130096, -204.187, -0.0109642, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, 0.269681, -0.0952237, -12.9963, -0.28587, 0.258957, -0.078871, -219.756, 0.00860753, 0.123345, 0.373781, -64.266, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219683, 0.154901, -0.361281, -26.735, 0.0918497, 0.349805, 0.155565, -126.812, 0.382206, -0.0929665, -0.0166191, 176.357, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134919, 0.206102, -0.335172, -37.8192, 0.0833931, 0.326253, 0.203974, -126.186, 0.384531, -0.0779857, -0.0324757, 173.065, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444822, 0.315587, -0.231142, -70.7141, 0.0718177, 0.222089, 0.317048, -107.253, 0.384531, -0.0779856, -0.0324758, 173.064, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, 0.326564, -0.124228, -71.0255, -0.346597, 0.185914, -0.0175258, -213.164, 0.044126, 0.117442, 0.373177, -45.7721, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, 0.360418, -0.120601, -71.9796, -0.380027, 0.0990695, -0.0276568, -213.135, 0.0050288, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108476, 0.373598, -0.123724, -95.1032, -0.393519, 0.0118783, 0.00136568, -196.319, 0.00502881, 0.123629, 0.373753, -66.948, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394777, 0.372057, -0.122537, -105.339, -0.391684, -0.0359122, 0.017149, -184.38, 0.0050287, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255004, 0.257622, -0.153637, -6.48325, -0.279202, 0.277566, 0.00201373, -227.811, 0.109634, 0.107651, 0.362481, -28.5746, 0, 0, 0, 1),
            Qt.matrix4x4(0.130681, 0.347116, -0.132035, -55.5355, -0.366378, 0.143394, 0.0143561, -224.411, 0.0607472, 0.118107, 0.370623, -56.7689, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402026, 0.375285, -0.118934, -107.896, -0.388965, 0.0145666, 0.0591119, -199.406, 0.0607474, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545015, 0.373999, -0.110249, -115.69, -0.385149, -0.0342954, 0.0740571, -185.294, 0.0607471, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.254655, 0.26218, -0.146332, -8.63357, -0.296462, 0.249948, -0.0680925, -221.494, 0.0475558, 0.154234, 0.359097, -42.2654, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735814, 0.35922, -0.143343, -83.9317, -0.380975, 0.0421684, -0.0898891, -186.843, -0.0666633, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506219, 0.361016, -0.156978, -96.0868, -0.387983, -0.0220093, -0.0631286, -172.467, -0.0666633, 0.155509, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430916, 0.3555, -0.163595, -106.46, -0.385616, -0.06661, -0.0431741, -160.504, -0.0666635, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -38.7256, -0.306643, 0.20987, -0.130096, -204.187, -0.0109643, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.22219, 0.325011, 0.000596767, -158.271, -0.306642, 0.209871, -0.130096, -204.187, -0.107716, 0.0729565, 0.371585, -55.0385, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.0679061, 163.813, -0.00273026, 0.0678544, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658538, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, -0.365658, -0.144816, 87.9082, 0.00781589, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195854, 0.000658678, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, -0.365658, -0.144816, 68.1571, 0.00781608, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195853, 0.000658909, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250576, -0.243036, 0.308717, 28.2433, 0.0209257, 0.30973, 0.242135, -23.8399, -0.392345, 0.000997606, 0.0326308, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326224, -0.00310523, 0.392335, -18.8605, 0.00125134, 0.393687, 0.00301188, -15.5571, -0.392345, 0.000997432, 0.0326311, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.00413564, -0.00302487, 0.393667, -21.1656, 0.00124899, 0.393687, 0.0030119, -21.4972, -0.393677, 0.00121724, 0.0041451, 30.9046, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186383, -0.121855, 0.373904, -29.8999, -0.00902856, 0.374358, 0.121553, -31.6623, -0.393156, -0.00282011, -0.020517, 33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696663, -0.00318584, 0.387475, -41.3988, 0.00125156, 0.393687, 0.0030119, -16.9019, -0.387486, 0.000698806, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(0.068604, -0.0650142, 0.382187, -49.7479, 0.0121837, 0.388295, 0.0638662, -25.0307, -0.387486, 0.000698457, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.067906, 153.473, -0.00272996, 0.0678543, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658833, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }
    PrincipledMaterial {
        id: mi_Troll_Heads_Teeth_material
        objectName: "MI_Troll_Heads_Teeth"
        baseColorMap: textures_MI_Troll_Heads_Teeth_baseColor_png_texture
        roughness: 0.830820620059967
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
        clearcoatAmount: 1
        clearcoatRoughnessAmount: 0.03999999910593033
    }
    Skin {
        id: skin241
        joints: [
            _rootJoint,
            ik_Spine3_02,
            ik_Spine3_end_0137,
            ik_RightHand_03,
            ik_RightHand_end_0138,
            skt_FX_Reference2_04,
            skt_FX_Reference2_end_0139,
            skt_FX_Reference1_05,
            skt_FX_Reference1_end_0140,
            skt_Reference_06,
            skt_Reference_end_0141,
            ik_LeftHand_07,
            ik_LeftHand_end_0142,
            skt_HeadCamera_08,
            skt_HeadCamera_end_0143,
            hips_09,
            rightUpLeg_010,
            rightLeg_011,
            rightLegTwist1_012,
            rightLegTwist1_end_0144,
            rightFoot_013,
            rightToeBase_014,
            rightFootIndex1_015,
            rightFootIndex2_016,
            rightFootIndex3_017,
            rightFootIndex3_end_0145,
            rightFootBigToe1_018,
            rightFootBigToe2_019,
            rightFootBigToe3_020,
            rightFootBigToe3_end_0146,
            rightToeBaseEnd_021,
            rightToeBaseEnd_end_0147,
            rightUpLegTwist1_022,
            rightUpLegTwist1_end_0148,
            rightUpLegTwist2_023,
            rightUpLegTwist2_end_0149,
            skt_FX_Hips_024,
            skt_FX_Hips_end_0150,
            spine_025,
            spine1_026,
            spine2_027,
            spine3_028,
            skt_Back_029,
            skt_Back_end_0151,
            skt_Chest_030,
            skt_Chest_end_0152,
            leftShoulder_031,
            leftArm_032,
            leftForeArm_033,
            leftForeArmTwist3_034,
            leftForeArmTwist3_end_0153,
            leftForeArmTwist1_035,
            leftForeArmTwist1_end_0154,
            leftHand_036,
            leftInHandPinky_037,
            leftHandPinky1_038,
            leftHandPinky2_039,
            leftHandPinky3_040,
            leftHandPinky4_041,
            leftHandPinky4_end_0156,
            skt_LeftHand_042,
            skt_LeftHand_end_0157,
            leftInHandIndex_043,
            leftHandIndex1_044,
            leftHandIndex2_045,
            leftHandIndex3_046,
            leftHandIndex4_047,
            leftHandIndex4_end_0158,
            skt_FX_LeftHand_00,
            skt_FX_LeftHand_end_0159,
            leftHandThumb1_01,
            leftHandThumb2_048,
            leftHandThumb3_049,
            leftHandThumb4_050,
            leftHandThumb4_end_0160,
            leftInHandMiddle_051,
            leftHandMiddle1_052,
            leftHandMiddle2_053,
            leftHandMiddle3_054,
            leftHandMiddle4_055,
            leftHandMiddle4_end_0161,
            leftForeArmTwist2_056,
            leftForeArmTwist2_end_0162,
            leftArmTwist1_057,
            leftArmTwist1_end_0163,
            leftArmTwist2_058,
            leftArmTwist2_end_0164,
            neck_059,
            neck1_060,
            head_061,
            skt_Head_062,
            skt_Head_end_0165,
            headEnd_063,
            headEnd_end_0166,
            face_064,
            jaw_065,
            jaw_end_0167,
            eye_left_066,
            eye_left_end_0168,
            nose_067,
            nose_end_0169,
            lip_corners_068,
            lip_upper_069,
            lip_upper_end_0170,
            lip_lower_070,
            lip_lower_end_0171,
            eye_lid_right_071,
            eye_lid_in_right_072,
            eye_lid_in_right_end_0172,
            eye_lid_out_right_073,
            eye_lid_out_right_end_0173,
            mouth_bag_074,
            tongue_jaw_075,
            tongue_01_076,
            tongue_02_077,
            tongue_03_078,
            tongue_04_079,
            tongue_05_080,
            tongue_06_081,
            tongue_06_end_0174,
            teeth_lwr_082,
            teeth_lwr_end_0175,
            teeth_upr_083,
            teeth_upr_end_0155,
            eye_right_084,
            eye_right_end_0177,
            eye_lid_left_085,
            eye_lid_out_left_086,
            eye_lid_out_left_end_0178,
            eye_lid_in_left_087,
            eye_lid_in_left_end_0179,
            rightShoulder_088,
            rightArm_089,
            rightArmTwist1_090,
            rightArmTwist1_end_0180,
            rightForeArm_091,
            rightHand_092,
            skt_FX_RightHand_093,
            skt_FX_RightHand_end_0181,
            rightHandThumb1_094,
            rightHandThumb2_095,
            rightHandThumb3_096,
            rightHandThumb4_097,
            rightHandThumb4_end_0182,
            rightInHandMiddle_098,
            rightHandMiddle1_099,
            rightHandMiddle2_0100,
            rightHandMiddle3_0101,
            rightHandMiddle4_0102,
            rightHandMiddle4_end_0183,
            skt_RightHand_0103,
            skt_RightHand_end_0184,
            rightInHandIndex_0104,
            rightHandIndex1_0105,
            rightHandIndex2_0106,
            rightHandIndex3_0107,
            rightHandIndex4_0108,
            rightHandIndex4_end_0185,
            rightInHandPinky_0109,
            rightHandPinky1_0110,
            rightHandPinky2_0111,
            rightHandPinky3_0112,
            rightHandPinky4_0113,
            rightHandPinky4_end_0186,
            rightForeArmTwist3_0114,
            rightForeArmTwist3_end_0187,
            rightForeArmTwist2_0115,
            rightForeArmTwist2_end_0188,
            rightForeArmTwist1_0116,
            rightForeArmTwist1_end_0189,
            rightArmTwist2_0117,
            rightArmTwist2_end_0190,
            leftUpLeg_0118,
            leftLeg_0119,
            leftLegTwist1_0120,
            leftLegTwist1_end_0191,
            leftFoot_0121,
            leftToeBase_0122,
            leftFootBigToe1_0123,
            leftFootBigToe2_0124,
            leftFootBigToe3_0125,
            leftFootBigToe3_end_0192,
            leftFootIndex1_0126,
            leftFootIndex2_0127,
            leftFootIndex3_0128,
            leftFootIndex3_end_0193,
            leftToeBaseEnd_0129,
            leftToeBaseEnd_end_0194,
            leftUpLegTwist1_0130,
            leftUpLegTwist1_end_0195,
            leftUpLegTwist2_0131,
            leftUpLegTwist2_end_0176,
            skt_Hips_0132,
            skt_Hips_end_0196,
            ik_Hips_0133,
            ik_Hips_end_0197,
            ik_LeftFoot_0134,
            ik_LeftFoot_end_0198,
            ik_RightFoot_0135,
            ik_RightFoot_end_0199,
            ik_Head_0136,
            ik_Head_end_0200
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393701, 0, 0, -2.10309e-14, 0, 0.393701, -1.23589e-07, -193.625, 0, 1.23589e-07, 0.393701, 0.768954, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194054, 0.387315, -0.067906, -163.813, -0.00272997, -0.0678543, -0.3878, 26.4824, -0.393213, 0.0195854, -0.000658825, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, 0.365658, 0.144816, -87.9083, 0.00781599, 0.144606, -0.366099, -22.8358, -0.393213, 0.0195852, -0.000658853, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, 0.365658, 0.144815, -68.1571, 0.007816, 0.144606, -0.366099, -22.8359, -0.393213, 0.0195854, -0.00065879, -46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250579, 0.243036, -0.308716, -28.2432, 0.0209258, -0.30973, -0.242136, 23.8399, -0.392345, -0.000997496, -0.0326312, -45.6545, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326222, 0.00310541, -0.392335, 18.8604, 0.00125296, -0.393687, -0.00301194, 15.5573, -0.392345, -0.000999042, -0.032631, -45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696651, 0.00318602, -0.387475, 41.3986, 0.00125218, -0.393687, -0.00301197, 16.9021, -0.387486, -0.000699418, -0.0696729, -65.2641, 0, 0, 0, 1),
            Qt.matrix4x4(0.0686039, 0.0650144, -0.382187, 49.7479, 0.0121842, -0.388295, -0.0638664, 25.0309, -0.387486, -0.000698919, -0.069674, -65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00434356, 0.00718906, -0.393611, 19.4089, 0.00126082, -0.393633, -0.00717555, 21.4516, -0.393675, -0.00118136, -0.00436584, -30.9217, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186385, 0.121855, -0.373904, 29.8998, -0.00902871, -0.374358, -0.121553, 31.6623, -0.393156, 0.00282016, 0.0205173, -33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, 0.387315, -0.067906, -153.473, -0.00273003, -0.0678543, -0.3878, 26.4825, -0.393213, 0.0195854, -0.000658759, -46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-5.91801e-10, 0.393468, 0.0135351, -200.635, -3.81758e-08, 0.0135351, -0.393468, -4.90527, -0.393701, -1.9039e-09, 3.81329e-08, 7.77236e-07, 0, 0, 0, 1),
            Qt.matrix4x4(2.57571e-08, 0.390347, -0.0512782, -221.861, -2.67425e-08, -0.0512782, -0.390347, 31.9709, -0.393701, 2.90208e-08, 2.31599e-08, -1.66981e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-3.58487e-08, 0.388986, -0.0607465, -245.439, -4.14643e-08, -0.0607465, -0.388986, 37.9583, -0.393701, -2.90216e-08, 4.64991e-08, 1.80012e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.28895e-08, 0.386733, -0.0737436, -275.647, -8.70361e-08, -0.0737436, -0.386733, 47.2191, -0.393701, -2.58278e-08, 9.35293e-08, 1.87443e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, 0.010452, -0.0152312, -12.3193, 0.00957816, -0.39295, -0.022345, 285.685, -0.0157954, 0.0219498, -0.392771, -28.9278, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596668, 205.288, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729563, -0.371585, 55.0382, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, -0.269584, 0.146543, 98.5805, -0.306643, -0.209871, 0.130096, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246678, -0.269584, 0.146542, 38.7266, -0.306643, -0.209871, 0.130095, 204.187, -0.0109644, -0.195651, -0.341469, 102.427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, -0.269682, 0.095223, 12.997, -0.28587, -0.258957, 0.07887, 219.756, 0.00860766, -0.123344, -0.373781, 64.2652, 0, 0, 0, 1),
            Qt.matrix4x4(0.254654, -0.262181, 0.146331, 8.63408, -0.296463, -0.249947, 0.0680912, 221.494, 0.0475559, -0.154232, -0.359098, 42.2644, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735805, -0.359221, 0.143341, 83.9324, -0.380975, -0.0421679, 0.0898889, 186.843, -0.0666637, -0.155508, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506144, -0.361017, 0.156976, 96.0873, -0.387983, 0.0220099, 0.0631288, 172.467, -0.0666638, -0.155507, -0.355491, 89.8328, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430921, -0.355501, 0.163592, 106.46, -0.385616, 0.0666103, 0.0431747, 160.504, -0.0666638, -0.155507, -0.355491, 89.8327, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255003, -0.257623, 0.153636, 6.48442, -0.279203, -0.277565, -0.00201473, 227.811, 0.109634, -0.10765, -0.362481, 28.574, 0, 0, 0, 1),
            Qt.matrix4x4(0.13068, -0.347117, 0.132034, 55.5361, -0.366378, -0.143393, -0.0143569, 224.41, 0.0607472, -0.118105, -0.370623, 56.7679, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402106, -0.375286, 0.118932, 107.897, -0.388965, -0.0145656, -0.059112, 199.405, 0.0607471, -0.118105, -0.370623, 56.7678, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545026, -0.373999, 0.110247, 115.691, -0.385149, 0.0342969, -0.0740572, 185.293, 0.0607471, -0.118105, -0.370623, 56.7677, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219666, -0.154902, 0.36128, 26.7368, 0.091848, -0.349805, -0.155567, 126.813, 0.382207, 0.0929642, 0.0166203, -176.356, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134911, -0.206103, 0.335172, 37.8204, 0.0833917, -0.326252, -0.203975, 126.186, 0.384531, 0.077984, 0.0324758, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444807, -0.315588, 0.231141, 70.7153, 0.071817, -0.222088, -0.317048, 107.253, 0.384531, 0.077984, 0.0324763, -173.063, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, -0.326564, 0.124227, 71.0265, -0.346597, -0.185914, 0.017525, 213.163, 0.044126, -0.117441, -0.373177, 45.7714, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, -0.360419, 0.120599, 71.9804, -0.380027, -0.099069, 0.0276564, 213.135, 0.00502857, -0.123628, -0.373753, 66.947, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108465, -0.373598, 0.123722, 95.1038, -0.393519, -0.0118772, -0.00136596, 196.318, 0.00502869, -0.123628, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394787, -0.372058, 0.122535, 105.34, -0.391684, 0.0359134, -0.0171491, 184.379, 0.00502866, -0.123627, -0.373753, 66.9468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222188, -0.325012, -0.00059676, 193.3, -0.306643, -0.20987, 0.130096, 204.186, -0.107716, -0.0729558, -0.371585, 55.0379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, -0.325011, -0.000596791, 158.272, -0.306643, -0.209871, 0.130096, 204.187, -0.107716, -0.0729561, -0.371585, 55.0381, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-4.00634e-07, 0.257691, 0.29765, -207.307, -5.04721e-07, 0.29765, -0.257691, -229.86, -0.393701, -6.43814e-07, 2.74665e-08, 0.000502841, 0, 0, 0, 1),
            Qt.matrix4x4(8.2134e-08, 0.361953, 0.154889, -296.11, -3.14391e-07, 0.154889, -0.361953, -111.539, -0.393701, -4.81766e-08, 3.21352e-07, 1.77883e-05, 0, 0, 0, 1),
            Qt.matrix4x4(-4.52152e-08, 0.39368, 0.00406061, -325.901, -8.54108e-08, 0.00406061, -0.39368, 14.706, -0.393701, -4.60937e-08, 8.49399e-08, 2.61067e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.393267, -0.0104519, 0.0152318, 12.3192, 0.00957801, 0.39295, 0.0223447, -285.684, -0.0157959, -0.0219496, 0.392771, 28.9275, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596062, -205.288, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729569, 0.371584, -55.0388, 0, 0, 0, 1),
            Qt.matrix4x4(0.222189, 0.325011, 0.000596035, -193.299, -0.306643, 0.20987, -0.130096, -204.187, -0.107716, 0.0729568, 0.371585, -55.0386, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -98.5801, -0.306643, 0.209871, -0.130096, -204.187, -0.0109642, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(0.270564, 0.269681, -0.0952237, -12.9963, -0.28587, 0.258957, -0.078871, -219.756, 0.00860753, 0.123345, 0.373781, -64.266, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0219683, 0.154901, -0.361281, -26.735, 0.0918497, 0.349805, 0.155565, -126.812, 0.382206, -0.0929665, -0.0166191, 176.357, 0, 0, 0, 1),
            Qt.matrix4x4(0.0134919, 0.206102, -0.335172, -37.8192, 0.0833931, 0.326253, 0.203974, -126.186, 0.384531, -0.0779857, -0.0324757, 173.065, 0, 0, 0, 1),
            Qt.matrix4x4(0.0444822, 0.315587, -0.231142, -70.7141, 0.0718177, 0.222089, 0.317048, -107.253, 0.384531, -0.0779856, -0.0324758, 173.064, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.18145, 0.326564, -0.124228, -71.0255, -0.346597, 0.185914, -0.0175258, -213.164, 0.044126, 0.117442, 0.373177, -45.7721, 0, 0, 0, 1),
            Qt.matrix4x4(0.102734, 0.360418, -0.120601, -71.9796, -0.380027, 0.0990695, -0.0276568, -213.135, 0.0050288, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(0.0108476, 0.373598, -0.123724, -95.1032, -0.393519, 0.0118783, 0.00136568, -196.319, 0.00502881, 0.123629, 0.373753, -66.948, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0394777, 0.372057, -0.122537, -105.339, -0.391684, -0.0359122, 0.017149, -184.38, 0.0050287, 0.123629, 0.373753, -66.9479, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.255004, 0.257622, -0.153637, -6.48325, -0.279202, 0.277566, 0.00201373, -227.811, 0.109634, 0.107651, 0.362481, -28.5746, 0, 0, 0, 1),
            Qt.matrix4x4(0.130681, 0.347116, -0.132035, -55.5355, -0.366378, 0.143394, 0.0143561, -224.411, 0.0607472, 0.118107, 0.370623, -56.7689, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00402026, 0.375285, -0.118934, -107.896, -0.388965, 0.0145666, 0.0591119, -199.406, 0.0607474, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0545015, 0.373999, -0.110249, -115.69, -0.385149, -0.0342954, 0.0740571, -185.294, 0.0607471, 0.118107, 0.370623, -56.7686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.254655, 0.26218, -0.146332, -8.63357, -0.296462, 0.249948, -0.0680925, -221.494, 0.0475558, 0.154234, 0.359097, -42.2654, 0, 0, 0, 1),
            Qt.matrix4x4(0.0735814, 0.35922, -0.143343, -83.9317, -0.380975, 0.0421684, -0.0898891, -186.843, -0.0666633, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(0.00506219, 0.361016, -0.156978, -96.0868, -0.387983, -0.0220093, -0.0631286, -172.467, -0.0666633, 0.155509, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0430916, 0.3555, -0.163595, -106.46, -0.385616, -0.06661, -0.0431741, -160.504, -0.0666635, 0.15551, 0.35549, -89.8338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.246679, 0.269583, -0.146543, -38.7256, -0.306643, 0.20987, -0.130096, -204.187, -0.0109643, 0.195652, 0.341468, -102.428, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.22219, 0.325011, 0.000596767, -158.271, -0.306642, 0.209871, -0.130096, -204.187, -0.107716, 0.0729565, 0.371585, -55.0385, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.0679061, 163.813, -0.00273026, 0.0678544, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658538, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179703, -0.365658, -0.144816, 87.9082, 0.00781589, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195854, 0.000658678, 46.7245, 0, 0, 0, 1),
            Qt.matrix4x4(0.0179702, -0.365658, -0.144816, 68.1571, 0.00781608, -0.144606, 0.366099, 22.8359, -0.393213, -0.0195853, 0.000658909, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0250576, -0.243036, 0.308717, 28.2433, 0.0209257, 0.30973, 0.242135, -23.8399, -0.392345, 0.000997606, 0.0326308, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.0326224, -0.00310523, 0.392335, -18.8605, 0.00125134, 0.393687, 0.00301188, -15.5571, -0.392345, 0.000997432, 0.0326311, 45.6544, 0, 0, 0, 1),
            Qt.matrix4x4(0.00413564, -0.00302487, 0.393667, -21.1656, 0.00124899, 0.393687, 0.0030119, -21.4972, -0.393677, 0.00121724, 0.0041451, 30.9046, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0186383, -0.121855, 0.373904, -29.8999, -0.00902856, 0.374358, 0.121553, -31.6623, -0.393156, -0.00282011, -0.020517, 33.5802, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0696663, -0.00318584, 0.387475, -41.3988, 0.00125156, 0.393687, 0.0030119, -16.9019, -0.387486, 0.000698806, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(0.068604, -0.0650142, 0.382187, -49.7479, 0.0121837, 0.388295, 0.0638662, -25.0307, -0.387486, 0.000698457, 0.069674, 65.264, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0194053, -0.387315, 0.067906, 153.473, -0.00272996, 0.0678543, 0.3878, -26.4825, -0.393213, -0.0195854, 0.000658833, 46.7244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: sketchfab_model
        objectName: "Sketchfab_model"
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        Node {
            id: node13df1130cf8c405b8386e487df07d280_fbx
            objectName: "13df1130cf8c405b8386e487df07d280.fbx"
            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
            scale: Qt.vector3d(0.01, 0.01, 0.01)
            Node {
                id: object_2
                objectName: "Object_2"
                Node {
                    id: rootNode
                    objectName: "RootNode"
                    Node {
                        id: node0000_SK_Troll_Cave
                        objectName: "0000_SK_Troll_Cave"
                        rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: node0001_SK_Troll_Cave
                        objectName: "0001_SK_Troll_Cave"
                        rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: node0002_SK_Troll_Cave
                        objectName: "0002_SK_Troll_Cave"
                        rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: node0003_SK_Troll_Cave
                        objectName: "0003_SK_Troll_Cave"
                        rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: node0004_SK_Troll_Cave
                        objectName: "0004_SK_Troll_Cave"
                        rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                    }
                    Node {
                        id: troll_Cave
                        objectName: "Troll_Cave"
                        rotation: Qt.quaternion(1, -1.56958e-07, 0, 0)
                        scale: Qt.vector3d(2.54, 2.54, 2.54)
                        Node {
                            id: object_10
                            objectName: "Object_10"
                            Node {
                                id: _rootJoint
                                objectName: "_rootJoint"
                                Node {
                                    id: ik_Spine3_02
                                    objectName: "IK_Spine3_02"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_Spine3_end_0137
                                        objectName: "IK_Spine3_end_0137"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                                Node {
                                    id: ik_RightHand_03
                                    objectName: "IK_RightHand_03"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_RightHand_end_0138
                                        objectName: "IK_RightHand_end_0138"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                                Node {
                                    id: skt_FX_Reference2_04
                                    objectName: "SKT_FX_Reference2_04"
                                    rotation: Qt.quaternion(1, -3.27418e-11, 7.36737e-15, 2.75818e-20)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: skt_FX_Reference2_end_0139
                                        objectName: "SKT_FX_Reference2_end_0139"
                                        position: Qt.vector3d(7.52316e-37, 1, 0)
                                        rotation: Qt.quaternion(1, -2.64698e-23, 0, 3.00927e-36)
                                    }
                                }
                                Node {
                                    id: skt_FX_Reference1_05
                                    objectName: "SKT_FX_Reference1_05"
                                    rotation: Qt.quaternion(1, -3.27418e-11, 7.36737e-15, 2.75818e-20)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: skt_FX_Reference1_end_0140
                                        objectName: "SKT_FX_Reference1_end_0140"
                                        position: Qt.vector3d(7.52316e-37, 1, 0)
                                        rotation: Qt.quaternion(1, -2.64698e-23, 0, 3.00927e-36)
                                    }
                                }
                                Node {
                                    id: skt_Reference_06
                                    objectName: "SKT_Reference_06"
                                    rotation: Qt.quaternion(1, -3.27418e-11, 7.36737e-15, 2.75818e-20)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: skt_Reference_end_0141
                                        objectName: "SKT_Reference_end_0141"
                                        position: Qt.vector3d(7.52316e-37, 1, 0)
                                        rotation: Qt.quaternion(1, -2.64698e-23, 0, 3.00927e-36)
                                    }
                                }
                                Node {
                                    id: ik_LeftHand_07
                                    objectName: "IK_LeftHand_07"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_LeftHand_end_0142
                                        objectName: "IK_LeftHand_end_0142"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                                Node {
                                    id: skt_HeadCamera_08
                                    objectName: "SKT_HeadCamera_08"
                                    position: Qt.vector3d(-7.8341, 160, 17.1553)
                                    rotation: Qt.quaternion(0.999904, 3.7706e-08, 0.01384, 3.84344e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: skt_HeadCamera_end_0143
                                        objectName: "SKT_HeadCamera_end_0143"
                                        position: Qt.vector3d(1.77636e-15, 1, 3.55271e-15)
                                        rotation: Qt.quaternion(1, 1.32349e-23, -1.73472e-18, -1.28213e-23)
                                    }
                                }
                                Node {
                                    id: hips_09
                                    objectName: "Hips_09"
                                    position: Qt.vector3d(-0.146087, 191.823, -4.07952)
                                    rotation: Qt.quaternion(0.997907, -0.0646018, 0.000184467, 0.00284955)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: rightUpLeg_010
                                        objectName: "RightUpLeg_010"
                                        position: Qt.vector3d(-38.4087, -25.5809, -1.47825)
                                        rotation: Qt.quaternion(-0.459979, 0.639218, 0.496587, -0.364995)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: rightLeg_011
                                            objectName: "RightLeg_011"
                                            position: Qt.vector3d(-76.9334, 0.000302792, -0.00163865)
                                            rotation: Qt.quaternion(0.970628, 8.65474e-07, -4.06869e-05, -0.240586)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: rightLegTwist1_012
                                                objectName: "RightLegTwist1_012"
                                                position: Qt.vector3d(-19.751, 4.80413e-05, -3.18885e-05)
                                                rotation: Qt.quaternion(0.983185, 0.18261, -7.11622e-08, -1.48422e-07)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: rightLegTwist1_end_0144
                                                    objectName: "RightLegTwist1_end_0144"
                                                    position: Qt.vector3d(-1.42109e-14, 40.1759, 7.10543e-15)
                                                    rotation: Qt.quaternion(1, -4.33681e-19, -4.66207e-18, 5.55112e-17)
                                                }
                                            }
                                            Node {
                                                id: rightFoot_013
                                                objectName: "RightFoot_013"
                                                position: Qt.vector3d(-60.6007, -0.000302076, 4.22001e-05)
                                                rotation: Qt.quaternion(0.806153, 0.113716, -0.15386, 0.559923)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: rightToeBase_014
                                                    objectName: "RightToeBase_014"
                                                    position: Qt.vector3d(-33.6657, 2.74181e-05, -1.055e-05)
                                                    rotation: Qt.quaternion(0.942984, 6.43273e-07, 5.02546e-06, 0.332838)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: rightFootIndex1_015
                                                        objectName: "RightFootIndex1_015"
                                                        position: Qt.vector3d(-16.1655, -1.34478, 23.24)
                                                        rotation: Qt.quaternion(0.998874, -2.42024e-07, 0.0474477, -1.97133e-06)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: rightFootIndex2_016
                                                            objectName: "RightFootIndex2_016"
                                                            position: Qt.vector3d(-11.6645, -1.50204e-05, 8.46386e-06)
                                                            rotation: Qt.quaternion(0.996889, -4.54152e-07, 1.45617e-06, -0.0788173)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: rightFootIndex3_017
                                                                objectName: "RightFootIndex3_017"
                                                                position: Qt.vector3d(-24.6282, -1.4782e-05, -1.4782e-05)
                                                                rotation: Qt.quaternion(1, 1.52271e-07, -1.35473e-06, -1.17114e-07)
                                                                scale: Qt.vector3d(0.999999, 1, 1)
                                                                Node {
                                                                    id: rightFootIndex3_end_0145
                                                                    objectName: "RightFootIndex3_end_0145"
                                                                    position: Qt.vector3d(0, 24.6282, 1.42109e-14)
                                                                    rotation: Qt.quaternion(1, 6.93889e-18, 0, 0)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Node {
                                                        id: rightFootBigToe1_018
                                                        objectName: "RightFootBigToe1_018"
                                                        position: Qt.vector3d(-2.94443, -5.69083, -16.2249)
                                                        rotation: Qt.quaternion(0.99934, 0.000240782, -0.0359365, -0.00528259)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: rightFootBigToe2_019
                                                            objectName: "RightFootBigToe2_019"
                                                            position: Qt.vector3d(-20.4652, -0.46583, -0.0376954)
                                                            rotation: Qt.quaternion(0.988539, 0.0102423, -0.0303306, -0.147531)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: rightFootBigToe3_020
                                                                objectName: "RightFootBigToe3_020"
                                                                position: Qt.vector3d(-24.6282, -4.57764e-05, -6.16908e-05)
                                                                rotation: Qt.quaternion(1, 6.0827e-09, -1.12457e-07, -5.75128e-08)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: rightFootBigToe3_end_0146
                                                                    objectName: "RightFootBigToe3_end_0146"
                                                                    position: Qt.vector3d(7.10543e-15, 24.6282, 0)
                                                                    rotation: Qt.quaternion(1, -5.77779e-34, 2.08167e-17, 2.77556e-17)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Node {
                                                        id: rightToeBaseEnd_021
                                                        objectName: "RightToeBaseEnd_021"
                                                        position: Qt.vector3d(-34.8736, -1.8239e-05, -4.3571e-05)
                                                        rotation: Qt.quaternion(1, 3.1112e-08, -3.7727e-06, 3.84171e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: rightToeBaseEnd_end_0147
                                                            objectName: "RightToeBaseEnd_end_0147"
                                                            position: Qt.vector3d(0, 26.8864, 7.10543e-15)
                                                            rotation: Qt.quaternion(1, -9.32414e-18, 3.46945e-18, -1.73472e-18)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: rightUpLegTwist1_022
                                            objectName: "RightUpLegTwist1_022"
                                            position: Qt.vector3d(-10.3392, -5.32866e-05, -2.50041e-05)
                                            rotation: Qt.quaternion(0.987864, 0.155318, -1.14664e-07, 5.82377e-08)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: rightUpLegTwist1_end_0148
                                                objectName: "RightUpLegTwist1_end_0148"
                                                position: Qt.vector3d(2.84217e-14, 31.0908, 1.42109e-14)
                                                rotation: Qt.quaternion(1, 3.46945e-18, -1.21431e-17, 4.21297e-35)
                                            }
                                        }
                                        Node {
                                            id: rightUpLegTwist2_023
                                            objectName: "RightUpLegTwist2_023"
                                            position: Qt.vector3d(-6, -1.33514e-05, 3.8743e-07)
                                            rotation: Qt.quaternion(0.996899, 0.078688, -1.13975e-07, -6.53953e-09)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: rightUpLegTwist2_end_0149
                                                objectName: "RightUpLegTwist2_end_0149"
                                                position: Qt.vector3d(-2.84217e-14, 31.0908, -1.42109e-14)
                                                rotation: Qt.quaternion(1, 0, -6.76542e-17, 0)
                                            }
                                        }
                                    }
                                    Node {
                                        id: skt_FX_Hips_024
                                        objectName: "SKT_FX_Hips_024"
                                        position: Qt.vector3d(-8.00006e-07, 4.6813e-05, 17.4947)
                                        rotation: Qt.quaternion(1, -3.72009e-09, 1.88506e-09, -1.12777e-10)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: skt_FX_Hips_end_0150
                                            objectName: "SKT_FX_Hips_end_0150"
                                            position: Qt.vector3d(-1.11022e-16, 26.9827, 0)
                                            rotation: Qt.quaternion(1, -2.77556e-17, 5.42101e-20, 6.77626e-20)
                                        }
                                    }
                                    Node {
                                        id: spine_025
                                        objectName: "Spine_025"
                                        position: Qt.vector3d(-7.97329e-07, 7.05962, 2.76427)
                                        rotation: Qt.quaternion(0.548138, -0.455351, -0.540516, 0.447261)
                                        scale: Qt.vector3d(1, 0.999999, 1)
                                        Node {
                                            id: spine1_026
                                            objectName: "Spine1_026"
                                            position: Qt.vector3d(23.4642, 4.28676e-06, -2.06791e-06)
                                            rotation: Qt.quaternion(0.998665, -0.00183756, 0.00657565, 0.0512007)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: spine2_027
                                                objectName: "Spine2_027"
                                                position: Qt.vector3d(24.4285, -0.0133052, -4.30271e-06)
                                                rotation: Qt.quaternion(0.999315, 0.0108553, 0.0104824, -0.0337963)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: spine3_028
                                                    objectName: "Spine3_028"
                                                    position: Qt.vector3d(31.6345, -4.99189e-07, -6.76513e-06)
                                                    rotation: Qt.quaternion(0.999787, 0.00412005, 0.00530383, -0.0194928)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: skt_Back_029
                                                        objectName: "SKT_Back_029"
                                                        position: Qt.vector3d(9.55517, 50.1099, 3.57628e-07)
                                                        rotation: Qt.quaternion(0.992959, -1.28543e-06, -3.88067e-08, -0.118462)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: skt_Back_end_0151
                                                            objectName: "SKT_Back_end_0151"
                                                            position: Qt.vector3d(0, 29.1504, -3.55271e-15)
                                                            rotation: Qt.quaternion(1, -3.46945e-18, 1.73472e-18, -2.77556e-17)
                                                        }
                                                    }
                                                    Node {
                                                        id: skt_Chest_030
                                                        objectName: "SKT_Chest_030"
                                                        position: Qt.vector3d(-14.5209, -36.6974, -2.68221e-06)
                                                        rotation: Qt.quaternion(0.99091, -1.70938e-08, 3.60321e-07, 0.134527)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: skt_Chest_end_0152
                                                            objectName: "SKT_Chest_end_0152"
                                                            position: Qt.vector3d(-2.84217e-14, 29.1504, -1.77636e-15)
                                                            rotation: Qt.quaternion(1, -1.73472e-18, 4.33681e-19, -2.77556e-17)
                                                        }
                                                    }
                                                    Node {
                                                        id: leftShoulder_031
                                                        objectName: "LeftShoulder_031"
                                                        position: Qt.vector3d(8.80957, 6.33601, -4.19488)
                                                        rotation: Qt.quaternion(0.548331, -0.370238, 0.477725, 0.577958)
                                                        scale: Qt.vector3d(0.999999, 0.999999, 1)
                                                        Node {
                                                            id: leftArm_032
                                                            objectName: "LeftArm_032"
                                                            position: Qt.vector3d(54.1024, 6.91414e-06, 4.57764e-05)
                                                            rotation: Qt.quaternion(0.899582, 0.16051, 0.140818, 0.380998)
                                                            scale: Qt.vector3d(1, 1, 0.999999)
                                                            Node {
                                                                id: leftForeArm_033
                                                                objectName: "LeftForeArm_033"
                                                                position: Qt.vector3d(74.2141, -0.0033617, -0.00189781)
                                                                rotation: Qt.quaternion(0.903575, -4.19189e-05, 0.42843, -0.000121785)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: leftForeArmTwist3_034
                                                                    objectName: "LeftForeArmTwist3_034"
                                                                    position: Qt.vector3d(4.00003, 1.71661e-05, 3.43323e-05)
                                                                    rotation: Qt.quaternion(0.999673, 0.0255544, -4.09916e-08, 1.6024e-07)
                                                                    scale: Qt.vector3d(1, 0.999999, 1)
                                                                    Node {
                                                                        id: leftForeArmTwist3_end_0153
                                                                        objectName: "LeftForeArmTwist3_end_0153"
                                                                        position: Qt.vector3d(0, 37.558, 7.10543e-15)
                                                                        rotation: Qt.quaternion(1, -8.32667e-17, 1.15556e-33, -1.38778e-17)
                                                                    }
                                                                }
                                                                Node {
                                                                    id: leftForeArmTwist1_035
                                                                    objectName: "LeftForeArmTwist1_035"
                                                                    position: Qt.vector3d(59.854, -2.53618e-05, -2.26498e-06)
                                                                    rotation: Qt.quaternion(0.994764, 0.102201, 1.87245e-08, -1.7601e-07)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: leftForeArmTwist1_end_0154
                                                                        objectName: "LeftForeArmTwist1_end_0154"
                                                                        position: Qt.vector3d(-1.42109e-14, 37.558, 9.76996e-15)
                                                                        rotation: Qt.quaternion(1, 0, 0, -4.16334e-17)
                                                                    }
                                                                }
                                                                Node {
                                                                    id: leftHand_036
                                                                    objectName: "LeftHand_036"
                                                                    position: Qt.vector3d(78.3778, -3.62396e-05, 0.000191689)
                                                                    rotation: Qt.quaternion(0.993441, 0.103673, 0.0320792, 0.0360187)
                                                                    scale: Qt.vector3d(1, 0.999999, 1)
                                                                    Node {
                                                                        id: leftInHandPinky_037
                                                                        objectName: "LeftInHandPinky_037"
                                                                        position: Qt.vector3d(7.95257, -1.34659, 19.4513)
                                                                        rotation: Qt.quaternion(0.997611, 0.00776631, 0.065368, 0.0209513)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: leftHandPinky1_038
                                                                            objectName: "LeftHandPinky1_038"
                                                                            position: Qt.vector3d(40.2534, 3.21836, 5.10345)
                                                                            rotation: Qt.quaternion(0.952808, -0.190628, -0.185112, 0.146804)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: leftHandPinky2_039
                                                                                objectName: "LeftHandPinky2_039"
                                                                                position: Qt.vector3d(19.8527, 0.103698, -1.33514e-05)
                                                                                rotation: Qt.quaternion(0.971866, -0.0243601, -0.00409615, 0.234236)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: leftHandPinky3_040
                                                                                    objectName: "LeftHandPinky3_040"
                                                                                    position: Qt.vector3d(10.3533, -7.62939e-06, -1.33514e-05)
                                                                                    rotation: Qt.quaternion(0.989917, -0.0133096, -0.000207635, 0.14102)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: leftHandPinky4_041
                                                                                        objectName: "LeftHandPinky4_041"
                                                                                        position: Qt.vector3d(14.1395, 8.29697e-05, 0.000123978)
                                                                                        rotation: Qt.quaternion(1, -7.82311e-08, -4.13274e-07, 1.2794e-06)
                                                                                        scale: Qt.vector3d(1, 0.999999, 1)
                                                                                        Node {
                                                                                            id: leftHandPinky4_end_0156
                                                                                            objectName: "LeftHandPinky4_end_0156"
                                                                                            position: Qt.vector3d(0, 14.1394, -7.10543e-15)
                                                                                            rotation: Qt.quaternion(1, 2.77556e-17, -2.1684e-19, -4.27176e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: skt_LeftHand_042
                                                                        objectName: "SKT_LeftHand_042"
                                                                        position: Qt.vector3d(48.0552, 20.9808, 0.725241)
                                                                        rotation: Qt.quaternion(1, -7.45057e-09, -1.11759e-07, 2.19792e-07)
                                                                        scale: Qt.vector3d(1, 0.999999, 1)
                                                                        Node {
                                                                            id: skt_LeftHand_end_0157
                                                                            objectName: "SKT_LeftHand_end_0157"
                                                                            position: Qt.vector3d(-1.42109e-14, 27.0802, -5.32907e-15)
                                                                            rotation: Qt.quaternion(1, -2.77556e-17, -2.77556e-17, 2.77556e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: leftInHandIndex_043
                                                                        objectName: "LeftInHandIndex_043"
                                                                        position: Qt.vector3d(3.42829, 2.70115, -10.2451)
                                                                        rotation: Qt.quaternion(0.991369, 0.105164, 0.0774956, 0.0110833)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: leftHandIndex1_044
                                                                            objectName: "LeftHandIndex1_044"
                                                                            position: Qt.vector3d(44.2476, -5.3763, -0.826365)
                                                                            rotation: Qt.quaternion(0.960234, -0.13558, -0.0452576, 0.239833)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: leftHandIndex2_045
                                                                                objectName: "LeftHandIndex2_045"
                                                                                position: Qt.vector3d(23.2187, -2.38419e-05, 7.62939e-06)
                                                                                rotation: Qt.quaternion(0.973199, -0.00823309, -0.00243543, 0.229804)
                                                                                scale: Qt.vector3d(0.999999, 1, 1)
                                                                                Node {
                                                                                    id: leftHandIndex3_046
                                                                                    objectName: "LeftHandIndex3_046"
                                                                                    position: Qt.vector3d(17.2504, 0.657028, 1.90735e-06)
                                                                                    rotation: Qt.quaternion(0.989452, -0.0123708, -0.000570654, 0.144333)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: leftHandIndex4_047
                                                                                        objectName: "LeftHandIndex4_047"
                                                                                        position: Qt.vector3d(14.6783, 9.15527e-05, 6.67572e-05)
                                                                                        rotation: Qt.quaternion(1, -1.78814e-07, 1.86264e-08, 1.34856e-06)
                                                                                        scale: Qt.vector3d(1, 0.999998, 1)
                                                                                        Node {
                                                                                            id: leftHandIndex4_end_0158
                                                                                            objectName: "LeftHandIndex4_end_0158"
                                                                                            position: Qt.vector3d(-2.84217e-14, 14.6782, -7.10543e-15)
                                                                                            rotation: Qt.quaternion(1, -2.77556e-17, -2.77556e-17, 6.93889e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: skt_FX_LeftHand_00
                                                                        objectName: "SKT_FX_LeftHand_00"
                                                                        position: Qt.vector3d(48.0552, 20.9808, 0.725241)
                                                                        rotation: Qt.quaternion(1, -7.45057e-09, -1.11759e-07, 2.19792e-07)
                                                                        scale: Qt.vector3d(1, 0.999999, 1)
                                                                        Node {
                                                                            id: skt_FX_LeftHand_end_0159
                                                                            objectName: "SKT_FX_LeftHand_end_0159"
                                                                            position: Qt.vector3d(-1.42109e-14, 27.0802, -5.32907e-15)
                                                                            rotation: Qt.quaternion(1, -2.77556e-17, -2.77556e-17, 2.77556e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: leftHandThumb1_01
                                                                        objectName: "LeftHandThumb1_01"
                                                                        position: Qt.vector3d(4.37423, 16.1999, -15.6615)
                                                                        rotation: Qt.quaternion(0.657684, 0.669757, 0.3426, 0.0387514)
                                                                        scale: Qt.vector3d(1, 0.999996, 1)
                                                                        Node {
                                                                            id: leftHandThumb2_048
                                                                            objectName: "LeftHandThumb2_048"
                                                                            position: Qt.vector3d(15.731, -2.28882e-05, 5.53131e-05)
                                                                            rotation: Qt.quaternion(0.990941, -0.00242831, -0.1224, -0.0552153)
                                                                            scale: Qt.vector3d(0.999999, 1, 1)
                                                                            Node {
                                                                                id: leftHandThumb3_049
                                                                                objectName: "LeftHandThumb3_049"
                                                                                position: Qt.vector3d(13.715, 4.48227e-05, 9.53674e-06)
                                                                                rotation: Qt.quaternion(0.980644, 1.88421e-06, 4.78651e-07, 0.195799)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: leftHandThumb4_050
                                                                                    objectName: "LeftHandThumb4_050"
                                                                                    position: Qt.vector3d(25.5491, 0.000177383, -4.76837e-05)
                                                                                    rotation: Qt.quaternion(1, -1.41561e-07, 7.18979e-07, 2.00048e-06)
                                                                                    scale: Qt.vector3d(1, 0.999995, 1)
                                                                                    Node {
                                                                                        id: leftHandThumb4_end_0160
                                                                                        objectName: "LeftHandThumb4_end_0160"
                                                                                        position: Qt.vector3d(1.42109e-14, 25.549, 0)
                                                                                        rotation: Qt.quaternion(1, -7.70372e-34, -2.77556e-17, -2.77556e-17)
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: leftInHandMiddle_051
                                                                        objectName: "LeftInHandMiddle_051"
                                                                        position: Qt.vector3d(0.0588126, -0.650571, 2.36471)
                                                                        rotation: Qt.quaternion(0.989419, 0.0408058, 0.02065, 0.137687)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: leftHandMiddle1_052
                                                                            objectName: "LeftHandMiddle1_052"
                                                                            position: Qt.vector3d(48.5841, -15.8558, -0.447475)
                                                                            rotation: Qt.quaternion(0.984973, -0.0526149, 0.0095787, 0.164223)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: leftHandMiddle2_053
                                                                                objectName: "LeftHandMiddle2_053"
                                                                                position: Qt.vector3d(25.5143, -2.59876e-05, 1.43051e-06)
                                                                                rotation: Qt.quaternion(0.983231, -0.0102553, -0.00260955, 0.182058)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: leftHandMiddle3_054
                                                                                    objectName: "LeftHandMiddle3_054"
                                                                                    position: Qt.vector3d(14.1636, 1.52588e-05, 3.8147e-06)
                                                                                    rotation: Qt.quaternion(0.984836, -0.0177775, -0.00119709, 0.172571)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: leftHandMiddle4_055
                                                                                        objectName: "LeftHandMiddle4_055"
                                                                                        position: Qt.vector3d(17.3612, 6.67572e-05, 9.15527e-05)
                                                                                        rotation: Qt.quaternion(1, -2.49595e-07, -1.04308e-07, 9.38773e-07)
                                                                                        scale: Qt.vector3d(1, 0.999999, 1)
                                                                                        Node {
                                                                                            id: leftHandMiddle4_end_0161
                                                                                            objectName: "LeftHandMiddle4_end_0161"
                                                                                            position: Qt.vector3d(0, 17.3611, -7.10543e-15)
                                                                                            rotation: Qt.quaternion(1, -5.55112e-17, 2.77556e-17, -4.16334e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: leftForeArmTwist2_056
                                                                    objectName: "LeftForeArmTwist2_056"
                                                                    position: Qt.vector3d(8, 1.52588e-05, 3.43323e-05)
                                                                    rotation: Qt.quaternion(0.998691, 0.0511404, -5.78176e-08, 1.60397e-07)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: leftForeArmTwist2_end_0162
                                                                        objectName: "LeftForeArmTwist2_end_0162"
                                                                        position: Qt.vector3d(2.84217e-14, 37.558, 3.55271e-15)
                                                                        rotation: Qt.quaternion(1, 2.77556e-17, -2.77556e-17, -1.38778e-17)
                                                                    }
                                                                }
                                                            }
                                                            Node {
                                                                id: leftArmTwist1_057
                                                                objectName: "LeftArmTwist1_057"
                                                                position: Qt.vector3d(11.9884, -1.09673e-05, 3.8147e-06)
                                                                rotation: Qt.quaternion(0.9909, -0.134604, -2.34969e-08, -9.11093e-08)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: leftArmTwist1_end_0163
                                                                    objectName: "LeftArmTwist1_end_0163"
                                                                    position: Qt.vector3d(0, 44.4063, -7.10543e-15)
                                                                    rotation: Qt.quaternion(1, 2.08167e-17, -1.14653e-33, -5.50775e-17)
                                                                }
                                                            }
                                                            Node {
                                                                id: leftArmTwist2_058
                                                                objectName: "LeftArmTwist2_058"
                                                                position: Qt.vector3d(47.0162, -2.19345e-05, 4.76837e-06)
                                                                rotation: Qt.quaternion(0.997756, -0.0669563, 7.00062e-10, -1.55881e-07)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: leftArmTwist2_end_0164
                                                                    objectName: "LeftArmTwist2_end_0164"
                                                                    position: Qt.vector3d(-2.84217e-14, 44.4063, 0)
                                                                    rotation: Qt.quaternion(1, -6.93889e-18, 2.77556e-17, -2.94903e-17)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Node {
                                                        id: neck_059
                                                        objectName: "Neck_059"
                                                        position: Qt.vector3d(27.1708, -16.9141, 2.93255e-05)
                                                        rotation: Qt.quaternion(0.851346, -0.0130809, -0.0131936, -0.524275)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: neck1_060
                                                            objectName: "Neck1_060"
                                                            position: Qt.vector3d(10.1473, 1.62423e-06, 2.71201e-06)
                                                            rotation: Qt.quaternion(0.973772, 0.00778913, -0.00369763, 0.227363)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: head_061
                                                                objectName: "Head_061"
                                                                position: Qt.vector3d(10.463, 3.8214e-05, -1.98185e-06)
                                                                rotation: Qt.quaternion(0.971298, 0.0196967, -0.0154764, 0.236544)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: skt_Head_062
                                                                    objectName: "SKT_Head_062"
                                                                    position: Qt.vector3d(34.4419, 5.32717e-06, 2.80142e-06)
                                                                    rotation: Qt.quaternion(1, 1.04774e-09, 2.96859e-09, -1.05065e-08)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: skt_Head_end_0165
                                                                        objectName: "SKT_Head_end_0165"
                                                                        position: Qt.vector3d(0, 22.5461, 3.55271e-15)
                                                                        rotation: Qt.quaternion(1, 1.73472e-18, -8.67362e-19, 1.50463e-36)
                                                                    }
                                                                }
                                                                Node {
                                                                    id: headEnd_063
                                                                    objectName: "HeadEnd_063"
                                                                    position: Qt.vector3d(34.4419, -6.09457e-06, 4.76837e-06)
                                                                    rotation: Qt.quaternion(1, 1.04774e-09, 2.96859e-09, -1.05065e-08)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: headEnd_end_0166
                                                                        objectName: "HeadEnd_end_0166"
                                                                        position: Qt.vector3d(0, 22.5461, 1.77636e-15)
                                                                        rotation: Qt.quaternion(1, 1.73472e-18, -8.67362e-19, 1.50463e-36)
                                                                    }
                                                                }
                                                                Node {
                                                                    id: face_064
                                                                    objectName: "face_064"
                                                                    position: Qt.vector3d(-9.16421e-07, 8.26269e-06, 3.8743e-07)
                                                                    rotation: Qt.quaternion(1, -1.16706e-07, -6.44942e-08, 1.57524e-09)
                                                                    scale: Qt.vector3d(1, 1, 0.999998)
                                                                    Node {
                                                                        id: jaw_065
                                                                        objectName: "jaw_065"
                                                                        position: Qt.vector3d(-1.19582e-06, 1.74344e-06, 1.90735e-06)
                                                                        rotation: Qt.quaternion(1, -1.00117e-08, 8.42265e-08, -7.989e-09)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: jaw_end_0167
                                                                            objectName: "jaw_end_0167"
                                                                            position: Qt.vector3d(0, 12.0087, 0)
                                                                            rotation: Qt.quaternion(1, -8.67362e-19, -4.33681e-19, -1.38778e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: eye_left_066
                                                                        objectName: "eye_left_066"
                                                                        position: Qt.vector3d(-3.52412e-06, 1.32769e-05, 7.00355e-06)
                                                                        rotation: Qt.quaternion(1, -9.77889e-09, 8.42847e-08, 2.92675e-08)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: eye_left_end_0168
                                                                            objectName: "eye_left_end_0168"
                                                                            position: Qt.vector3d(0, 12.0087, 0)
                                                                            rotation: Qt.quaternion(1, -3.46945e-18, -4.33681e-19, 1.38778e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: nose_067
                                                                        objectName: "nose_067"
                                                                        position: Qt.vector3d(-3.08827e-06, 9.39518e-06, 3.21865e-06)
                                                                        rotation: Qt.quaternion(1, -4.8487e-08, 8.42265e-08, -1.15142e-08)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: nose_end_0169
                                                                            objectName: "nose_end_0169"
                                                                            position: Qt.vector3d(5.68434e-14, 12.0088, 0)
                                                                            rotation: Qt.quaternion(1, -6.01853e-36, -2.1684e-19, -2.77556e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: lip_corners_068
                                                                        objectName: "lip_corners_068"
                                                                        position: Qt.vector3d(-3.12552e-06, 9.34303e-06, -1.19209e-07)
                                                                        rotation: Qt.quaternion(1, -6.25732e-08, 8.41683e-08, -1.14378e-08)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: lip_upper_069
                                                                            objectName: "lip_upper_069"
                                                                            position: Qt.vector3d(-4.31389e-06, 2.23517e-06, -8.34465e-07)
                                                                            rotation: Qt.quaternion(1, -6.22822e-08, 5.82076e-11, -3.25599e-09)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: lip_upper_end_0170
                                                                                objectName: "lip_upper_end_0170"
                                                                                position: Qt.vector3d(5.68434e-14, 0.172943, -1.77636e-15)
                                                                                rotation: Qt.quaternion(1, -8.67362e-19, -1.95156e-18, -1.38778e-17)
                                                                            }
                                                                        }
                                                                        Node {
                                                                            id: lip_lower_070
                                                                            objectName: "lip_lower_070"
                                                                            position: Qt.vector3d(-3.36021e-06, -1.57952e-06, -7.7486e-07)
                                                                            rotation: Qt.quaternion(1, -6.22822e-08, 5.82076e-11, -3.25599e-09)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: lip_lower_end_0171
                                                                                objectName: "lip_lower_end_0171"
                                                                                position: Qt.vector3d(0, 0.172943, -1.77636e-15)
                                                                                rotation: Qt.quaternion(1, -8.67362e-19, -1.95156e-18, -1.38778e-17)
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: eye_lid_right_071
                                                                        objectName: "eye_lid_right_071"
                                                                        position: Qt.vector3d(-3.3088e-05, -2.74181e-06, -3.72529e-05)
                                                                        rotation: Qt.quaternion(1, 4.32599e-07, 8.42265e-08, -6.61021e-09)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: eye_lid_in_right_072
                                                                            objectName: "eye_lid_in_right_072"
                                                                            position: Qt.vector3d(2.72393e-05, -2.6077e-06, 5.06639e-07)
                                                                            rotation: Qt.quaternion(1, -5.5728e-07, -4.65661e-10, -3.0989e-07)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: eye_lid_in_right_end_0172
                                                                                objectName: "eye_lid_in_right_end_0172"
                                                                                position: Qt.vector3d(0, 0.194794, 0)
                                                                                rotation: Qt.quaternion(1, 8.67362e-19, 2.1684e-19, -1.88079e-37)
                                                                            }
                                                                        }
                                                                        Node {
                                                                            id: eye_lid_out_right_073
                                                                            objectName: "eye_lid_out_right_073"
                                                                            position: Qt.vector3d(2.72468e-05, -2.5928e-06, 9.83477e-07)
                                                                            rotation: Qt.quaternion(1, -5.5728e-07, -4.65661e-10, -3.0989e-07)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: eye_lid_out_right_end_0173
                                                                                objectName: "eye_lid_out_right_end_0173"
                                                                                position: Qt.vector3d(0, 0.194794, 0)
                                                                                rotation: Qt.quaternion(1, 8.67362e-19, 2.1684e-19, -1.88079e-37)
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: mouth_bag_074
                                                                        objectName: "mouth_bag_074"
                                                                        position: Qt.vector3d(6.26966e-06, -3.28496e-05, -1.28746e-05)
                                                                        rotation: Qt.quaternion(1, -1.7831e-05, 8.40518e-08, -6.74117e-09)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: tongue_jaw_075
                                                                            objectName: "tongue_jaw_075"
                                                                            position: Qt.vector3d(6.04987e-06, -2.26796e-05, 1.75834e-06)
                                                                            rotation: Qt.quaternion(1, 1.78316e-05, 2.91038e-10, -4.88217e-09)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: tongue_01_076
                                                                                objectName: "tongue_01_076"
                                                                                position: Qt.vector3d(-5.61066e-05, -5.64009e-06, 2.74181e-05)
                                                                                rotation: Qt.quaternion(1, -1.95985e-07, -5.82077e-10, 8.54925e-09)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: tongue_02_077
                                                                                    objectName: "tongue_02_077"
                                                                                    position: Qt.vector3d(6.38664e-05, 7.32392e-06, -1.809e-05)
                                                                                    rotation: Qt.quaternion(1, 1.49303e-07, 6.17001e-09, -8.22183e-10)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: tongue_03_078
                                                                                        objectName: "tongue_03_078"
                                                                                        position: Qt.vector3d(-5.81145e-07, 1.33887e-05, -1.33514e-05)
                                                                                        rotation: Qt.quaternion(1, -1.11002e-07, -1.74623e-10, 6.65749e-10)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: tongue_04_079
                                                                                            objectName: "tongue_04_079"
                                                                                            position: Qt.vector3d(-2.5332e-07, -1.64211e-05, -1.46925e-05)
                                                                                            rotation: Qt.quaternion(1, 1.94937e-07, -5.41825e-17, -9.5315e-10)
                                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                                            Node {
                                                                                                id: tongue_05_080
                                                                                                objectName: "tongue_05_080"
                                                                                                position: Qt.vector3d(2.73027e-05, 1.98931e-05, -1.15037e-05)
                                                                                                rotation: Qt.quaternion(1, 1.59547e-07, 1.74623e-10, 2.98678e-09)
                                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                                Node {
                                                                                                    id: tongue_06_081
                                                                                                    objectName: "tongue_06_081"
                                                                                                    position: Qt.vector3d(5.78277e-05, -8.18074e-06, 8.34465e-07)
                                                                                                    rotation: Qt.quaternion(1, 1.02038e-07, -3.49246e-10, -4.13638e-09)
                                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                                    Node {
                                                                                                        id: tongue_06_end_0174
                                                                                                        objectName: "tongue_06_end_0174"
                                                                                                        position: Qt.vector3d(0, 4.29999, 1.77636e-15)
                                                                                                        rotation: Qt.quaternion(1, 1.73472e-18, 0, 0)
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        Node {
                                                                            id: teeth_lwr_082
                                                                            objectName: "teeth_lwr_082"
                                                                            position: Qt.vector3d(6.04987e-06, -2.26796e-05, 1.75834e-06)
                                                                            rotation: Qt.quaternion(1, -2.85782e-06, -2.71948e-17, -7.07223e-09)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: teeth_lwr_end_0175
                                                                                objectName: "teeth_lwr_end_0175"
                                                                                position: Qt.vector3d(0, 0.010012, -1.77636e-15)
                                                                                rotation: Qt.quaternion(1, -2.60209e-18, 3.61112e-35, -1.38778e-17)
                                                                            }
                                                                        }
                                                                        Node {
                                                                            id: teeth_upr_083
                                                                            objectName: "teeth_upr_083"
                                                                            position: Qt.vector3d(6.04987e-06, -2.26796e-05, 1.75834e-06)
                                                                            rotation: Qt.quaternion(1, -2.85782e-06, -2.71948e-17, -7.07223e-09)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: teeth_upr_end_0155
                                                                                objectName: "teeth_upr_end_0155"
                                                                                position: Qt.vector3d(0, 0.010012, -1.77636e-15)
                                                                                rotation: Qt.quaternion(1, -2.60209e-18, 3.61112e-35, -1.38778e-17)
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: eye_right_084
                                                                        objectName: "eye_right_084"
                                                                        position: Qt.vector3d(-2.13459e-06, 5.58048e-06, 3.27826e-06)
                                                                        rotation: Qt.quaternion(1, -9.77889e-09, 8.42847e-08, 2.92675e-08)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: eye_right_end_0177
                                                                            objectName: "eye_right_end_0177"
                                                                            position: Qt.vector3d(5.68434e-14, 12.0087, 0)
                                                                            rotation: Qt.quaternion(1, -3.46945e-18, -4.33681e-19, 1.38778e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: eye_lid_left_085
                                                                        objectName: "eye_lid_left_085"
                                                                        position: Qt.vector3d(2.12304e-05, 3.91528e-05, -4.24385e-05)
                                                                        rotation: Qt.quaternion(1, 6.78119e-07, 8.44011e-08, -4.62023e-10)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: eye_lid_out_left_086
                                                                            objectName: "eye_lid_out_left_086"
                                                                            position: Qt.vector3d(-9.9875e-06, 2.89083e-06, 2.98023e-07)
                                                                            rotation: Qt.quaternion(1, -8.03673e-07, 5.82076e-11, -2.97419e-07)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: eye_lid_out_left_end_0178
                                                                                objectName: "eye_lid_out_left_end_0178"
                                                                                position: Qt.vector3d(0, 0.200256, -1.77636e-15)
                                                                                rotation: Qt.quaternion(1, -1.73472e-18, 4.33681e-19, -1.38778e-17)
                                                                            }
                                                                        }
                                                                        Node {
                                                                            id: eye_lid_in_left_087
                                                                            objectName: "eye_lid_in_left_087"
                                                                            position: Qt.vector3d(-3.38368e-05, -3.52636e-05, 7.45058e-07)
                                                                            rotation: Qt.quaternion(1, -8.03324e-07, 1.74623e-10, -3.12331e-07)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: eye_lid_in_left_end_0179
                                                                                objectName: "eye_lid_in_left_end_0179"
                                                                                position: Qt.vector3d(0, 0.200256, 0)
                                                                                rotation: Qt.quaternion(1, -8.67362e-19, 1.51788e-18, -2.77556e-17)
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Node {
                                                        id: rightShoulder_088
                                                        objectName: "RightShoulder_088"
                                                        position: Qt.vector3d(8.80907, 6.33609, 4.19489)
                                                        rotation: Qt.quaternion(0.571944, 0.485226, 0.349221, -0.561677)
                                                        scale: Qt.vector3d(0.999999, 1, 1)
                                                        Node {
                                                            id: rightArm_089
                                                            objectName: "RightArm_089"
                                                            position: Qt.vector3d(-54.1024, 0.000571251, -1.90735e-06)
                                                            rotation: Qt.quaternion(0.897183, 0.0950398, 0.0289392, 0.430339)
                                                            scale: Qt.vector3d(0.999999, 1, 1)
                                                            Node {
                                                                id: rightArmTwist1_090
                                                                objectName: "RightArmTwist1_090"
                                                                position: Qt.vector3d(-11.9886, -5.84126e-05, -9.53674e-05)
                                                                rotation: Qt.quaternion(0.993317, -0.115421, 3.00028e-08, -4.03163e-08)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: rightArmTwist1_end_0180
                                                                    objectName: "RightArmTwist1_end_0180"
                                                                    position: Qt.vector3d(0, 44.4064, 0)
                                                                    rotation: Qt.quaternion(1, -1.82963e-33, 2.77556e-17, 6.59195e-17)
                                                                }
                                                            }
                                                            Node {
                                                                id: rightForeArm_091
                                                                objectName: "RightForeArm_091"
                                                                position: Qt.vector3d(-74.2141, 0.00269604, 0.00110149)
                                                                rotation: Qt.quaternion(0.907168, -4.03177e-05, 0.42077, -0.000114753)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: rightHand_092
                                                                    objectName: "RightHand_092"
                                                                    position: Qt.vector3d(-78.3783, -9.11355e-05, -0.000352859)
                                                                    rotation: Qt.quaternion(0.988294, 0.135801, 0.0694019, 0.00413281)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: skt_FX_RightHand_093
                                                                        objectName: "SKT_FX_RightHand_093"
                                                                        position: Qt.vector3d(-48.0548, -20.9804, -0.725122)
                                                                        rotation: Qt.quaternion(1, 4.84288e-08, -1.82539e-07, -7.45057e-09)
                                                                        scale: Qt.vector3d(0.999999, 1, 1)
                                                                        Node {
                                                                            id: skt_FX_RightHand_end_0181
                                                                            objectName: "SKT_FX_RightHand_end_0181"
                                                                            position: Qt.vector3d(0, 27.08, 0)
                                                                            rotation: Qt.quaternion(1, 1.38778e-17, -1.92593e-34, -1.38778e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: rightHandThumb1_094
                                                                        objectName: "RightHandThumb1_094"
                                                                        position: Qt.vector3d(-4.37429, -16.1997, 15.6615)
                                                                        rotation: Qt.quaternion(0.76947, 0.572425, 0.283218, -0.00579627)
                                                                        scale: Qt.vector3d(1, 1, 0.999999)
                                                                        Node {
                                                                            id: rightHandThumb2_095
                                                                            objectName: "RightHandThumb2_095"
                                                                            position: Qt.vector3d(-15.7309, 0.000255108, -0.000283718)
                                                                            rotation: Qt.quaternion(0.996978, 0.0114928, -0.0766282, 0.00556232)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: rightHandThumb3_096
                                                                                objectName: "RightHandThumb3_096"
                                                                                position: Qt.vector3d(-13.7151, -0.000161171, 4.76837e-05)
                                                                                rotation: Qt.quaternion(0.980657, -4.56612e-06, -3.51385e-08, 0.195733)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: rightHandThumb4_097
                                                                                    objectName: "RightHandThumb4_097"
                                                                                    position: Qt.vector3d(-25.5489, -1.90735e-06, 0.000673294)
                                                                                    rotation: Qt.quaternion(1, 2.27243e-07, -2.04891e-07, 3.05474e-07)
                                                                                    scale: Qt.vector3d(0.999999, 1, 1)
                                                                                    Node {
                                                                                        id: rightHandThumb4_end_0182
                                                                                        objectName: "RightHandThumb4_end_0182"
                                                                                        position: Qt.vector3d(0, 25.549, 0)
                                                                                        rotation: Qt.quaternion(1, 0, -1.38778e-17, 0)
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: rightInHandMiddle_098
                                                                        objectName: "RightInHandMiddle_098"
                                                                        position: Qt.vector3d(-0.0589705, 0.651088, -2.36468)
                                                                        rotation: Qt.quaternion(0.989419, 0.0408058, 0.02065, 0.137687)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: rightHandMiddle1_099
                                                                            objectName: "RightHandMiddle1_099"
                                                                            position: Qt.vector3d(-48.5839, 15.8557, 0.447601)
                                                                            rotation: Qt.quaternion(0.984908, -0.0494946, -0.00616115, 0.165734)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: rightHandMiddle2_0100
                                                                                objectName: "RightHandMiddle2_0100"
                                                                                position: Qt.vector3d(-25.514, 0.000217438, 6.29425e-05)
                                                                                rotation: Qt.quaternion(0.973803, -0.0174041, -0.00442864, 0.226685)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: rightHandMiddle3_0101
                                                                                    objectName: "RightHandMiddle3_0101"
                                                                                    position: Qt.vector3d(-14.1642, -0.000244141, -0.00012207)
                                                                                    rotation: Qt.quaternion(0.98425, -0.0183229, -0.00123834, 0.175828)
                                                                                    Node {
                                                                                        id: rightHandMiddle4_0102
                                                                                        objectName: "RightHandMiddle4_0102"
                                                                                        position: Qt.vector3d(-17.3608, -0.000196457, -5.53131e-05)
                                                                                        rotation: Qt.quaternion(1, -1.93715e-07, -3.72529e-08, 5.58794e-09)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: rightHandMiddle4_end_0183
                                                                                            objectName: "RightHandMiddle4_end_0183"
                                                                                            position: Qt.vector3d(2.84217e-14, 17.361, 1.06581e-14)
                                                                                            rotation: Qt.quaternion(1, -5.55112e-17, -1.92593e-33, 3.46945e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: skt_RightHand_0103
                                                                        objectName: "SKT_RightHand_0103"
                                                                        position: Qt.vector3d(-48.0548, -20.9804, -0.725122)
                                                                        rotation: Qt.quaternion(1, 4.84288e-08, -1.82539e-07, -7.45057e-09)
                                                                        scale: Qt.vector3d(0.999999, 1, 1)
                                                                        Node {
                                                                            id: skt_RightHand_end_0184
                                                                            objectName: "SKT_RightHand_end_0184"
                                                                            position: Qt.vector3d(0, 27.08, 0)
                                                                            rotation: Qt.quaternion(1, 1.38778e-17, -1.92593e-34, -1.38778e-17)
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: rightInHandIndex_0104
                                                                        objectName: "RightInHandIndex_0104"
                                                                        position: Qt.vector3d(-3.42829, -2.70078, 10.2452)
                                                                        rotation: Qt.quaternion(0.991369, 0.105164, 0.0774955, 0.0110831)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: rightHandIndex1_0105
                                                                            objectName: "RightHandIndex1_0105"
                                                                            position: Qt.vector3d(-44.2472, 5.37651, 0.826593)
                                                                            rotation: Qt.quaternion(0.972629, -0.127623, -0.0643982, 0.18319)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: rightHandIndex2_0106
                                                                                objectName: "RightHandIndex2_0106"
                                                                                position: Qt.vector3d(-23.2193, -0.000164032, -0.000233591)
                                                                                rotation: Qt.quaternion(0.971922, -0.00911624, -0.00268128, 0.235113)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: rightHandIndex3_0107
                                                                                    objectName: "RightHandIndex3_0107"
                                                                                    position: Qt.vector3d(-17.2505, -0.656797, -0.000136495)
                                                                                    rotation: Qt.quaternion(0.991719, -0.00981456, -0.000460643, 0.12805)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: rightHandIndex4_0108
                                                                                        objectName: "RightHandIndex4_0108"
                                                                                        position: Qt.vector3d(-14.6778, -0.000133514, 6.84261e-05)
                                                                                        rotation: Qt.quaternion(1, -2.12341e-07, -1.33761e-07, -3.21307e-08)
                                                                                        scale: Qt.vector3d(0.999999, 1, 1)
                                                                                        Node {
                                                                                            id: rightHandIndex4_end_0185
                                                                                            objectName: "RightHandIndex4_end_0185"
                                                                                            position: Qt.vector3d(0, 14.6779, -7.10543e-15)
                                                                                            rotation: Qt.quaternion(1, -2.77556e-17, -2.1684e-17, -8.23994e-18)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    Node {
                                                                        id: rightInHandPinky_0109
                                                                        objectName: "RightInHandPinky_0109"
                                                                        position: Qt.vector3d(-7.95182, 1.34687, -19.451)
                                                                        rotation: Qt.quaternion(0.997611, 0.00776666, 0.065368, 0.020951)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: rightHandPinky1_0110
                                                                            objectName: "RightHandPinky1_0110"
                                                                            position: Qt.vector3d(-40.2537, -3.21837, -5.10351)
                                                                            rotation: Qt.quaternion(0.927859, -0.21736, -0.157405, 0.258951)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: rightHandPinky2_0111
                                                                                objectName: "RightHandPinky2_0111"
                                                                                position: Qt.vector3d(-19.8526, -0.103683, 3.91006e-05)
                                                                                rotation: Qt.quaternion(0.963217, -0.0298988, -0.00502368, 0.26701)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: rightHandPinky3_0112
                                                                                    objectName: "RightHandPinky3_0112"
                                                                                    position: Qt.vector3d(-10.3535, -0.000121355, -9.63211e-05)
                                                                                    rotation: Qt.quaternion(0.982343, -0.020891, -0.000331787, 0.185917)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: rightHandPinky4_0113
                                                                                        objectName: "RightHandPinky4_0113"
                                                                                        position: Qt.vector3d(-14.1392, 0.000559807, -4.76837e-06)
                                                                                        rotation: Qt.quaternion(1, 1.77572e-17, -6.42613e-08, -3.47849e-07)
                                                                                        scale: Qt.vector3d(0.999999, 1, 1)
                                                                                        Node {
                                                                                            id: rightHandPinky4_end_0186
                                                                                            objectName: "RightHandPinky4_end_0186"
                                                                                            position: Qt.vector3d(0, 14.1394, -3.55271e-15)
                                                                                            rotation: Qt.quaternion(1, -6.92131e-35, 6.93889e-18, 9.97466e-18)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: rightForeArmTwist3_0114
                                                                    objectName: "RightForeArmTwist3_0114"
                                                                    position: Qt.vector3d(-3.99994, 4.74453e-05, 1.71661e-05)
                                                                    rotation: Qt.quaternion(0.999411, 0.034327, -2.34832e-07, -2.79562e-08)
                                                                    scale: Qt.vector3d(0.999999, 1, 1)
                                                                    Node {
                                                                        id: rightForeArmTwist3_end_0187
                                                                        objectName: "RightForeArmTwist3_end_0187"
                                                                        position: Qt.vector3d(0, 37.5583, -7.10543e-15)
                                                                        rotation: Qt.quaternion(1, -2.08167e-17, -8.66668e-34, 4.16334e-17)
                                                                    }
                                                                }
                                                                Node {
                                                                    id: rightForeArmTwist2_0115
                                                                    objectName: "RightForeArmTwist2_0115"
                                                                    position: Qt.vector3d(-7.99996, 5.38826e-05, 3.24249e-05)
                                                                    rotation: Qt.quaternion(0.997672, 0.068188, -2.42709e-07, 7.84136e-08)
                                                                    scale: Qt.vector3d(0.999999, 1, 1)
                                                                    Node {
                                                                        id: rightForeArmTwist2_end_0188
                                                                        objectName: "RightForeArmTwist2_end_0188"
                                                                        position: Qt.vector3d(0, 37.5583, -3.55271e-15)
                                                                        rotation: Qt.quaternion(1, 0, 0, 6.93889e-18)
                                                                    }
                                                                }
                                                                Node {
                                                                    id: rightForeArmTwist1_0116
                                                                    objectName: "RightForeArmTwist1_0116"
                                                                    position: Qt.vector3d(-59.8548, 0.000224113, -0.000213623)
                                                                    rotation: Qt.quaternion(0.990639, 0.136504, -6.76888e-08, -4.13654e-08)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: rightForeArmTwist1_end_0189
                                                                        objectName: "RightForeArmTwist1_end_0189"
                                                                        position: Qt.vector3d(-2.84217e-14, 37.5583, -7.10543e-15)
                                                                        rotation: Qt.quaternion(1, 2.77556e-17, 5.55112e-17, -2.77556e-17)
                                                                    }
                                                                }
                                                            }
                                                            Node {
                                                                id: rightArmTwist2_0117
                                                                objectName: "RightArmTwist2_0117"
                                                                position: Qt.vector3d(-47.0162, 9.44138e-05, -9.72748e-05)
                                                                rotation: Qt.quaternion(0.998323, -0.0578869, 1.30604e-08, -1.52294e-07)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: rightArmTwist2_end_0190
                                                                    objectName: "RightArmTwist2_end_0190"
                                                                    position: Qt.vector3d(0, 44.4064, 0)
                                                                    rotation: Qt.quaternion(1, 6.93889e-18, -2.77556e-17, 1.73472e-17)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Node {
                                        id: leftUpLeg_0118
                                        objectName: "LeftUpLeg_0118"
                                        position: Qt.vector3d(38.4086, -25.5808, -1.47826)
                                        rotation: Qt.quaternion(0.584421, 0.480977, -0.421178, -0.499722)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: leftLeg_0119
                                            objectName: "LeftLeg_0119"
                                            position: Qt.vector3d(76.9334, -0.000976563, 0.000211596)
                                            rotation: Qt.quaternion(0.969347, 5.90395e-07, -9.72062e-06, -0.245694)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: leftLegTwist1_0120
                                                objectName: "LeftLegTwist1_0120"
                                                position: Qt.vector3d(19.7511, 1.10865e-05, -2.17557e-06)
                                                rotation: Qt.quaternion(0.997489, 0.0708275, -1.72262e-07, 7.25927e-08)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: leftLegTwist1_end_0191
                                                    objectName: "LeftLegTwist1_end_0191"
                                                    position: Qt.vector3d(2.84217e-14, 40.1759, 0)
                                                    rotation: Qt.quaternion(1, -2.08167e-17, -1.73472e-18, -3.61112e-35)
                                                }
                                            }
                                            Node {
                                                id: leftFoot_0121
                                                objectName: "LeftFoot_0121"
                                                position: Qt.vector3d(60.6007, 0.000427246, -3.09944e-06)
                                                rotation: Qt.quaternion(0.810298, 0.0257918, -0.0854155, 0.579186)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: leftToeBase_0122
                                                    objectName: "LeftToeBase_0122"
                                                    position: Qt.vector3d(33.6656, -7.15256e-06, 1.72853e-06)
                                                    rotation: Qt.quaternion(0.951211, -2.67733e-05, -6.57787e-06, 0.308541)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: leftFootBigToe1_0123
                                                        objectName: "LeftFootBigToe1_0123"
                                                        position: Qt.vector3d(4.48676, 5.94016, 16.3632)
                                                        rotation: Qt.quaternion(0.999344, -8.91774e-07, -0.0362178, -1.14452e-06)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: leftFootBigToe2_0124
                                                            objectName: "LeftFootBigToe2_0124"
                                                            position: Qt.vector3d(18.9206, -1.90735e-06, 1.80602e-05)
                                                            rotation: Qt.quaternion(0.987754, 0.0100896, -0.0300992, -0.152759)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: leftFootBigToe3_0125
                                                                objectName: "LeftFootBigToe3_0125"
                                                                position: Qt.vector3d(24.6282, 1.91927e-05, 3.38256e-06)
                                                                rotation: Qt.quaternion(1, -9.08039e-09, 1.75787e-08, 1.40382e-07)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: leftFootBigToe3_end_0192
                                                                    objectName: "LeftFootBigToe3_end_0192"
                                                                    position: Qt.vector3d(-7.10543e-15, 24.6282, 0)
                                                                    rotation: Qt.quaternion(1, 8.67362e-19, -1.73472e-18, -2.77556e-17)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Node {
                                                        id: leftFootIndex1_0126
                                                        objectName: "LeftFootIndex1_0126"
                                                        position: Qt.vector3d(16.1655, 1.34479, -23.2399)
                                                        rotation: Qt.quaternion(0.998874, 6.08956e-07, 0.0474491, -3.89406e-06)
                                                        Node {
                                                            id: leftFootIndex2_0127
                                                            objectName: "LeftFootIndex2_0127"
                                                            position: Qt.vector3d(11.6646, -9.53674e-07, 1.54078e-05)
                                                            rotation: Qt.quaternion(0.996889, 4.38854e-07, -1.4428e-07, -0.0788144)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: leftFootIndex3_0128
                                                                objectName: "LeftFootIndex3_0128"
                                                                position: Qt.vector3d(24.6282, 5.24521e-06, 1.40816e-05)
                                                                rotation: Qt.quaternion(1, -5.12227e-09, 6.0536e-09, 1.07102e-08)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: leftFootIndex3_end_0193
                                                                    objectName: "LeftFootIndex3_end_0193"
                                                                    position: Qt.vector3d(0, 24.6282, 0)
                                                                    rotation: Qt.quaternion(1, -3.46945e-18, -2.77556e-17, 1.38778e-17)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Node {
                                                        id: leftToeBaseEnd_0129
                                                        objectName: "LeftToeBaseEnd_0129"
                                                        position: Qt.vector3d(34.8736, 1.00136e-05, 1.49012e-06)
                                                        rotation: Qt.quaternion(1, 2.85217e-09, 4.09491e-08, 6.51926e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: leftToeBaseEnd_end_0194
                                                            objectName: "LeftToeBaseEnd_end_0194"
                                                            position: Qt.vector3d(7.10543e-15, 27.0639, 7.10543e-15)
                                                            rotation: Qt.quaternion(1, -1.51788e-18, 6.93889e-18, 3.46945e-18)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: leftUpLegTwist1_0130
                                            objectName: "LeftUpLegTwist1_0130"
                                            position: Qt.vector3d(10.3394, 6.79493e-06, 1.2964e-05)
                                            rotation: Qt.quaternion(0.995883, 0.0906468, 5.26619e-08, 5.79661e-08)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: leftUpLegTwist1_end_0195
                                                objectName: "LeftUpLegTwist1_end_0195"
                                                position: Qt.vector3d(0, 31.091, 0)
                                                rotation: Qt.quaternion(1, 3.46945e-18, 1.0842e-17, -3.76158e-35)
                                            }
                                        }
                                        Node {
                                            id: leftUpLegTwist2_0131
                                            objectName: "LeftUpLegTwist2_0131"
                                            position: Qt.vector3d(5.99997, 8.70228e-06, 3.8743e-06)
                                            rotation: Qt.quaternion(0.998953, 0.0457553, 4.66149e-10, 1.30522e-08)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: leftUpLegTwist2_end_0176
                                                objectName: "LeftUpLegTwist2_end_0176"
                                                position: Qt.vector3d(0, 31.091, 7.10543e-15)
                                                rotation: Qt.quaternion(1, 0, 7.80626e-18, 0)
                                            }
                                        }
                                    }
                                    Node {
                                        id: skt_Hips_0132
                                        objectName: "SKT_Hips_0132"
                                        position: Qt.vector3d(-8.00006e-07, 4.6813e-05, 17.4947)
                                        rotation: Qt.quaternion(1, -3.72009e-09, 1.88506e-09, -1.12777e-10)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: skt_Hips_end_0196
                                            objectName: "SKT_Hips_end_0196"
                                            position: Qt.vector3d(-1.11022e-16, 26.9827, 0)
                                            rotation: Qt.quaternion(1, -2.77556e-17, 5.42101e-20, 6.77626e-20)
                                        }
                                    }
                                }
                                Node {
                                    id: ik_Hips_0133
                                    objectName: "IK_Hips_0133"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_Hips_end_0197
                                        objectName: "IK_Hips_end_0197"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                                Node {
                                    id: ik_LeftFoot_0134
                                    objectName: "IK_LeftFoot_0134"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_LeftFoot_end_0198
                                        objectName: "IK_LeftFoot_end_0198"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                                Node {
                                    id: ik_RightFoot_0135
                                    objectName: "IK_RightFoot_0135"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_RightFoot_end_0199
                                        objectName: "IK_RightFoot_end_0199"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                                Node {
                                    id: ik_Head_0136
                                    objectName: "IK_Head_0136"
                                    position: Qt.vector3d(-8.05956, -5.82081e-11, 8.15259)
                                    rotation: Qt.quaternion(0.999904, 3.77058e-08, 0.01384, 3.84342e-08)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: ik_Head_end_0200
                                        objectName: "IK_Head_end_0200"
                                        position: Qt.vector3d(0, 1, 1.77636e-15)
                                        rotation: Qt.quaternion(1, 2.64698e-23, -1.73472e-18, 5.37667e-24)
                                    }
                                }
                            }
                            Model {
                                id: object_13
                                objectName: "Object_13"
                                source: "meshes/node0000_SK_Troll_Cave_MI_Troll_Body_Mountain01_Upper_0_mesh.mesh"
                                skin: skin
                                materials: [
                                    mi_Troll_Body_Mountain01_Upper_material
                                ]
                            }
                            Model {
                                id: object_15
                                objectName: "Object_15"
                                source: "meshes/node0001_SK_Troll_Cave_MI_Troll_Body_Mountain01_Lower_0_mesh.mesh"
                                skin: skin225
                                materials: [
                                    mi_Troll_Body_Mountain01_Lower_material
                                ]
                            }
                            Model {
                                id: object_17
                                objectName: "Object_17"
                                source: "meshes/node0002_SK_Troll_Cave_MI_Troll_Heads_Eye_Master_0_mesh.mesh"
                                skin: skin230
                                materials: [
                                    mi_Troll_Heads_Eye_Master_material
                                ]
                            }
                            Model {
                                id: object_19
                                objectName: "Object_19"
                                source: "meshes/node0003_SK_Troll_Cave_MI_Troll_Heads_Cave_0_mesh.mesh"
                                skin: skin236
                                materials: [
                                    mi_Troll_Heads_Cave_material
                                ]
                            }
                            Model {
                                id: object_21
                                objectName: "Object_21"
                                source: "meshes/node0004_SK_Troll_Cave_MI_Troll_Heads_Teeth_0_mesh.mesh"
                                skin: skin241
                                materials: [
                                    mi_Troll_Heads_Teeth_material
                                ]
                            }
                            Node {
                                id: object_12
                                objectName: "Object_12"
                                rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: object_14
                                objectName: "Object_14"
                                rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: object_16
                                objectName: "Object_16"
                                rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: object_18
                                objectName: "Object_18"
                                rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                            Node {
                                id: object_20
                                objectName: "Object_20"
                                rotation: Qt.quaternion(1, 2.18557e-08, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: troll_Cave_Frames_timeline
        objectName: "Troll_Cave|Frames"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 61500
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 61500
            from: 0
            to: 61500
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_0.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_Reference_06
            property: "rotation"
            keyframeSource: "animations/skt_Reference_06_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_0.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            keyframeSource: "animations/ik_Spine3_02_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_0.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            keyframeSource: "animations/ik_LeftHand_07_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_0.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            keyframeSource: "animations/ik_RightHand_03_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_0.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            keyframeSource: "animations/skt_HeadCamera_08_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference2_04
            property: "position"
            keyframeSource: "animations/skt_FX_Reference2_04_position_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference2_04
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference2_04_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_0.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_0.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_0.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference1_05
            property: "position"
            keyframeSource: "animations/skt_FX_Reference1_05_position_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference1_05
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference1_05_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_0.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_0.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_0.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "position"
            keyframeSource: "animations/rightFootIndex1_015_position_0.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_0.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_0.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_0.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_0.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_0.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_0.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_0.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_0.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_0.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_0.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_0.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_0.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_0.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_0.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_0.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_0.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_0.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_0.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_0.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_0.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "position"
            keyframeSource: "animations/leftHandPinky1_038_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            keyframeSource: "animations/skt_LeftHand_042_position_0.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            keyframeSource: "animations/leftHandIndex1_044_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "position"
            keyframeSource: "animations/leftInHandIndex_043_position_0.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            keyframeSource: "animations/skt_FX_LeftHand_00_position_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "position"
            keyframeSource: "animations/leftHandThumb1_01_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_0.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_0.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_0.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_0.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_0.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "position"
            keyframeSource: "animations/leftShoulder_031_position_0.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_0.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_0.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_0.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_0.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_0.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_0.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_0.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_0.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_0.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_0.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_0.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_0.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_0.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_0.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_0.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_0.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_0.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_0.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_0.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_0.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_0.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_0.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_0.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            keyframeSource: "animations/rightHandThumb4_097_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            keyframeSource: "animations/rightHandThumb3_096_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            keyframeSource: "animations/rightHandThumb2_095_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle4_0102_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle3_0101_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle2_0100_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_0.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_0.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            keyframeSource: "animations/rightHandIndex3_0107_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            keyframeSource: "animations/rightHandIndex2_0106_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            keyframeSource: "animations/rightHandIndex1_0105_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "position"
            keyframeSource: "animations/rightInHandIndex_0104_position_0.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            keyframeSource: "animations/rightInHandIndex_0104_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            keyframeSource: "animations/rightInHandPinky_0109_position_0.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            keyframeSource: "animations/rightInHandPinky_0109_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_0.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_0.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_0.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_0.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_0.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_0.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_0.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "position"
            keyframeSource: "animations/rightShoulder_088_position_0.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_0.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_0.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_0.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_0.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_0.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_0.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_0.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_0.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_0.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            keyframeSource: "animations/leftFootIndex1_0126_position_0.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_0.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_0.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_0.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_0.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_0.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_0.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_0.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_0.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_0.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_0.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_0.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            keyframeSource: "animations/ik_Hips_0133_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_0.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            keyframeSource: "animations/ik_LeftFoot_0134_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_0.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            keyframeSource: "animations/ik_RightFoot_0135_rotation_0.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_0.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            keyframeSource: "animations/ik_Head_0136_rotation_0.qad"
        }
    }
    Timeline {
        id: frames000_timeline
        objectName: "Frames000"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2067
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 2067
            from: 0
            to: 2067
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_1.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_1.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_1.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_1.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_1.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_1.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_1.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_1.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_1.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_1.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_1.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_1.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_1.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_1.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_1.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_1.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_1.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_1.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_1.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_1.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_1.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_1.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_1.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_1.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_1.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_1.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_1.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_1.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_1.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_1.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_1.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_1.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_1.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_1.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.72522)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            keyframeSource: "animations/leftHandIndex1_044_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.72522)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_1.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_1.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_1.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_1.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_1.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_1.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_1.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(8.80947, 6.336, -4.1949)
            }
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_1.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_1.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_1.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_1.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_1.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_1.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_1.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_1.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_1.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_1.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_1.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_1.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_1.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_1.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_1.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_1.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_1.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_1.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_1.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_1.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_1.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_1.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_1.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_1.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9804, -0.725115)
            }
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            keyframeSource: "animations/rightHandThumb4_097_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            keyframeSource: "animations/rightHandThumb3_096_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            keyframeSource: "animations/rightHandThumb2_095_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle4_0102_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle3_0101_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle2_0100_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_1.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9804, -0.725115)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            keyframeSource: "animations/rightHandIndex3_0107_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            keyframeSource: "animations/rightHandIndex2_0106_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            keyframeSource: "animations/rightHandIndex1_0105_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            keyframeSource: "animations/rightInHandIndex_0104_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-7.95188, 1.34685, -19.4511)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            keyframeSource: "animations/rightInHandPinky_0109_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_1.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_1.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_1.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_1.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_1.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_1.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_1.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_1.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_1.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_1.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_1.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_1.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_1.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_1.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_1.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_1.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(16.1655, 1.34472, -23.2399)
            }
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_1.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_1.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_1.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_1.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_1.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_1.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_1.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_1.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_1.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_1.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_1.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_1.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_1.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_1.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
    }
    Timeline {
        id: frames_001_timeline
        objectName: "Frames.001"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 9134
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 9134
            from: 0
            to: 9134
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_2.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_2.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_2.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_2.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 160, 9)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_2.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_2.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_2.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_2.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_2.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_2.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_2.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_2.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.988539, 0.0102476, -0.0303298, -0.147531)
            }
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_2.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_2.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_2.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_2.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_2.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_2.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_2.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_2.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_2.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_2.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_2.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_2.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_2.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_2.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-14.521, -36.6974, -8.58307e-06)
            }
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_2.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_2.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_2.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.725221)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.725221)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_2.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_2.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_2.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_2.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_2.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_2.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_2.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_2.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_2.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_2.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_2.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_2.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_2.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_2.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_2.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_2.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_2.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_2.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_2.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_2.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_2.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_2.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_2.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_2.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_2.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_2.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_2.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_2.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_2.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_2.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_2.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9803, -0.725095)
            }
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999301, 0.021254, -0.00852285, 0.0295585)
            }
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.880624, -0.168962, 0.0711456, 0.43691)
            }
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969428, 0.224883, 0.0779006, 0.0597308)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.529089, 0.708822, 0.46608, -0.0201288)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle4_0102_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.940086, 0.0498864, 0.022563, 0.336512)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430645, 0.0332209, 0.241369)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_2.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.997624, 0.038861, 0.0290057, 0.0489293)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9803, -0.725095)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327185, 0.117394, 0.420376)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.931262, -0.0566451, 0.0786067, 0.351231)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.939389, -0.0955969, -0.0163223, 0.32885)
            }
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113845, -0.112522)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_2.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            keyframeSource: "animations/rightInHandPinky_0109_position_2.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107135, 0.102254, -0.0541716)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_2.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_2.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_2.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_2.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_2.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_2.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_2.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_2.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_2.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_2.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_2.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_2.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_2.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_2.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_2.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_2.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(16.1655, 1.34473, -23.2399)
            }
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_2.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_2.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_2.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_2.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_2.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_2.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_2.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_2.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_2.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_2.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_2.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
    }
    Timeline {
        id: frames_002_timeline
        objectName: "Frames.002"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2300
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 2300
            from: 0
            to: 2300
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_3.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_3.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_3.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_3.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_3.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_3.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_3.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_3.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_3.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_3.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_3.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_3.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_3.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_3.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_3.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_3.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_3.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_3.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_3.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_3.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_3.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_3.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_3.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_3.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_3.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_3.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_3.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_3.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_3.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_3.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_3.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_3.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_3.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9807, 0.725223)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            keyframeSource: "animations/leftHandIndex1_044_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9807, 0.725223)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_3.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.584, -15.8558, -0.447483)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_3.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_3.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_3.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_3.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_3.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_3.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_3.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_3.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_3.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_3.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_3.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_3.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_3.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_3.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_3.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_3.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_3.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_3.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_3.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_3.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_3.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_3.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_3.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_3.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_3.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_3.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_3.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_3.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_3.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_3.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9804, -0.725111)
            }
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            keyframeSource: "animations/rightHandThumb4_097_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            keyframeSource: "animations/rightHandThumb3_096_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            keyframeSource: "animations/rightHandThumb2_095_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973604, -0.0497169, -0.0333387, 0.220256)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle3_0101_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle2_0100_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_3.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9804, -0.725111)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            keyframeSource: "animations/rightHandIndex3_0107_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            keyframeSource: "animations/rightHandIndex2_0106_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113845, -0.112522)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_3.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-7.95185, 1.34689, -19.4511)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107135, 0.102255, -0.0541716)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_3.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_3.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_3.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_3.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_3.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_3.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_3.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_3.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_3.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_3.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_3.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_3.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_3.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_3.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_3.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_3.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            keyframeSource: "animations/leftFootIndex1_0126_position_3.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_3.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_3.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_3.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_3.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_3.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_3.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_3.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_3.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_3.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_3.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_3.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_3.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_3.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_3.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_3.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
    }
    Timeline {
        id: frames_003_timeline
        objectName: "Frames.003"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3034
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 3034
            from: 0
            to: 3034
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_4.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_4.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_4.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_4.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_4.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_4.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_4.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_4.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_4.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_4.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_4.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_4.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_4.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_4.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_4.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_4.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_4.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_4.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_4.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_4.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_4.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_4.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_4.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_4.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_4.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_4.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_4.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_4.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_4.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_4.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_4.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_4.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_4.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_4.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9807, 0.725232)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "position"
            keyframeSource: "animations/leftInHandIndex_043_position_4.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9807, 0.725232)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_4.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_4.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_4.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_4.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_4.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_4.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_4.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_4.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_4.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_4.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_4.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_4.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_4.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_4.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_4.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_4.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_4.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_4.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_4.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_4.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_4.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_4.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_4.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_4.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_4.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_4.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_4.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_4.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_4.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_4.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_4.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9803, -0.725115)
            }
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999301, 0.0212541, -0.00852276, 0.0295584)
            }
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.880625, -0.168961, 0.0711458, 0.43691)
            }
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969428, 0.224882, 0.0779005, 0.0597309)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.529089, 0.708823, 0.466079, -0.0201291)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973604, -0.0497167, -0.033339, 0.220253)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.940086, 0.0498863, 0.0225632, 0.336512)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430646, 0.0332208, 0.241368)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_4.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-48.0548, -20.9803, -0.725115)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327185, 0.117394, 0.420376)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.931262, -0.0566451, 0.0786065, 0.351231)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-44.2472, 5.37654, 0.826616)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.93939, -0.0955967, -0.0163223, 0.32885)
            }
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "position"
            keyframeSource: "animations/rightInHandIndex_0104_position_4.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_4.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.941364, 0.00502075, -0.0563829, 0.332612)
            }
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-40.2537, -3.21834, -5.10352)
            }
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            keyframeSource: "animations/rightInHandPinky_0109_position_4.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107136, 0.102255, -0.0541685)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_4.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_4.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_4.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_4.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_4.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_4.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_4.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_4.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_4.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_4.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_4.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_4.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_4.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_4.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_4.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(4.48676, 5.94025, 16.3631)
            }
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_4.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_4.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            keyframeSource: "animations/leftFootIndex1_0126_position_4.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_4.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_4.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_4.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_4.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_4.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_4.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_4.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_4.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_4.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_4.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_4.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_4.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_4.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_4.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_4.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_4.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
    }
    Timeline {
        id: frames_004_timeline
        objectName: "Frames.004"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1200
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 1200
            from: 0
            to: 1200
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_5.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_5.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_5.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_5.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_5.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_5.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_5.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_5.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 8.96831e-44, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_5.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_5.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_5.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_5.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_5.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_5.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_5.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_5.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "position"
            keyframeSource: "animations/rightFootBigToe1_018_position_5.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_5.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_5.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_5.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_5.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_5.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_5.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_5.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_5.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_5.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_5.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_5.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_5.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_5.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_5.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_5.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_5.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_5.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "position"
            keyframeSource: "animations/leftHandPinky1_038_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_5.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            keyframeSource: "animations/leftHandIndex1_044_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "position"
            keyframeSource: "animations/leftInHandIndex_043_position_5.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_5.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_5.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_5.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_5.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_5.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_5.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_5.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(8.80947, 6.33601, -4.19489)
            }
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_5.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_5.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_5.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_5.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_5.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_5.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_5.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_5.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_5.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_5.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_5.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_5.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_5.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_5.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_5.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_5.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_5.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_5.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_5.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_5.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_5.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_5.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_5.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_5.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_5.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999301, 0.0212543, -0.00852261, 0.0295586)
            }
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.880625, -0.168961, 0.071146, 0.43691)
            }
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969429, 0.224882, 0.0779004, 0.0597307)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.529089, 0.708823, 0.466079, -0.0201294)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973604, -0.0497165, -0.0333389, 0.220253)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle3_0101_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430645, 0.0332209, 0.241368)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_5.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.997624, 0.0388622, 0.0290058, 0.04893)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_5.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.944937, 0.0293401, -0.033153, 0.324243)
            }
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327185, 0.117394, 0.420376)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.931262, -0.0566455, 0.0786066, 0.351231)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            keyframeSource: "animations/rightHandIndex1_0105_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.93939, -0.0955965, -0.0163222, 0.32885)
            }
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "position"
            keyframeSource: "animations/rightInHandIndex_0104_position_5.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353524, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.951109, 0.00298444, -0.0479821, 0.305092)
            }
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "position"
            keyframeSource: "animations/rightHandPinky1_0110_position_5.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.936626, -0.163248, 0.00375108, 0.309947)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            keyframeSource: "animations/rightInHandPinky_0109_position_5.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107136, 0.102255, -0.0541685)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_5.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_5.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_5.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_5.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_5.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_5.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_5.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_5.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_5.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_5.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_5.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_5.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_5.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_5.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_5.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_5.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_5.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            keyframeSource: "animations/leftFootIndex1_0126_position_5.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_5.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_5.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_5.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_5.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_5.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_5.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_5.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "position"
            keyframeSource: "animations/leftUpLeg_0118_position_5.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_5.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_5.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_5.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_5.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_5.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_5.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_5.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_5.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_5.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 1.57772e-30)
            }
        }
    }
    Timeline {
        id: frames_005_timeline
        objectName: "Frames.005"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 4867
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 4867
            from: 0
            to: 4867
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_6.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_Reference_06
            property: "rotation"
            keyframeSource: "animations/skt_Reference_06_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_6.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            keyframeSource: "animations/ik_Spine3_02_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_6.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            keyframeSource: "animations/ik_LeftHand_07_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_6.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            keyframeSource: "animations/ik_RightHand_03_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_6.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            keyframeSource: "animations/skt_HeadCamera_08_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference2_04
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference2_04_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_6.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_6.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_6.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference1_05
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference1_05_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_6.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_6.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_6.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_6.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_6.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_6.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_6.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_6.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_6.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_6.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_6.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_6.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_6.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_6.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_6.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_6.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_6.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_6.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_6.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "position"
            keyframeSource: "animations/rightUpLeg_010_position_6.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_6.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_6.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_6.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_6.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "position"
            keyframeSource: "animations/leftHandPinky1_038_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_6.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9807, 0.725212)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(44.2476, -5.37628, -0.826429)
            }
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9807, 0.725212)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_6.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_6.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_6.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_6.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_6.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "position"
            keyframeSource: "animations/leftShoulder_031_position_6.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_6.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_6.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_6.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_6.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_6.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_6.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_6.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_6.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_6.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_6.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_6.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_6.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_6.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_6.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_6.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_6.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_6.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_6.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_6.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_6.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_6.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_6.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_6.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_6.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_6.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999301, 0.0212542, -0.00852287, 0.0295585)
            }
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.880625, -0.168961, 0.0711456, 0.43691)
            }
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969429, 0.224882, 0.0779006, 0.059731)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.529089, 0.708823, 0.466079, -0.0201289)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle4_0102_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.940086, 0.0498861, 0.0225631, 0.336513)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430646, 0.0332209, 0.241368)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_6.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_6.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.944937, 0.0293401, -0.0331531, 0.324243)
            }
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327184, 0.117394, 0.420376)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            keyframeSource: "animations/rightHandIndex2_0106_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-44.2472, 5.37655, 0.826607)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "position"
            keyframeSource: "animations/rightHandPinky1_0110_position_6.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-7.95186, 1.34685, -19.4511)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107136, 0.102255, -0.0541685)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_6.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_6.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_6.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_6.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_6.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_6.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_6.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_6.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_6.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_6.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_6.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_6.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_6.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_6.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_6.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_6.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_6.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_6.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_6.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(4.48676, 5.94022, 16.3631)
            }
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_6.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_6.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            keyframeSource: "animations/leftFootIndex1_0126_position_6.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_6.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_6.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_6.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_6.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_6.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_6.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_6.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "position"
            keyframeSource: "animations/leftUpLeg_0118_position_6.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_6.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_6.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_6.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_6.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_6.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            keyframeSource: "animations/ik_Hips_0133_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_6.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            keyframeSource: "animations/ik_LeftFoot_0134_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_6.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            keyframeSource: "animations/ik_RightFoot_0135_rotation_6.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_6.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            keyframeSource: "animations/ik_Head_0136_rotation_6.qad"
        }
    }
    Timeline {
        id: frames_006_timeline
        objectName: "Frames.006"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3734
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 3734
            from: 0
            to: 3734
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_7.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_Reference_06
            property: "rotation"
            keyframeSource: "animations/skt_Reference_06_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_7.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            keyframeSource: "animations/ik_Spine3_02_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_7.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            keyframeSource: "animations/ik_LeftHand_07_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_7.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            keyframeSource: "animations/ik_RightHand_03_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_7.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            keyframeSource: "animations/skt_HeadCamera_08_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference2_04
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference2_04_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_7.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_7.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_7.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference1_05
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference1_05_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_7.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_7.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_7.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_7.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_7.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_7.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_7.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_7.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_7.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_7.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_7.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_7.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_7.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_7.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_7.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_7.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_7.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_7.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_7.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_7.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_7.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_7.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_7.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.725223)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(3.42824, 2.70116, -10.2451)
            }
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.725223)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_7.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_7.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_7.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_7.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_7.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(8.80947, 6.33601, -4.1949)
            }
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_7.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_7.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_7.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_7.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_7.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_7.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_7.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_7.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_7.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_7.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_7.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_7.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_7.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_7.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_7.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_7.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_7.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_7.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_7.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_7.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_7.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_7.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_7.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_7.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_7.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            keyframeSource: "animations/rightHandThumb4_097_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            keyframeSource: "animations/rightHandThumb3_096_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969428, 0.224883, 0.0779004, 0.0597308)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle4_0102_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.940086, 0.0498864, 0.0225631, 0.336512)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle2_0100_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_7.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_7.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327185, 0.117394, 0.420375)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            keyframeSource: "animations/rightHandIndex2_0106_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-44.2472, 5.37654, 0.82662)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_7.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-40.2537, -3.21832, -5.10351)
            }
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-7.95185, 1.34686, -19.4511)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107136, 0.102255, -0.0541684)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_7.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_7.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_7.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_7.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_7.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_7.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_7.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_7.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_7.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_7.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_7.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_7.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_7.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_7.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_7.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_7.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_7.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_7.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_7.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_7.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_7.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(16.1654, 1.34477, -23.2399)
            }
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_7.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_7.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_7.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_7.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_7.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_7.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_7.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_7.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_7.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_7.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_7.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_7.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            keyframeSource: "animations/ik_Hips_0133_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_7.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            keyframeSource: "animations/ik_LeftFoot_0134_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_7.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            keyframeSource: "animations/ik_RightFoot_0135_rotation_7.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_7.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            keyframeSource: "animations/ik_Head_0136_rotation_7.qad"
        }
    }
    Timeline {
        id: frames_007_timeline
        objectName: "Frames.007"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2800
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 2800
            from: 0
            to: 2800
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_8.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_8.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_8.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            keyframeSource: "animations/ik_Spine3_02_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_8.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_8.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            keyframeSource: "animations/ik_LeftHand_07_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_8.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_8.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            keyframeSource: "animations/ik_RightHand_03_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_8.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_8.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_8.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_8.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_8.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_8.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_8.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_8.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_8.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_8.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_8.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_8.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_8.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_8.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_8.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_8.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_8.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_8.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_8.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_8.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_8.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-38.4087, -25.5809, -1.47824)
            }
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_8.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_8.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_8.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_8.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_8.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_8.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.725225)
            }
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(48.0552, 20.9808, 0.725225)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_8.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_8.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_8.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_8.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_8.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_8.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_8.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_8.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_8.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_8.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_8.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_8.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_8.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_8.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_8.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_8.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_8.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_8.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_8.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_8.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_8.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_8.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_8.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_8.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_8.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_8.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_8.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_8.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_8.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(27.1709, -16.9145, 8.96454e-05)
            }
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_8.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_8.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999301, 0.0212542, -0.00852281, 0.0295585)
            }
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.880625, -0.168961, 0.0711457, 0.43691)
            }
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969429, 0.224882, 0.0779004, 0.0597311)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973604, -0.0497164, -0.0333392, 0.220253)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.940086, 0.049886, 0.0225632, 0.336512)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430647, 0.0332208, 0.241369)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_8.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            keyframeSource: "animations/rightInHandMiddle_098_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_8.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.944937, 0.0293403, -0.0331532, 0.324243)
            }
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327184, 0.117394, 0.420376)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.931262, -0.0566451, 0.0786065, 0.351231)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-44.2471, 5.37659, 0.826601)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.939389, -0.0955966, -0.0163223, 0.32885)
            }
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_8.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.941363, 0.00502077, -0.0563828, 0.332612)
            }
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-7.95187, 1.34686, -19.4511)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            keyframeSource: "animations/rightInHandPinky_0109_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_8.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_8.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_8.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_8.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_8.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_8.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_8.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_8.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_8.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_8.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_8.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_8.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_8.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_8.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_8.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_8.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_8.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_8.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_8.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_8.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_8.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(16.1655, 1.34471, -23.2399)
            }
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_8.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_8.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_8.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_8.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_8.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_8.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_8.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_8.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_8.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_8.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_8.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_8.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_8.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            keyframeSource: "animations/ik_Hips_0133_rotation_8.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_8.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_8.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            keyframeSource: "animations/ik_RightFoot_0135_rotation_8.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_8.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            keyframeSource: "animations/ik_Head_0136_rotation_8.qad"
        }
    }
    Timeline {
        id: frames_008_timeline
        objectName: "Frames.008"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2034
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 2034
            from: 0
            to: 2034
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_9.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_9.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_9.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_9.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_9.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_9.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_9.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference2_04
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.0716953, -6.74049e-16, 14.2682)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_9.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_9.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_9.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference1_05
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.0716953, -6.74049e-16, 14.2682)
            }
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_9.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_9.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-16.1655, -1.34479, 23.24)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_9.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_9.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_9.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_9.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_9.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_9.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_9.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_9.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_9.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_9.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_9.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_9.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_9.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_9.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_9.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_9.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-38.4087, -25.5809, -1.47822)
            }
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-117.054, -10.1001, 92.348)
            }
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.994426, 0.100752, -0.00991419, -0.0294678)
            }
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_9.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_9.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_9.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_9.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_9.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            keyframeSource: "animations/skt_LeftHand_042_position_9.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(17.2504, 0.657048, -8.58307e-06)
            }
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(44.2476, -5.37626, -0.826338)
            }
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(3.42828, 2.70113, -10.2452)
            }
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(252.326, 259.417, 219.558)
            }
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.692474, 0.449047, 0.47269, 0.308872)
            }
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_9.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_9.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_9.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_9.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_9.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_9.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(8.80947, 6.33601, -4.19489)
            }
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_9.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_9.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_9.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_9.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_9.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_9.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_9.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_9.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_9.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_9.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_9.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_9.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_9.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_9.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_9.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_9.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_9.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_9.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_9.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_9.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_9.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_9.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_9.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_9.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-224.848, -4.95235, 9.36717)
            }
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            keyframeSource: "animations/rightHandThumb4_097_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.880625, -0.168961, 0.071146, 0.43691)
            }
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969428, 0.224882, 0.0779003, 0.059731)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973604, -0.0497163, -0.033339, 0.220253)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle3_0101_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430644, 0.0332207, 0.241368)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_9.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.997624, 0.0388621, 0.0290057, 0.0489301)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_9.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.944937, 0.0293403, -0.033153, 0.324243)
            }
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327185, 0.117393, 0.420375)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.931262, -0.0566454, 0.0786064, 0.351231)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            keyframeSource: "animations/rightHandIndex1_0105_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "position"
            keyframeSource: "animations/rightInHandIndex_0104_position_9.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.941364, 0.00502074, -0.0563829, 0.332611)
            }
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "position"
            keyframeSource: "animations/rightHandPinky1_0110_position_9.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            keyframeSource: "animations/rightInHandPinky_0109_position_9.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987488, 0.107136, 0.102255, -0.0541683)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_9.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_9.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_9.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_9.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_9.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_9.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_9.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_9.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(8.80898, 6.33609, 4.19488)
            }
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_9.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_9.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_9.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_9.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_9.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_9.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_9.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_9.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_9.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_9.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_9.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(4.48676, 5.94027, 16.3631)
            }
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_9.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_9.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            keyframeSource: "animations/leftFootIndex1_0126_position_9.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_9.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_9.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_9.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_9.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_9.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_9.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_9.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(38.4087, -25.5808, -1.47829)
            }
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_9.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_9.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_9.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_9.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_9.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_9.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_9.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_9.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_9.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
    }
    Timeline {
        id: frames_009_timeline
        objectName: "Frames.009"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2034
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 2034
            from: 0
            to: 2034
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_10.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_10.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_10.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_10.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_10.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_10.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_10.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_10.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -5.68198e-14, 0, 0)
            }
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_10.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_10.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_10.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_10.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_10.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_10.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_10.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_10.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_10.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_10.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_10.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_10.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_10.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_10.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_10.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_10.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_10.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_10.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_10.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_10.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_10.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_10.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_10.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_10.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_10.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(7.95256, -1.34661, 19.4513)
            }
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "position"
            keyframeSource: "animations/skt_LeftHand_042_position_10.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "position"
            keyframeSource: "animations/leftHandIndex3_046_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "position"
            keyframeSource: "animations/leftHandIndex1_044_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "position"
            keyframeSource: "animations/leftInHandIndex_043_position_10.qad"
        }
        KeyframeGroup {
            target: leftInHandIndex_043
            property: "rotation"
            keyframeSource: "animations/leftInHandIndex_043_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "position"
            keyframeSource: "animations/skt_FX_LeftHand_00_position_10.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(4.37416, 16.1999, -15.6615)
            }
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_10.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_10.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "rotation"
            keyframeSource: "animations/leftInHandMiddle_051_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_10.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_10.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_10.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_10.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_10.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_10.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_10.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_10.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_10.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_10.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_10.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_10.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_10.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_10.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_10.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_10.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_10.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_10.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_10.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_10.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_10.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_10.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_10.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_10.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_10.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_10.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_10.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_10.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_10.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_10.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999301, 0.0212541, -0.00852275, 0.0295585)
            }
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            keyframeSource: "animations/rightHandThumb3_096_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.969428, 0.224882, 0.0779004, 0.059731)
            }
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973604, -0.0497167, -0.0333391, 0.220254)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.940086, 0.0498863, 0.0225632, 0.336512)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968908, 0.0430647, 0.0332209, 0.241368)
            }
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "position"
            keyframeSource: "animations/rightHandMiddle1_099_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_10.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.997624, 0.0388622, 0.0290058, 0.0489301)
            }
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_10.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.899129, -0.0327185, 0.117394, 0.420376)
            }
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.931262, -0.0566453, 0.0786066, 0.351231)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-44.2471, 5.37654, 0.826607)
            }
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightInHandIndex_0104
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921629, 0.353523, 0.113846, -0.112521)
            }
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_10.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-7.9519, 1.34685, -19.4511)
            }
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987487, 0.107136, 0.102255, -0.0541686)
            }
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_10.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_10.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_10.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_10.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_10.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_10.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_10.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_10.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_10.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_10.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_10.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_10.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_10.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_10.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_10.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_10.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_10.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_10.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_10.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_10.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_10.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(16.1655, 1.34474, -23.2399)
            }
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_10.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_10.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_10.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_10.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_10.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_10.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_10.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_10.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_10.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_10.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_10.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_10.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_10.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_10.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_10.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_10.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 2.36187e-17, 0, 0)
            }
        }
    }
    Timeline {
        id: frames_010_timeline
        objectName: "Frames.010"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 27300
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 27300
            from: 0
            to: 27300
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "position"
            keyframeSource: "animations/leftForeArmTwist2_056_position_11.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist2_056
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist2_056_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_Reference_06
            property: "rotation"
            keyframeSource: "animations/skt_Reference_06_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "position"
            keyframeSource: "animations/ik_Spine3_02_position_11.qad"
        }
        KeyframeGroup {
            target: ik_Spine3_02
            property: "rotation"
            keyframeSource: "animations/ik_Spine3_02_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "position"
            keyframeSource: "animations/ik_LeftHand_07_position_11.qad"
        }
        KeyframeGroup {
            target: ik_LeftHand_07
            property: "rotation"
            keyframeSource: "animations/ik_LeftHand_07_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "position"
            keyframeSource: "animations/leftHandMiddle3_054_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle3_054
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle3_054_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "position"
            keyframeSource: "animations/ik_RightHand_03_position_11.qad"
        }
        KeyframeGroup {
            target: ik_RightHand_03
            property: "rotation"
            keyframeSource: "animations/ik_RightHand_03_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "position"
            keyframeSource: "animations/skt_HeadCamera_08_position_11.qad"
        }
        KeyframeGroup {
            target: skt_HeadCamera_08
            property: "rotation"
            keyframeSource: "animations/skt_HeadCamera_08_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "position"
            keyframeSource: "animations/leftHandMiddle1_052_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle1_052
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle1_052_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference2_04
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference2_04_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "position"
            keyframeSource: "animations/leftArm_032_position_11.qad"
        }
        KeyframeGroup {
            target: leftArm_032
            property: "rotation"
            keyframeSource: "animations/leftArm_032_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "position"
            keyframeSource: "animations/rightLegTwist1_012_position_11.qad"
        }
        KeyframeGroup {
            target: rightLegTwist1_012
            property: "rotation"
            keyframeSource: "animations/rightLegTwist1_012_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "position"
            keyframeSource: "animations/leftHand_036_position_11.qad"
        }
        KeyframeGroup {
            target: leftHand_036
            property: "rotation"
            keyframeSource: "animations/leftHand_036_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_Reference1_05
            property: "rotation"
            keyframeSource: "animations/skt_FX_Reference1_05_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "position"
            keyframeSource: "animations/rightFootIndex3_017_position_11.qad"
        }
        KeyframeGroup {
            target: rightFootIndex3_017
            property: "rotation"
            keyframeSource: "animations/rightFootIndex3_017_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "position"
            keyframeSource: "animations/skt_Head_062_position_11.qad"
        }
        KeyframeGroup {
            target: skt_Head_062
            property: "rotation"
            keyframeSource: "animations/skt_Head_062_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "position"
            keyframeSource: "animations/rightFootIndex2_016_position_11.qad"
        }
        KeyframeGroup {
            target: rightFootIndex2_016
            property: "rotation"
            keyframeSource: "animations/rightFootIndex2_016_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFootIndex1_015
            property: "rotation"
            keyframeSource: "animations/rightFootIndex1_015_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "position"
            keyframeSource: "animations/rightFootBigToe3_020_position_11.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe3_020
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe3_020_rotation_11.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "position"
            keyframeSource: "animations/jaw_065_position_11.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "position"
            keyframeSource: "animations/rightFootBigToe2_019_position_11.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe2_019
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe2_019_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFootBigToe1_018
            property: "rotation"
            keyframeSource: "animations/rightFootBigToe1_018_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "position"
            keyframeSource: "animations/rightToeBaseEnd_021_position_11.qad"
        }
        KeyframeGroup {
            target: rightToeBaseEnd_021
            property: "rotation"
            keyframeSource: "animations/rightToeBaseEnd_021_rotation_11.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "position"
            keyframeSource: "animations/nose_067_position_11.qad"
        }
        KeyframeGroup {
            target: nose_067
            property: "rotation"
            keyframeSource: "animations/nose_067_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "position"
            keyframeSource: "animations/rightToeBase_014_position_11.qad"
        }
        KeyframeGroup {
            target: rightToeBase_014
            property: "rotation"
            keyframeSource: "animations/rightToeBase_014_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "position"
            keyframeSource: "animations/rightFoot_013_position_11.qad"
        }
        KeyframeGroup {
            target: rightFoot_013
            property: "rotation"
            keyframeSource: "animations/rightFoot_013_rotation_11.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "position"
            keyframeSource: "animations/lip_upper_069_position_11.qad"
        }
        KeyframeGroup {
            target: lip_upper_069
            property: "rotation"
            keyframeSource: "animations/lip_upper_069_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "position"
            keyframeSource: "animations/rightLeg_011_position_11.qad"
        }
        KeyframeGroup {
            target: rightLeg_011
            property: "rotation"
            keyframeSource: "animations/rightLeg_011_rotation_11.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "position"
            keyframeSource: "animations/lip_lower_070_position_11.qad"
        }
        KeyframeGroup {
            target: lip_lower_070
            property: "rotation"
            keyframeSource: "animations/lip_lower_070_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "position"
            keyframeSource: "animations/rightUpLegTwist1_022_position_11.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist1_022
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist1_022_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "position"
            keyframeSource: "animations/rightUpLegTwist2_023_position_11.qad"
        }
        KeyframeGroup {
            target: rightUpLegTwist2_023
            property: "rotation"
            keyframeSource: "animations/rightUpLegTwist2_023_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "position"
            keyframeSource: "animations/eye_lid_in_right_072_position_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_right_072
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_right_072_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightUpLeg_010
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_010_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "position"
            keyframeSource: "animations/eye_lid_out_right_073_position_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_right_073
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_right_073_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "position"
            keyframeSource: "animations/skt_FX_Hips_024_position_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_Hips_024
            property: "rotation"
            keyframeSource: "animations/skt_FX_Hips_024_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "position"
            keyframeSource: "animations/skt_Back_029_position_11.qad"
        }
        KeyframeGroup {
            target: skt_Back_029
            property: "rotation"
            keyframeSource: "animations/skt_Back_029_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "position"
            keyframeSource: "animations/skt_Chest_030_position_11.qad"
        }
        KeyframeGroup {
            target: skt_Chest_030
            property: "rotation"
            keyframeSource: "animations/skt_Chest_030_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "position"
            keyframeSource: "animations/leftForeArmTwist3_034_position_11.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist3_034
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist3_034_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "position"
            keyframeSource: "animations/leftForeArmTwist1_035_position_11.qad"
        }
        KeyframeGroup {
            target: leftForeArmTwist1_035
            property: "rotation"
            keyframeSource: "animations/leftForeArmTwist1_035_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "position"
            keyframeSource: "animations/leftHandPinky4_041_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky4_041
            property: "rotation"
            keyframeSource: "animations/leftHandPinky4_041_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "position"
            keyframeSource: "animations/leftHandPinky3_040_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky3_040
            property: "rotation"
            keyframeSource: "animations/leftHandPinky3_040_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "position"
            keyframeSource: "animations/leftHandPinky2_039_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky2_039
            property: "rotation"
            keyframeSource: "animations/leftHandPinky2_039_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandPinky1_038
            property: "rotation"
            keyframeSource: "animations/leftHandPinky1_038_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "position"
            keyframeSource: "animations/leftInHandPinky_037_position_11.qad"
        }
        KeyframeGroup {
            target: leftInHandPinky_037
            property: "rotation"
            keyframeSource: "animations/leftInHandPinky_037_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_LeftHand_042
            property: "rotation"
            keyframeSource: "animations/skt_LeftHand_042_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "position"
            keyframeSource: "animations/leftHandIndex4_047_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandIndex4_047
            property: "rotation"
            keyframeSource: "animations/leftHandIndex4_047_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandIndex3_046
            property: "rotation"
            keyframeSource: "animations/leftHandIndex3_046_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "position"
            keyframeSource: "animations/leftHandIndex2_045_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandIndex2_045
            property: "rotation"
            keyframeSource: "animations/leftHandIndex2_045_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandIndex1_044
            property: "rotation"
            keyframeSource: "animations/leftHandIndex1_044_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_LeftHand_00
            property: "rotation"
            keyframeSource: "animations/skt_FX_LeftHand_00_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "position"
            keyframeSource: "animations/leftHandThumb4_050_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb4_050
            property: "rotation"
            keyframeSource: "animations/leftHandThumb4_050_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "position"
            keyframeSource: "animations/leftHandThumb3_049_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb3_049
            property: "rotation"
            keyframeSource: "animations/leftHandThumb3_049_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "position"
            keyframeSource: "animations/leftHandThumb2_048_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb2_048
            property: "rotation"
            keyframeSource: "animations/leftHandThumb2_048_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandThumb1_01
            property: "rotation"
            keyframeSource: "animations/leftHandThumb1_01_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "position"
            keyframeSource: "animations/leftHandMiddle4_055_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle4_055
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle4_055_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "position"
            keyframeSource: "animations/leftHandMiddle2_053_position_11.qad"
        }
        KeyframeGroup {
            target: leftHandMiddle2_053
            property: "rotation"
            keyframeSource: "animations/leftHandMiddle2_053_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftInHandMiddle_051
            property: "position"
            keyframeSource: "animations/leftInHandMiddle_051_position_11.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "position"
            keyframeSource: "animations/leftForeArm_033_position_11.qad"
        }
        KeyframeGroup {
            target: leftForeArm_033
            property: "rotation"
            keyframeSource: "animations/leftForeArm_033_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "position"
            keyframeSource: "animations/leftArmTwist1_057_position_11.qad"
        }
        KeyframeGroup {
            target: leftArmTwist1_057
            property: "rotation"
            keyframeSource: "animations/leftArmTwist1_057_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "position"
            keyframeSource: "animations/leftArmTwist2_058_position_11.qad"
        }
        KeyframeGroup {
            target: leftArmTwist2_058
            property: "rotation"
            keyframeSource: "animations/leftArmTwist2_058_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftShoulder_031
            property: "rotation"
            keyframeSource: "animations/leftShoulder_031_rotation_11.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "position"
            keyframeSource: "animations/headEnd_063_position_11.qad"
        }
        KeyframeGroup {
            target: headEnd_063
            property: "rotation"
            keyframeSource: "animations/headEnd_063_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "position"
            keyframeSource: "animations/eye_left_066_position_11.qad"
        }
        KeyframeGroup {
            target: eye_left_066
            property: "rotation"
            keyframeSource: "animations/eye_left_066_rotation_11.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "position"
            keyframeSource: "animations/lip_corners_068_position_11.qad"
        }
        KeyframeGroup {
            target: lip_corners_068
            property: "rotation"
            keyframeSource: "animations/lip_corners_068_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "position"
            keyframeSource: "animations/eye_lid_right_071_position_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_right_071
            property: "rotation"
            keyframeSource: "animations/eye_lid_right_071_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "position"
            keyframeSource: "animations/tongue_06_081_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_06_081
            property: "rotation"
            keyframeSource: "animations/tongue_06_081_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "position"
            keyframeSource: "animations/tongue_05_080_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_05_080
            property: "rotation"
            keyframeSource: "animations/tongue_05_080_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "position"
            keyframeSource: "animations/tongue_04_079_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_04_079
            property: "rotation"
            keyframeSource: "animations/tongue_04_079_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "position"
            keyframeSource: "animations/tongue_03_078_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_03_078
            property: "rotation"
            keyframeSource: "animations/tongue_03_078_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "position"
            keyframeSource: "animations/tongue_02_077_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_02_077
            property: "rotation"
            keyframeSource: "animations/tongue_02_077_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "position"
            keyframeSource: "animations/tongue_01_076_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_01_076
            property: "rotation"
            keyframeSource: "animations/tongue_01_076_rotation_11.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "position"
            keyframeSource: "animations/tongue_jaw_075_position_11.qad"
        }
        KeyframeGroup {
            target: tongue_jaw_075
            property: "rotation"
            keyframeSource: "animations/tongue_jaw_075_rotation_11.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "position"
            keyframeSource: "animations/teeth_lwr_082_position_11.qad"
        }
        KeyframeGroup {
            target: teeth_lwr_082
            property: "rotation"
            keyframeSource: "animations/teeth_lwr_082_rotation_11.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "position"
            keyframeSource: "animations/teeth_upr_083_position_11.qad"
        }
        KeyframeGroup {
            target: teeth_upr_083
            property: "rotation"
            keyframeSource: "animations/teeth_upr_083_rotation_11.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "position"
            keyframeSource: "animations/mouth_bag_074_position_11.qad"
        }
        KeyframeGroup {
            target: mouth_bag_074
            property: "rotation"
            keyframeSource: "animations/mouth_bag_074_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "position"
            keyframeSource: "animations/eye_right_084_position_11.qad"
        }
        KeyframeGroup {
            target: eye_right_084
            property: "rotation"
            keyframeSource: "animations/eye_right_084_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "position"
            keyframeSource: "animations/eye_lid_out_left_086_position_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_out_left_086
            property: "rotation"
            keyframeSource: "animations/eye_lid_out_left_086_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "position"
            keyframeSource: "animations/eye_lid_in_left_087_position_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_in_left_087
            property: "rotation"
            keyframeSource: "animations/eye_lid_in_left_087_rotation_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "position"
            keyframeSource: "animations/eye_lid_left_085_position_11.qad"
        }
        KeyframeGroup {
            target: eye_lid_left_085
            property: "rotation"
            keyframeSource: "animations/eye_lid_left_085_rotation_11.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "position"
            keyframeSource: "animations/face_064_position_11.qad"
        }
        KeyframeGroup {
            target: face_064
            property: "rotation"
            keyframeSource: "animations/face_064_rotation_11.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "position"
            keyframeSource: "animations/head_061_position_11.qad"
        }
        KeyframeGroup {
            target: head_061
            property: "rotation"
            keyframeSource: "animations/head_061_rotation_11.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "position"
            keyframeSource: "animations/neck1_060_position_11.qad"
        }
        KeyframeGroup {
            target: neck1_060
            property: "rotation"
            keyframeSource: "animations/neck1_060_rotation_11.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "position"
            keyframeSource: "animations/neck_059_position_11.qad"
        }
        KeyframeGroup {
            target: neck_059
            property: "rotation"
            keyframeSource: "animations/neck_059_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "position"
            keyframeSource: "animations/rightArmTwist1_090_position_11.qad"
        }
        KeyframeGroup {
            target: rightArmTwist1_090
            property: "rotation"
            keyframeSource: "animations/rightArmTwist1_090_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "position"
            keyframeSource: "animations/skt_FX_RightHand_093_position_11.qad"
        }
        KeyframeGroup {
            target: skt_FX_RightHand_093
            property: "rotation"
            keyframeSource: "animations/skt_FX_RightHand_093_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "position"
            keyframeSource: "animations/rightHandThumb4_097_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb4_097
            property: "rotation"
            keyframeSource: "animations/rightHandThumb4_097_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "position"
            keyframeSource: "animations/rightHandThumb3_096_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb3_096
            property: "rotation"
            keyframeSource: "animations/rightHandThumb3_096_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "position"
            keyframeSource: "animations/rightHandThumb2_095_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb2_095
            property: "rotation"
            keyframeSource: "animations/rightHandThumb2_095_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandThumb1_094
            property: "rotation"
            keyframeSource: "animations/rightHandThumb1_094_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "position"
            keyframeSource: "animations/rightHandMiddle4_0102_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle4_0102
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle4_0102_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "position"
            keyframeSource: "animations/rightHandMiddle3_0101_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle3_0101
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle3_0101_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "position"
            keyframeSource: "animations/rightHandMiddle2_0100_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle2_0100
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle2_0100_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandMiddle1_099
            property: "rotation"
            keyframeSource: "animations/rightHandMiddle1_099_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightInHandMiddle_098
            property: "position"
            keyframeSource: "animations/rightInHandMiddle_098_position_11.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "position"
            keyframeSource: "animations/skt_RightHand_0103_position_11.qad"
        }
        KeyframeGroup {
            target: skt_RightHand_0103
            property: "rotation"
            keyframeSource: "animations/skt_RightHand_0103_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "position"
            keyframeSource: "animations/rightHandIndex4_0108_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex4_0108
            property: "rotation"
            keyframeSource: "animations/rightHandIndex4_0108_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "position"
            keyframeSource: "animations/rightHandIndex3_0107_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex3_0107
            property: "rotation"
            keyframeSource: "animations/rightHandIndex3_0107_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "position"
            keyframeSource: "animations/rightHandIndex2_0106_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex2_0106
            property: "rotation"
            keyframeSource: "animations/rightHandIndex2_0106_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandIndex1_0105
            property: "rotation"
            keyframeSource: "animations/rightHandIndex1_0105_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "position"
            keyframeSource: "animations/rightHandPinky4_0113_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky4_0113
            property: "rotation"
            keyframeSource: "animations/rightHandPinky4_0113_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "position"
            keyframeSource: "animations/rightHandPinky3_0112_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky3_0112
            property: "rotation"
            keyframeSource: "animations/rightHandPinky3_0112_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "position"
            keyframeSource: "animations/rightHandPinky2_0111_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky2_0111
            property: "rotation"
            keyframeSource: "animations/rightHandPinky2_0111_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "position"
            keyframeSource: "animations/rightHandPinky1_0110_position_11.qad"
        }
        KeyframeGroup {
            target: rightHandPinky1_0110
            property: "rotation"
            keyframeSource: "animations/rightHandPinky1_0110_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightInHandPinky_0109
            property: "position"
            keyframeSource: "animations/rightInHandPinky_0109_position_11.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "position"
            keyframeSource: "animations/rightHand_092_position_11.qad"
        }
        KeyframeGroup {
            target: rightHand_092
            property: "rotation"
            keyframeSource: "animations/rightHand_092_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "position"
            keyframeSource: "animations/rightForeArmTwist3_0114_position_11.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist3_0114
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist3_0114_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "position"
            keyframeSource: "animations/rightForeArmTwist2_0115_position_11.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist2_0115
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist2_0115_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "position"
            keyframeSource: "animations/rightForeArmTwist1_0116_position_11.qad"
        }
        KeyframeGroup {
            target: rightForeArmTwist1_0116
            property: "rotation"
            keyframeSource: "animations/rightForeArmTwist1_0116_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "position"
            keyframeSource: "animations/rightForeArm_091_position_11.qad"
        }
        KeyframeGroup {
            target: rightForeArm_091
            property: "rotation"
            keyframeSource: "animations/rightForeArm_091_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "position"
            keyframeSource: "animations/rightArmTwist2_0117_position_11.qad"
        }
        KeyframeGroup {
            target: rightArmTwist2_0117
            property: "rotation"
            keyframeSource: "animations/rightArmTwist2_0117_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "position"
            keyframeSource: "animations/rightArm_089_position_11.qad"
        }
        KeyframeGroup {
            target: rightArm_089
            property: "rotation"
            keyframeSource: "animations/rightArm_089_rotation_11.qad"
        }
        KeyframeGroup {
            target: rightShoulder_088
            property: "rotation"
            keyframeSource: "animations/rightShoulder_088_rotation_11.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "position"
            keyframeSource: "animations/spine3_028_position_11.qad"
        }
        KeyframeGroup {
            target: spine3_028
            property: "rotation"
            keyframeSource: "animations/spine3_028_rotation_11.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "position"
            keyframeSource: "animations/spine2_027_position_11.qad"
        }
        KeyframeGroup {
            target: spine2_027
            property: "rotation"
            keyframeSource: "animations/spine2_027_rotation_11.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "position"
            keyframeSource: "animations/spine1_026_position_11.qad"
        }
        KeyframeGroup {
            target: spine1_026
            property: "rotation"
            keyframeSource: "animations/spine1_026_rotation_11.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "position"
            keyframeSource: "animations/spine_025_position_11.qad"
        }
        KeyframeGroup {
            target: spine_025
            property: "rotation"
            keyframeSource: "animations/spine_025_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "position"
            keyframeSource: "animations/leftLegTwist1_0120_position_11.qad"
        }
        KeyframeGroup {
            target: leftLegTwist1_0120
            property: "rotation"
            keyframeSource: "animations/leftLegTwist1_0120_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "position"
            keyframeSource: "animations/leftFootBigToe3_0125_position_11.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe3_0125
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe3_0125_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "position"
            keyframeSource: "animations/leftFootBigToe2_0124_position_11.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe2_0124
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe2_0124_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFootBigToe1_0123
            property: "rotation"
            keyframeSource: "animations/leftFootBigToe1_0123_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "position"
            keyframeSource: "animations/leftFootIndex3_0128_position_11.qad"
        }
        KeyframeGroup {
            target: leftFootIndex3_0128
            property: "rotation"
            keyframeSource: "animations/leftFootIndex3_0128_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "position"
            keyframeSource: "animations/leftFootIndex2_0127_position_11.qad"
        }
        KeyframeGroup {
            target: leftFootIndex2_0127
            property: "rotation"
            keyframeSource: "animations/leftFootIndex2_0127_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFootIndex1_0126
            property: "rotation"
            keyframeSource: "animations/leftFootIndex1_0126_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "position"
            keyframeSource: "animations/leftToeBaseEnd_0129_position_11.qad"
        }
        KeyframeGroup {
            target: leftToeBaseEnd_0129
            property: "rotation"
            keyframeSource: "animations/leftToeBaseEnd_0129_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "position"
            keyframeSource: "animations/leftToeBase_0122_position_11.qad"
        }
        KeyframeGroup {
            target: leftToeBase_0122
            property: "rotation"
            keyframeSource: "animations/leftToeBase_0122_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "position"
            keyframeSource: "animations/leftFoot_0121_position_11.qad"
        }
        KeyframeGroup {
            target: leftFoot_0121
            property: "rotation"
            keyframeSource: "animations/leftFoot_0121_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "position"
            keyframeSource: "animations/leftLeg_0119_position_11.qad"
        }
        KeyframeGroup {
            target: leftLeg_0119
            property: "rotation"
            keyframeSource: "animations/leftLeg_0119_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "position"
            keyframeSource: "animations/leftUpLegTwist1_0130_position_11.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist1_0130
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist1_0130_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "position"
            keyframeSource: "animations/leftUpLegTwist2_0131_position_11.qad"
        }
        KeyframeGroup {
            target: leftUpLegTwist2_0131
            property: "rotation"
            keyframeSource: "animations/leftUpLegTwist2_0131_rotation_11.qad"
        }
        KeyframeGroup {
            target: leftUpLeg_0118
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_0118_rotation_11.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "position"
            keyframeSource: "animations/skt_Hips_0132_position_11.qad"
        }
        KeyframeGroup {
            target: skt_Hips_0132
            property: "rotation"
            keyframeSource: "animations/skt_Hips_0132_rotation_11.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "position"
            keyframeSource: "animations/hips_09_position_11.qad"
        }
        KeyframeGroup {
            target: hips_09
            property: "rotation"
            keyframeSource: "animations/hips_09_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "position"
            keyframeSource: "animations/ik_Hips_0133_position_11.qad"
        }
        KeyframeGroup {
            target: ik_Hips_0133
            property: "rotation"
            keyframeSource: "animations/ik_Hips_0133_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "position"
            keyframeSource: "animations/ik_LeftFoot_0134_position_11.qad"
        }
        KeyframeGroup {
            target: ik_LeftFoot_0134
            property: "rotation"
            keyframeSource: "animations/ik_LeftFoot_0134_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "position"
            keyframeSource: "animations/ik_RightFoot_0135_position_11.qad"
        }
        KeyframeGroup {
            target: ik_RightFoot_0135
            property: "rotation"
            keyframeSource: "animations/ik_RightFoot_0135_rotation_11.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "position"
            keyframeSource: "animations/ik_Head_0136_position_11.qad"
        }
        KeyframeGroup {
            target: ik_Head_0136
            property: "rotation"
            keyframeSource: "animations/ik_Head_0136_rotation_11.qad"
        }
        KeyframeGroup {
            target: troll_Cave
            property: "position"
            keyframeSource: "animations/troll_Cave_position_11.qad"
        }
        KeyframeGroup {
            target: troll_Cave
            property: "rotation"
            keyframeSource: "animations/troll_Cave_rotation_11.qad"
        }
    }
}
