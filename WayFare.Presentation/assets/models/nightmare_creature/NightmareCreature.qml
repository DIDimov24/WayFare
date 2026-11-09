import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: root
    objectName: "Root"

    // Resources
    Texture {
        id: textures_Horror1_baseColor_png_texture
        objectName: "textures/Horror1_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Horror1_baseColor.png"
    }
    Texture {
        id: textures_Horror1_metallicRoughness_png_texture
        objectName: "textures/Horror1_metallicRoughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Horror1_metallicRoughness.png"
    }
    Texture {
        id: textures_Horror1_normal_png_texture
        objectName: "textures/Horror1_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Horror1_normal.png"
    }
    PrincipledMaterial {
        id: horror1_material
        objectName: "Horror1"
        baseColorMap: textures_Horror1_baseColor_png_texture
        metalnessMap: textures_Horror1_metallicRoughness_png_texture
        roughnessMap: textures_Horror1_metallicRoughness_png_texture
        roughness: 1
        normalMap: textures_Horror1_normal_png_texture
        occlusionMap: textures_Horror1_metallicRoughness_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            _rootJoint,
            base_bone_01,
            foot_ctrl_L_02,
            knee_IK_L_03,
            knee_IK_L_end_080,
            heel_roll_L_04,
            toe_roll_L_05,
            foot_IK_L_06,
            foot_IK_L_end_079,
            footRoll_crtl_L_07,
            footRoll_crtl_L_end_084,
            hips_ctrl_08,
            spine_1_09,
            spine_2_010,
            spine_3_011,
            spine_4_012,
            spine_5_013,
            neck_014,
            head_015,
            jaw_016,
            jaw_end_072,
            clavicle_L_017,
            upper_arm_L_018,
            bottom_arm_L_019,
            hand_L_020,
            finger1_1_L_021,
            finger1_2_L_022,
            finger1_3_L_023,
            finger1_3_L_end_073,
            thumb_1_L_024,
            thumb_2_L_025,
            thumb_2_L_end_078,
            finger2_1_L_026,
            finger2_2_L_027,
            finger2_3_L_028,
            finger2_3_L_end_082,
            finger3_1_L_029,
            finger3_2_L_030,
            finger3_3_L_031,
            finger3_3_L_end_076,
            finger4_1_L_032,
            finger4_2_L_00,
            finger4_3_L_033,
            finger4_3_L_end_090,
            clavicle_R_034,
            upper_arm_R_035,
            bottom_arm_R_036,
            hand_R_037,
            finger1_1_R_038,
            finger1_2_R_039,
            finger1_3_R_040,
            finger1_3_R_end_075,
            thumb_1_R_041,
            thumb_2_R_042,
            thumb_2_R_end_087,
            finger2_1_R_043,
            finger2_2_R_044,
            finger2_3_R_045,
            finger2_3_R_end_086,
            finger3_1_R_046,
            finger3_2_R_047,
            finger3_3_R_048,
            finger3_3_R_end_081,
            finger4_1_R_049,
            finger4_2_R_050,
            finger4_3_R_051,
            finger4_3_R_end_085,
            upper_leg_L_052,
            bottom_low_leg_L_053,
            foot_L_054,
            toe_L_055,
            toe_L_end_071,
            upper_leg_R_056,
            bottom_low_leg_R_057,
            foot_R_058,
            toe_R_059,
            toe_R_end_074,
            hand_IK_L_060,
            elbow_IK_L_061,
            elbow_IK_L_end_070,
            hand_IK_R_062,
            elbow_IK_R_063,
            elbow_IK_R_end_089,
            foot_ctrl_R_064,
            knee_IK_R_065,
            knee_IK_R_end_083,
            heel_roll_R_066,
            toe_roll_R_067,
            foot_IK_R_068,
            foot_IK_R_end_088,
            footRoll_crtl_R_069,
            footRoll_crtl_R_end_077
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
            Qt.matrix4x4(1, 4.9638e-07, 3.9247e-09, -1.26552e-07, 3.81477e-08, -0.08473, 0.996404, -1.15682, 4.94928e-07, -0.996404, -0.08473, 0.367137, 0, 0, 0, 1),
            Qt.matrix4x4(1, 4.02498e-06, 5.66438e-07, -1.82799e-06, -1.59102e-08, -0.13548, 0.99078, -1.47373, 4.06461e-06, -0.99078, -0.13548, 0.44294, 0, 0, 0, 1),
            Qt.matrix4x4(1, 3.23594e-06, 2.47718e-06, -5.08261e-06, -1.42406e-08, -0.605081, 0.796164, -1.29932, 4.07523e-06, -0.796164, -0.605081, 1.24223, 0, 0, 0, 1),
            Qt.matrix4x4(1, 6.65188e-07, 1.31127e-06, -2.64141e-06, -1.11904e-08, -0.888345, 0.459177, -0.872159, 1.4703e-06, -0.459177, -0.888345, 1.79023, 0, 0, 0, 1),
            Qt.matrix4x4(1, -3.01337e-07, 3.01154e-06, -6.45736e-06, -3.08212e-09, -0.995132, -0.0985501, -0.000235852, 3.02658e-06, 0.0985501, -0.995132, 2.13451, 0, 0, 0, 1),
            Qt.matrix4x4(1, -9.54028e-07, 4.75839e-06, -1.04608e-05, 9.35758e-09, -0.980107, -0.198472, -0.109439, 4.85308e-06, 0.198472, -0.980107, 2.15656, 0, 0, 0, 1),
            Qt.matrix4x4(1, 7.55679e-07, -1.94468e-06, 4.5332e-06, 1.24138e-08, -0.934238, -0.35665, 0.0857625, -2.08631e-06, 0.35665, -0.934238, 2.17194, 0, 0, 0, 1),
            Qt.matrix4x4(1, 1.54996e-06, -1.44046e-06, 3.94623e-06, 1.60445e-08, -0.686293, -0.727325, 0.919477, -2.1159e-06, 0.727325, -0.686293, 1.87034, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.414925, 0.224058, -0.881836, 1.71399, 0.857049, 0.229132, 0.461481, -0.783727, 0.305456, -0.947257, -0.0969562, -0.211392, 0, 0, 0, 1),
            Qt.matrix4x4(-0.880162, -0.102485, -0.463479, 1.17134, 0.46883, -0.0349434, -0.882597, 1.52082, 0.0742579, -0.994121, 0.078804, -0.437062, 0, 0, 0, 1),
            Qt.matrix4x4(-0.922104, -0.212031, -0.323677, 0.968556, 0.374869, -0.696841, -0.611462, 0.437865, -0.0959025, -0.685169, 0.722044, -1.15555, 0, 0, 0, 1),
            Qt.matrix4x4(-0.991327, 0.0618807, -0.115933, 0.994293, 0.116759, 0.00988744, -0.993111, 0.961814, -0.0603082, -0.998035, -0.0170268, -0.616726, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0219509, 0.946027, 0.323344, 0.376742, -0.0809347, 0.320678, -0.943724, 1.10979, -0.996478, -0.0468853, 0.0695272, 0.717422, 0, 0, 0, 1),
            Qt.matrix4x4(0.0930886, 0.756204, 0.64768, -0.091113, -0.0779466, 0.654044, -0.752431, 1.07134, -0.992602, 0.0195583, 0.119827, 0.718027, 0, 0, 0, 1),
            Qt.matrix4x4(0.998582, 0.0449675, -0.0285022, -0.750143, -0.0532353, 0.836516, -0.54535, 0.930553, -0.000680474, 0.546094, 0.837723, -0.277427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.803437, -0.0390358, -0.594108, -0.0965296, -0.551041, 0.329148, -0.766822, 1.42752, 0.225483, 0.943471, 0.242939, 0.220693, 0, 0, 0, 1),
            Qt.matrix4x4(-0.960356, -0.23384, 0.151768, 0.431665, -0.275995, 0.720845, -0.635775, 1.23274, 0.0392686, -0.652458, -0.756807, 0.224872, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00963733, 0.879537, 0.475733, 0.198345, 0.0716348, 0.47514, -0.876989, 1.02728, -0.997384, 0.0256272, -0.0675845, 0.930578, 0, 0, 0, 1),
            Qt.matrix4x4(0.0930235, 0.741435, 0.664545, -0.126249, 0.0868552, 0.658852, -0.747242, 0.930506, -0.991868, 0.12723, -0.00310883, 0.94032, 0, 0, 0, 1),
            Qt.matrix4x4(0.998303, -0.0452342, 0.0366784, -0.922198, 0.0581021, 0.816331, -0.574654, 0.839634, -0.00394771, 0.57581, 0.817574, -0.24864, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0213012, 0.816978, 0.576275, 0.027774, 0.27906, 0.548638, -0.788113, 0.818642, -0.960037, 0.177603, -0.216299, 1.17182, 0, 0, 0, 1),
            Qt.matrix4x4(0.138087, 0.580458, 0.802496, -0.412774, 0.244265, 0.765271, -0.595563, 0.741733, -0.959826, 0.278261, -0.0361111, 1.08877, 0, 0, 0, 1),
            Qt.matrix4x4(0.981945, -0.183456, 0.0461166, -1.06259, 0.186971, 0.904273, -0.383838, 0.641239, 0.0287153, 0.38553, 0.922248, -0.514686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.150228, 0.645939, 0.748461, -0.378012, 0.441493, 0.633545, -0.635379, 0.586953, -0.884599, 0.425892, -0.190002, 1.27823, 0, 0, 0, 1),
            Qt.matrix4x4(0.231655, 0.238133, 0.943201, -0.875828, 0.338715, 0.889161, -0.307679, 0.489124, -0.911926, 0.390751, 0.12532, 1.01481, 0, 0, 0, 1),
            Qt.matrix4x4(0.992593, -0.0136368, -0.120718, -0.887197, 0.0165054, 0.999604, 0.0227947, 0.524205, 0.120359, -0.0246184, 0.992425, -0.953766, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.414925, -0.224058, 0.881836, -1.71399, -0.857049, 0.229133, 0.461481, -0.783727, -0.305456, -0.947257, -0.0969562, -0.211392, 0, 0, 0, 1),
            Qt.matrix4x4(-0.880161, 0.102485, 0.463478, -1.17134, -0.46883, -0.0349437, -0.882597, 1.52082, -0.0742577, -0.99412, 0.0788043, -0.437063, 0, 0, 0, 1),
            Qt.matrix4x4(-0.922104, 0.212031, 0.323677, -0.968556, -0.374869, -0.696841, -0.611462, 0.437865, 0.0959024, -0.685168, 0.722044, -1.15555, 0, 0, 0, 1),
            Qt.matrix4x4(-0.991327, -0.0618807, 0.115933, -0.994293, -0.116759, 0.00988683, -0.993111, 0.961814, 0.0603082, -0.998034, -0.0170262, -0.616727, 0, 0, 0, 1),
            Qt.matrix4x4(-0.021951, -0.946027, -0.323343, -0.376743, 0.0809347, 0.320678, -0.943724, 1.10979, 0.996478, -0.0468854, 0.0695272, 0.717422, 0, 0, 0, 1),
            Qt.matrix4x4(0.0930887, -0.756204, -0.64768, 0.0911129, 0.0779465, 0.654043, -0.752431, 1.07134, 0.992602, 0.0195584, 0.119827, 0.718027, 0, 0, 0, 1),
            Qt.matrix4x4(0.998582, -0.0449676, 0.0285023, 0.750143, 0.0532353, 0.836516, -0.54535, 0.930553, 0.00068044, 0.546094, 0.837723, -0.277427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.803437, 0.0390355, 0.594108, 0.0965293, 0.551041, 0.329147, -0.766822, 1.42752, -0.225483, 0.943471, 0.242939, 0.220693, 0, 0, 0, 1),
            Qt.matrix4x4(-0.960356, 0.233841, -0.151768, -0.431665, 0.275995, 0.720845, -0.635775, 1.23274, -0.0392686, -0.652458, -0.756807, 0.224872, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00963733, -0.879537, -0.475733, -0.198345, -0.0716347, 0.47514, -0.876989, 1.02728, 0.997384, 0.0256271, -0.0675844, 0.930578, 0, 0, 0, 1),
            Qt.matrix4x4(0.0930236, -0.741436, -0.664545, 0.126249, -0.0868552, 0.658852, -0.747242, 0.930506, 0.991868, 0.12723, -0.00310879, 0.94032, 0, 0, 0, 1),
            Qt.matrix4x4(0.998303, 0.0452342, -0.0366783, 0.922198, -0.0581021, 0.816331, -0.574654, 0.839634, 0.00394764, 0.57581, 0.817574, -0.24864, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.0213013, -0.816978, -0.576275, -0.0277742, -0.27906, 0.548638, -0.788113, 0.818642, 0.960037, 0.177603, -0.216299, 1.17182, 0, 0, 0, 1),
            Qt.matrix4x4(0.138087, -0.580458, -0.802496, 0.412774, -0.244265, 0.765271, -0.595563, 0.741733, 0.959826, 0.278261, -0.0361112, 1.08877, 0, 0, 0, 1),
            Qt.matrix4x4(0.981945, 0.183456, -0.0461166, 1.06259, -0.186971, 0.904273, -0.383838, 0.641239, -0.0287153, 0.385531, 0.922248, -0.514686, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.150228, -0.64594, -0.748461, 0.378013, -0.441493, 0.633544, -0.635378, 0.586953, 0.884599, 0.425892, -0.190002, 1.27823, 0, 0, 0, 1),
            Qt.matrix4x4(0.231655, -0.238132, -0.943201, 0.875829, -0.338715, 0.88916, -0.307679, 0.489123, 0.911925, 0.390752, 0.12532, 1.01481, 0, 0, 0, 1),
            Qt.matrix4x4(0.992593, 0.0136365, 0.120718, 0.887197, -0.0165051, 0.999604, 0.0227947, 0.524205, -0.120359, -0.0246183, 0.992425, -0.953766, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.986332, -0.114732, -0.118266, 0.337866, 0.162278, -0.551957, -0.81793, 1.21089, 0.0285653, -0.825942, 0.563031, -0.481112, 0, 0, 0, 1),
            Qt.matrix4x4(0.996942, 0.0637216, -0.0452371, -0.225972, -0.0662314, 0.381739, -0.921894, 0.716768, -0.0414758, 0.922071, 0.384792, -0.196052, 0, 0, 0, 1),
            Qt.matrix4x4(0.999718, -0.0180761, -0.015431, -0.219266, -0.0237667, -0.7583, -0.651472, 0.231288, 7.47895e-05, 0.651655, -0.758516, 0.0303215, 0, 0, 0, 1),
            Qt.matrix4x4(-0.993683, -0.111862, -0.00903555, 0.216346, 0.112226, -0.990445, -0.0801475, -0.039484, 1.62432e-05, -0.0806552, 0.996742, -0.026641, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.986332, 0.114732, 0.118265, -0.337866, -0.162278, -0.551957, -0.81793, 1.21089, -0.0285652, -0.825942, 0.563031, -0.481112, 0, 0, 0, 1),
            Qt.matrix4x4(0.996942, -0.0637217, 0.0452372, 0.225972, 0.0662315, 0.381739, -0.921894, 0.716768, 0.0414758, 0.922071, 0.384792, -0.196052, 0, 0, 0, 1),
            Qt.matrix4x4(0.999718, 0.0180761, 0.0154311, 0.219266, 0.0237668, -0.7583, -0.651472, 0.231288, -7.46455e-05, 0.651655, -0.758515, 0.0303215, 0, 0, 0, 1),
            Qt.matrix4x4(-0.993683, 0.111862, 0.00903538, -0.216346, -0.112226, -0.990445, -0.0801476, -0.0394841, -1.64245e-05, -0.0806553, 0.996742, -0.0266409, 0, 0, 0, 1),
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
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: sketchfab_model
        objectName: "Sketchfab_model"
        rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
        Node {
            id: hor_mon_1_1_fbx
            objectName: "hor_mon_1.1.fbx"
            rotation: Qt.quaternion(0, 1, 0, 0)
            scale: Qt.vector3d(1, 1, 1)
            Node {
                id: object_2
                objectName: "Object_2"
                Node {
                    id: rootNode
                    objectName: "RootNode"
                    Node {
                        id: creature_armature
                        objectName: "Creature_armature"
                        position: Qt.vector3d(0, 0, 0.893426)
                        Node {
                            id: object_5
                            objectName: "Object_5"
                            Node {
                                id: _rootJoint
                                objectName: "_rootJoint"
                                Node {
                                    id: base_bone_01
                                    objectName: "Base_bone_01"
                                    position: Qt.vector3d(4.84599e-09, 0.428948, -0.887828)
                                    rotation: Qt.quaternion(4.37114e-08, 1, -1.68937e-08, 1.94707e-07)
                                    Node {
                                        id: foot_ctrl_L_02
                                        objectName: "Foot_ctrl.L_02"
                                        position: Qt.vector3d(0.329971, 0.572514, -0.161259)
                                        rotation: Qt.quaternion(0.707843, 0.706369, 0.00105111, -8.81282e-05)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: knee_IK_L_03
                                            objectName: "Knee_IK.L_03"
                                            position: Qt.vector3d(0.0443603, -0.523476, -0.897953)
                                            rotation: Qt.quaternion(0.00104483, -0.000151963, 0.749052, -0.66251)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: knee_IK_L_end_080
                                                objectName: "Knee_IK.L_end_080"
                                                position: Qt.vector3d(-5.55112e-17, 0.307957, 0)
                                                rotation: Qt.quaternion(1, -2.08167e-17, 2.11758e-22, 5.29396e-23)
                                            }
                                        }
                                        Node {
                                            id: heel_roll_L_04
                                            objectName: "Heel_roll.L_04"
                                            position: Qt.vector3d(-0.0289296, 0.142082, 0.0617939)
                                            rotation: Qt.quaternion(0.0325981, 0.0317067, 0.708727, -0.704015)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: toe_roll_L_05
                                                objectName: "Toe_roll.L_05"
                                                position: Qt.vector3d(-0.00262734, 0.231428, -0.00165388)
                                                rotation: Qt.quaternion(-0.0115966, 0.000719583, 0.00778523, 0.999902)
                                                scale: Qt.vector3d(1.00002, 1, 1.00001)
                                                Node {
                                                    id: foot_IK_L_06
                                                    objectName: "Foot_IK.L_06"
                                                    position: Qt.vector3d(0.0245554, 0.169785, 0.141681)
                                                    rotation: Qt.quaternion(-0.33812, 0.938788, -0.0642192, 0.0151012)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: foot_IK_L_end_079
                                                        objectName: "Foot_IK.L_end_079"
                                                        position: Qt.vector3d(0, 0.222494, 0)
                                                        rotation: Qt.quaternion(1, -2.77556e-17, 8.67362e-19, 2.60209e-18)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: footRoll_crtl_L_07
                                            objectName: "FootRoll_crtl.L_07"
                                            position: Qt.vector3d(-0.0289296, 0.142082, 0.0617939)
                                            rotation: Qt.quaternion(0.703579, 0.70782, -0.0440798, 0.0449887)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: footRoll_crtl_L_end_084
                                                objectName: "FootRoll_crtl.L_end_084"
                                                position: Qt.vector3d(5.55112e-17, 0.231363, -3.46945e-18)
                                                rotation: Qt.quaternion(1, 3.75676e-37, 2.71051e-20, -1.386e-17)
                                            }
                                        }
                                    }
                                    Node {
                                        id: hips_ctrl_08
                                        objectName: "Hips_ctrl_08"
                                        position: Qt.vector3d(0.00450861, 0.250581, -1.26771)
                                        rotation: Qt.quaternion(0.312656, 0.654835, -0.34426, -0.595754)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: spine_1_09
                                            objectName: "spine_1_09"
                                            position: Qt.vector3d(-1.73459e-08, 0.337592, -7.39237e-09)
                                            rotation: Qt.quaternion(1.30639e-08, -0.706801, -4.79786e-08, 0.707412)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: spine_2_010
                                                objectName: "spine_2_010"
                                                position: Qt.vector3d(-3.74264e-09, 0.337592, -2.59606e-08)
                                                rotation: Qt.quaternion(0.998126, -0.0556279, -0.0158056, -0.0199877)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: spine_3_011
                                                    objectName: "spine_3_011"
                                                    position: Qt.vector3d(-1.30967e-09, 0.268445, 3.46918e-08)
                                                    rotation: Qt.quaternion(0.994207, 0.0792072, 0.0473798, 0.0550747)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: spine_4_012
                                                        objectName: "spine_4_012"
                                                        position: Qt.vector3d(-6.98492e-10, 0.257106, -2.32831e-10)
                                                        rotation: Qt.quaternion(0.968209, 0.249396, 0.00879986, -0.0171973)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: spine_5_013
                                                            objectName: "spine_5_013"
                                                            position: Qt.vector3d(-3.46945e-18, 0.290255, -3.43425e-09)
                                                            rotation: Qt.quaternion(0.981766, 0.19008, -0.00203321, -1.53319e-05)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: neck_014
                                                                objectName: "Neck_014"
                                                                position: Qt.vector3d(9.31323e-10, 0.326276, -3.46336e-08)
                                                                rotation: Qt.quaternion(0.991557, 0.129485, -0.00612314, 0.00321623)
                                                                Node {
                                                                    id: head_015
                                                                    objectName: "Head_015"
                                                                    position: Qt.vector3d(-7.45058e-09, 0.162453, 2.07685e-07)
                                                                    rotation: Qt.quaternion(0.997283, 0.0687997, 0.0191389, 0.0180835)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: jaw_016
                                                                        objectName: "Jaw_016"
                                                                        position: Qt.vector3d(1.92824e-07, 0.0708072, 0.087866)
                                                                        rotation: Qt.quaternion(0.974823, 0.222978, -1.12529e-08, -4.70271e-07)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: jaw_end_072
                                                                            objectName: "Jaw_end_072"
                                                                            position: Qt.vector3d(0, 0.289414, 0)
                                                                            rotation: Qt.quaternion(1, 2.77556e-17, 1.05879e-22, -2.93874e-39)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            Node {
                                                                id: clavicle_L_017
                                                                objectName: "Clavicle.L_017"
                                                                position: Qt.vector3d(0.0250847, 0.219916, 0.251006)
                                                                rotation: Qt.quaternion(0.531511, -0.642791, -0.284013, -0.472919)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: upper_arm_L_018
                                                                    objectName: "Upper_arm.L_018"
                                                                    position: Qt.vector3d(0.10807, 0.342587, -0.0429481)
                                                                    rotation: Qt.quaternion(0.695526, -0.130001, 0.347079, -0.615531)
                                                                    scale: Qt.vector3d(1, 0.999999, 1)
                                                                    Node {
                                                                        id: bottom_arm_L_019
                                                                        objectName: "Bottom_arm.L_019"
                                                                        position: Qt.vector3d(-8.34334e-08, 0.57105, 3.86499e-08)
                                                                        rotation: Qt.quaternion(0.444562, 0.888205, -0.0382039, -0.109529)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_L_020
                                                                            objectName: "Hand.L_020"
                                                                            position: Qt.vector3d(-2.79397e-08, 0.581613, -7.45058e-09)
                                                                            rotation: Qt.quaternion(0.769731, -0.152751, -0.594844, 0.174187)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: finger1_1_L_021
                                                                                objectName: "finger1_1.L_021"
                                                                                position: Qt.vector3d(0.0448482, 0.180426, -0.00334297)
                                                                                rotation: Qt.quaternion(0.719968, -0.153789, 0.624319, -0.261191)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger1_2_L_022
                                                                                    objectName: "finger1_2.L_022"
                                                                                    position: Qt.vector3d(7.45058e-09, 0.102307, 0)
                                                                                    rotation: Qt.quaternion(0.930089, -0.0555242, 0.0885909, -0.352141)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger1_3_L_023
                                                                                        objectName: "finger1_3.L_023"
                                                                                        position: Qt.vector3d(5.96046e-08, 0.080513, 0)
                                                                                        rotation: Qt.quaternion(0.750323, 0.195564, 0.601925, -0.190935)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger1_3_L_end_073
                                                                                            objectName: "finger1_3.L_end_073"
                                                                                            position: Qt.vector3d(0, 0.0758256, 0)
                                                                                            rotation: Qt.quaternion(1, 1.54074e-33, 2.77556e-17, -5.55112e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: thumb_1_L_024
                                                                                objectName: "Thumb_1.L_024"
                                                                                position: Qt.vector3d(0.0307034, 0.0732474, -0.00207986)
                                                                                rotation: Qt.quaternion(-0.184772, 0.391387, 0.866881, -0.247373)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: thumb_2_L_025
                                                                                    objectName: "Thumb_2.L_025"
                                                                                    position: Qt.vector3d(1.49012e-08, 0.124244, -3.72529e-08)
                                                                                    rotation: Qt.quaternion(0.0998198, 0.200142, 0.905458, 0.360729)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: thumb_2_L_end_078
                                                                                        objectName: "Thumb_2.L_end_078"
                                                                                        position: Qt.vector3d(0, 0.129705, 1.11022e-16)
                                                                                        rotation: Qt.quaternion(1, 0, -1.38778e-17, 0)
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: finger2_1_L_026
                                                                                objectName: "finger2_1.L_026"
                                                                                position: Qt.vector3d(0.00198096, 0.191568, 0.00187263)
                                                                                rotation: Qt.quaternion(0.681994, -0.240059, 0.640918, -0.257836)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger2_2_L_027
                                                                                    objectName: "finger2_2.L_027"
                                                                                    position: Qt.vector3d(7.82311e-08, 0.0995623, 0)
                                                                                    rotation: Qt.quaternion(0.966925, -0.00441449, 0.0291308, -0.253354)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger2_3_L_028
                                                                                        objectName: "finger2_3.L_028"
                                                                                        position: Qt.vector3d(2.42144e-08, 0.0836797, -3.72529e-09)
                                                                                        rotation: Qt.quaternion(0.728368, 0.220874, 0.632271, -0.144667)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger2_3_L_end_082
                                                                                            objectName: "finger2_3.L_end_082"
                                                                                            position: Qt.vector3d(0, 0.0867911, 1.11022e-16)
                                                                                            rotation: Qt.quaternion(1, 6.93889e-18, -1.44445e-34, -2.08167e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: finger3_1_L_029
                                                                                objectName: "finger3_1.L_029"
                                                                                position: Qt.vector3d(-0.03829, 0.183142, -0.00717604)
                                                                                rotation: Qt.quaternion(0.642152, -0.324604, 0.652168, -0.238641)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger3_2_L_030
                                                                                    objectName: "finger3_2.L_030"
                                                                                    position: Qt.vector3d(4.47035e-08, 0.0892324, -7.45058e-09)
                                                                                    rotation: Qt.quaternion(0.934089, 0.0432041, 0.089556, -0.342916)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger3_3_L_031
                                                                                        objectName: "finger3_3.L_031"
                                                                                        position: Qt.vector3d(5.02914e-08, 0.0713815, 2.42144e-08)
                                                                                        rotation: Qt.quaternion(0.699444, 0.259159, 0.645259, -0.165096)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger3_3_L_end_076
                                                                                            objectName: "finger3_3.L_end_076"
                                                                                            position: Qt.vector3d(0, 0.0799543, 0)
                                                                                            rotation: Qt.quaternion(1, 3.81639e-17, 8.32667e-17, -1.38778e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: finger4_1_L_032
                                                                                objectName: "finger4_1.L_032"
                                                                                position: Qt.vector3d(-0.0718096, 0.171026, -0.0172637)
                                                                                rotation: Qt.quaternion(0.525741, -0.41235, 0.672614, -0.318048)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger4_2_L_00
                                                                                    objectName: "finger4_2.L_00"
                                                                                    position: Qt.vector3d(-3.07336e-08, 0.0776407, -1.11759e-08)
                                                                                    rotation: Qt.quaternion(0.939697, 0.12165, 0.136839, -0.28887)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger4_3_L_033
                                                                                        objectName: "finger4_3.L_033"
                                                                                        position: Qt.vector3d(5.40167e-08, 0.0712014, -3.72529e-09)
                                                                                        rotation: Qt.quaternion(0.668055, 0.418338, 0.612408, -0.0604349)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger4_3_L_end_090
                                                                                            objectName: "finger4_3.L_end_090"
                                                                                            position: Qt.vector3d(2.22045e-16, 0.0783904, -5.55112e-17)
                                                                                            rotation: Qt.quaternion(1, 6.93889e-17, -3.85186e-33, -5.55112e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            Node {
                                                                id: clavicle_R_034
                                                                objectName: "Clavicle.R_034"
                                                                position: Qt.vector3d(-0.0250862, 0.219916, 0.251006)
                                                                rotation: Qt.quaternion(0.553295, -0.673292, 0.245363, 0.424664)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: upper_arm_R_035
                                                                    objectName: "Upper_arm.R_035"
                                                                    position: Qt.vector3d(-0.10807, 0.342587, -0.042948)
                                                                    rotation: Qt.quaternion(0.852243, -0.150972, -0.111931, 0.488223)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: bottom_arm_R_036
                                                                        objectName: "Bottom_arm.R_036"
                                                                        position: Qt.vector3d(1.30385e-07, 0.57105, 6.70552e-08)
                                                                        rotation: Qt.quaternion(0.381486, 0.916848, 0.0327834, 0.113062)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_R_037
                                                                            objectName: "Hand.R_037"
                                                                            position: Qt.vector3d(3.35276e-08, 0.581613, -1.04308e-07)
                                                                            rotation: Qt.quaternion(0.743009, -0.170024, 0.611433, -0.212553)
                                                                            scale: Qt.vector3d(1, 1, 1)
                                                                            Node {
                                                                                id: finger1_1_R_038
                                                                                objectName: "finger1_1.R_038"
                                                                                position: Qt.vector3d(-0.0448483, 0.180426, -0.00334305)
                                                                                rotation: Qt.quaternion(0.719968, -0.153789, -0.624319, 0.261191)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger1_2_R_039
                                                                                    objectName: "finger1_2.R_039"
                                                                                    position: Qt.vector3d(2.98023e-08, 0.102307, 4.47035e-08)
                                                                                    rotation: Qt.quaternion(0.930089, -0.0555242, -0.0885909, 0.352141)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger1_3_R_040
                                                                                        objectName: "finger1_3.R_040"
                                                                                        position: Qt.vector3d(-1.19209e-07, 0.0805131, 7.45058e-09)
                                                                                        rotation: Qt.quaternion(0.750323, 0.195564, -0.601925, 0.190936)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger1_3_R_end_075
                                                                                            objectName: "finger1_3.R_end_075"
                                                                                            position: Qt.vector3d(0, 0.0758256, -3.33067e-16)
                                                                                            rotation: Qt.quaternion(1, -3.85186e-34, 1.38778e-17, 2.77556e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: thumb_1_R_041
                                                                                objectName: "Thumb_1.R_041"
                                                                                position: Qt.vector3d(-0.0307034, 0.0732474, -0.00207984)
                                                                                rotation: Qt.quaternion(0.184771, -0.391387, 0.866881, -0.247373)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: thumb_2_R_042
                                                                                    objectName: "Thumb_2.R_042"
                                                                                    position: Qt.vector3d(5.96046e-08, 0.124244, 8.9407e-08)
                                                                                    rotation: Qt.quaternion(-0.0998206, -0.200142, 0.905458, 0.360729)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: thumb_2_R_end_087
                                                                                        objectName: "Thumb_2.R_end_087"
                                                                                        position: Qt.vector3d(0, 0.129705, 0)
                                                                                        rotation: Qt.quaternion(1, 2.77556e-17, -6.93889e-18, 1.92593e-34)
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: finger2_1_R_043
                                                                                objectName: "finger2_1.R_043"
                                                                                position: Qt.vector3d(-0.00198101, 0.191568, 0.0018726)
                                                                                rotation: Qt.quaternion(0.681994, -0.240059, -0.640918, 0.257836)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger2_2_R_044
                                                                                    objectName: "finger2_2.R_044"
                                                                                    position: Qt.vector3d(-1.19209e-07, 0.0995623, -1.49012e-08)
                                                                                    rotation: Qt.quaternion(0.966925, -0.00441454, -0.0291309, 0.253354)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger2_3_R_045
                                                                                        objectName: "finger2_3.R_045"
                                                                                        position: Qt.vector3d(7.45058e-09, 0.0836796, -1.21072e-07)
                                                                                        rotation: Qt.quaternion(0.728368, 0.220874, -0.632271, 0.144667)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger2_3_R_end_086
                                                                                            objectName: "finger2_3.R_end_086"
                                                                                            position: Qt.vector3d(-2.22045e-16, 0.0867911, 0)
                                                                                            rotation: Qt.quaternion(1, -1.38778e-17, 1.38778e-17, -5.55112e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: finger3_1_R_046
                                                                                objectName: "finger3_1.R_046"
                                                                                position: Qt.vector3d(0.03829, 0.183142, -0.00717606)
                                                                                rotation: Qt.quaternion(0.642152, -0.324604, -0.652168, 0.238641)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger3_2_R_047
                                                                                    objectName: "finger3_2.R_047"
                                                                                    position: Qt.vector3d(-8.9407e-08, 0.0892324, -5.96046e-08)
                                                                                    rotation: Qt.quaternion(0.934089, 0.0432041, -0.089556, 0.342916)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger3_3_R_048
                                                                                        objectName: "finger3_3.R_048"
                                                                                        position: Qt.vector3d(-1.93249e-08, 0.0713814, -5.96046e-08)
                                                                                        rotation: Qt.quaternion(0.699444, 0.259159, -0.645259, 0.165096)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger3_3_R_end_081
                                                                                            objectName: "finger3_3.R_end_081"
                                                                                            position: Qt.vector3d(0, 0.0799543, 1.11022e-16)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            Node {
                                                                                id: finger4_1_R_049
                                                                                objectName: "finger4_1.R_049"
                                                                                position: Qt.vector3d(0.0718096, 0.171026, -0.0172637)
                                                                                rotation: Qt.quaternion(0.525741, -0.41235, -0.672614, 0.318048)
                                                                                scale: Qt.vector3d(1, 1, 1)
                                                                                Node {
                                                                                    id: finger4_2_R_050
                                                                                    objectName: "finger4_2.R_050"
                                                                                    position: Qt.vector3d(1.49012e-08, 0.0776406, -5.96046e-08)
                                                                                    rotation: Qt.quaternion(0.939697, 0.12165, -0.136839, 0.28887)
                                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                                    Node {
                                                                                        id: finger4_3_R_051
                                                                                        objectName: "finger4_3.R_051"
                                                                                        position: Qt.vector3d(1.37486e-07, 0.0712013, 1.11022e-16)
                                                                                        rotation: Qt.quaternion(0.668055, 0.418338, -0.612408, 0.060435)
                                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                                        Node {
                                                                                            id: finger4_3_R_end_085
                                                                                            objectName: "finger4_3.R_end_085"
                                                                                            position: Qt.vector3d(0, 0.0783904, -5.55112e-17)
                                                                                            rotation: Qt.quaternion(1, -6.93889e-17, 1.92593e-33, -2.77556e-17)
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: upper_leg_L_052
                                                objectName: "Upper_leg.L_052"
                                                position: Qt.vector3d(0.15049, 0.113515, -0.0517598)
                                                rotation: Qt.quaternion(-0.159477, 0.0632811, 0.722345, 0.669911)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: bottom_low_leg_L_053
                                                    objectName: "Bottom_low_leg.L_053"
                                                    position: Qt.vector3d(5.02914e-08, 0.703315, -1.58325e-08)
                                                    rotation: Qt.quaternion(-0.0163105, 0.0988602, 0.82234, -0.560105)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: foot_L_054
                                                        objectName: "Foot.L_054"
                                                        position: Qt.vector3d(-2.23517e-08, 0.602789, -1.86265e-08)
                                                        rotation: Qt.quaternion(0.872019, -0.486632, 0.0385731, 0.0358389)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: toe_L_055
                                                            objectName: "Toe.L_055"
                                                            position: Qt.vector3d(-2.18861e-08, 0.222495, 1.79825e-08)
                                                            rotation: Qt.quaternion(0.0137578, 0.0647328, 0.948742, -0.309045)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: toe_L_end_071
                                                                objectName: "Toe.L_end_071"
                                                                position: Qt.vector3d(-5.55112e-17, 0.149192, 6.93889e-18)
                                                                rotation: Qt.quaternion(1, -8.27548e-36, -8.67362e-19, -9.54098e-18)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: upper_leg_R_056
                                                objectName: "Upper_leg.R_056"
                                                position: Qt.vector3d(-0.15049, 0.113515, -0.0517599)
                                                rotation: Qt.quaternion(0.0779, -0.0886879, 0.64622, 0.753967)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: bottom_low_leg_R_057
                                                    objectName: "Bottom_low_leg.R_057"
                                                    position: Qt.vector3d(-1.00583e-07, 0.703315, -4.00469e-08)
                                                    rotation: Qt.quaternion(0.0151121, -0.11254, 0.761948, -0.637606)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: foot_R_058
                                                        objectName: "Foot.R_058"
                                                        position: Qt.vector3d(5.12227e-09, 0.602789, -3.35276e-08)
                                                        rotation: Qt.quaternion(0.757373, -0.64837, -0.0735503, -0.0243398)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: toe_R_059
                                                            objectName: "Toe.R_059"
                                                            position: Qt.vector3d(1.44178e-08, 0.222494, -2.15041e-08)
                                                            rotation: Qt.quaternion(-0.0137567, -0.0647339, 0.948742, -0.309045)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: toe_R_end_074
                                                                objectName: "Toe.R_end_074"
                                                                position: Qt.vector3d(5.55112e-17, 0.149192, -6.93889e-18)
                                                                rotation: Qt.quaternion(1, -6.93889e-18, -8.67362e-19, -6.17995e-18)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Node {
                                        id: hand_IK_L_060
                                        objectName: "Hand_IK.L_060"
                                        position: Qt.vector3d(0.579554, 1.01, -1.15383)
                                        rotation: Qt.quaternion(0.0102664, 0.999937, -0.00434687, -0.00126118)
                                        scale: Qt.vector3d(0.999985, 1, 0.999111)
                                        Node {
                                            id: elbow_IK_L_061
                                            objectName: "Elbow_IK.L_061"
                                            position: Qt.vector3d(0.237893, 1.0348, -0.112731)
                                            rotation: Qt.quaternion(0.995867, -0.0886243, -0.0142791, 0.0138147)
                                            scale: Qt.vector3d(1.26455, 1.26455, 1.26455)
                                            Node {
                                                id: elbow_IK_L_end_070
                                                objectName: "Elbow_IK.L_end_070"
                                                position: Qt.vector3d(1.11022e-16, 0.238076, 0)
                                                rotation: Qt.quaternion(1, 1.38778e-17, -3.46945e-18, 1.73472e-18)
                                            }
                                        }
                                    }
                                    Node {
                                        id: hand_IK_R_062
                                        objectName: "Hand_IK.R_062"
                                        position: Qt.vector3d(-0.612424, 1.15167, -1.52682)
                                        rotation: Qt.quaternion(0.0102445, 0.999943, -0.00265445, 0.00133291)
                                        scale: Qt.vector3d(1, 1, 1.00021)
                                        Node {
                                            id: elbow_IK_R_063
                                            objectName: "Elbow_IK.R_063"
                                            position: Qt.vector3d(0.0556001, 1.14196, 0.0822593)
                                            rotation: Qt.quaternion(0.995876, -0.0885261, 0.0142765, -0.0138131)
                                            scale: Qt.vector3d(1.26455, 1.26455, 1.26455)
                                            Node {
                                                id: elbow_IK_R_end_089
                                                objectName: "Elbow_IK.R_end_089"
                                                position: Qt.vector3d(0, 0.238076, 0)
                                                rotation: Qt.quaternion(1, 0, 0, 3.90313e-18)
                                            }
                                        }
                                    }
                                    Node {
                                        id: foot_ctrl_R_064
                                        objectName: "Foot_ctrl.R_064"
                                        position: Qt.vector3d(-0.329971, 0.260607, -0.161259)
                                        rotation: Qt.quaternion(0.707843, 0.706369, -0.0010514, 8.83671e-05)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: knee_IK_R_065
                                            objectName: "Knee_IK.R_065"
                                            position: Qt.vector3d(-0.0443603, -0.523476, -0.897953)
                                            rotation: Qt.quaternion(-0.00104483, 0.000151963, 0.749053, -0.66251)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: knee_IK_R_end_083
                                                objectName: "Knee_IK.R_end_083"
                                                position: Qt.vector3d(-5.55112e-17, 0.307957, 0)
                                                rotation: Qt.quaternion(1, -6.93889e-18, 0, 0)
                                            }
                                        }
                                        Node {
                                            id: heel_roll_R_066
                                            objectName: "Heel_roll.R_066"
                                            position: Qt.vector3d(0.0289296, 0.142082, 0.0617939)
                                            rotation: Qt.quaternion(-0.0325981, -0.0317067, 0.708727, -0.704015)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: toe_roll_R_067
                                                objectName: "Toe_roll.R_067"
                                                position: Qt.vector3d(0.00262733, 0.231428, -0.00165389)
                                                rotation: Qt.quaternion(0.011594, -0.000719603, 0.00778009, 0.999902)
                                                scale: Qt.vector3d(1.00002, 1, 1.00001)
                                                Node {
                                                    id: foot_IK_R_068
                                                    objectName: "Foot_IK.R_068"
                                                    position: Qt.vector3d(-0.0245554, 0.169785, 0.141681)
                                                    rotation: Qt.quaternion(-0.33812, 0.938788, 0.0642194, -0.0151012)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: foot_IK_R_end_088
                                                        objectName: "Foot_IK.R_end_088"
                                                        position: Qt.vector3d(0, 0.222494, -6.93889e-18)
                                                        rotation: Qt.quaternion(1, 5.55112e-17, -9.62965e-35, -1.73472e-18)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: footRoll_crtl_R_069
                                            objectName: "FootRoll_crtl.R_069"
                                            position: Qt.vector3d(0.0289296, 0.142082, 0.0617939)
                                            rotation: Qt.quaternion(0.703579, 0.70782, 0.0440798, -0.0449887)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: footRoll_crtl_R_end_077
                                                objectName: "FootRoll_crtl.R_end_077"
                                                position: Qt.vector3d(0, 0.231363, 0)
                                                rotation: Qt.quaternion(1, -2.1684e-19, -1.04968e-36, 4.84079e-18)
                                            }
                                        }
                                    }
                                }
                            }
                            Model {
                                id: object_99
                                objectName: "Object_99"
                                source: "meshes/horror1_LP_Horror1_0_mesh.mesh"
                                skin: skin
                                materials: [
                                    horror1_material
                                ]
                            }
                            Node {
                                id: object_98
                                objectName: "Object_98"
                                position: Qt.vector3d(6.42884e-16, -3.33067e-16, 8.58688e-17)
                                rotation: Qt.quaternion(1, -3.77017e-23, -1.05879e-22, -1.28091e-21)
                            }
                        }
                    }
                    Node {
                        id: horror1_LP
                        objectName: "Horror1_LP"
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: creature_armature_attack_1_timeline
        objectName: "Creature_armature|attack_1"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 834
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 834
            from: 0
            to: 834
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: bottom_arm_L_019
            property: "rotation"
            keyframeSource: "animations/bottom_arm_L_019_rotation_0.qad"
        }
        KeyframeGroup {
            target: foot_L_054
            property: "rotation"
            keyframeSource: "animations/foot_L_054_rotation_0.qad"
        }
        KeyframeGroup {
            target: knee_IK_L_03
            property: "position"
            keyframeSource: "animations/knee_IK_L_03_position_0.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_018
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_018_rotation_0.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "position"
            keyframeSource: "animations/hips_ctrl_08_position_0.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "rotation"
            keyframeSource: "animations/hips_ctrl_08_rotation_0.qad"
        }
        KeyframeGroup {
            target: jaw_016
            property: "rotation"
            keyframeSource: "animations/jaw_016_rotation_0.qad"
        }
        KeyframeGroup {
            target: clavicle_L_017
            property: "rotation"
            keyframeSource: "animations/clavicle_L_017_rotation_0.qad"
        }
        KeyframeGroup {
            target: head_015
            property: "rotation"
            keyframeSource: "animations/head_015_rotation_0.qad"
        }
        KeyframeGroup {
            target: elbow_IK_L_061
            property: "position"
            keyframeSource: "animations/elbow_IK_L_061_position_0.qad"
        }
        KeyframeGroup {
            target: neck_014
            property: "rotation"
            keyframeSource: "animations/neck_014_rotation_0.qad"
        }
        KeyframeGroup {
            target: hand_L_020
            property: "rotation"
            keyframeSource: "animations/hand_L_020_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger1_3_R_040
            property: "rotation"
            keyframeSource: "animations/finger1_3_R_040_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger1_2_R_039
            property: "rotation"
            keyframeSource: "animations/finger1_2_R_039_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger1_1_R_038
            property: "rotation"
            keyframeSource: "animations/finger1_1_R_038_rotation_0.qad"
        }
        KeyframeGroup {
            target: thumb_2_R_042
            property: "rotation"
            keyframeSource: "animations/thumb_2_R_042_rotation_0.qad"
        }
        KeyframeGroup {
            target: thumb_1_R_041
            property: "rotation"
            keyframeSource: "animations/thumb_1_R_041_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger2_3_R_045
            property: "rotation"
            keyframeSource: "animations/finger2_3_R_045_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger2_2_R_044
            property: "rotation"
            keyframeSource: "animations/finger2_2_R_044_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger2_1_R_043
            property: "rotation"
            keyframeSource: "animations/finger2_1_R_043_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger3_3_R_048
            property: "rotation"
            keyframeSource: "animations/finger3_3_R_048_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger3_2_R_047
            property: "rotation"
            keyframeSource: "animations/finger3_2_R_047_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger3_1_R_046
            property: "rotation"
            keyframeSource: "animations/finger3_1_R_046_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger4_3_R_051
            property: "rotation"
            keyframeSource: "animations/finger4_3_R_051_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger4_2_R_050
            property: "rotation"
            keyframeSource: "animations/finger4_2_R_050_rotation_0.qad"
        }
        KeyframeGroup {
            target: finger4_1_R_049
            property: "rotation"
            keyframeSource: "animations/finger4_1_R_049_rotation_0.qad"
        }
        KeyframeGroup {
            target: hand_R_037
            property: "rotation"
            keyframeSource: "animations/hand_R_037_rotation_0.qad"
        }
        KeyframeGroup {
            target: bottom_arm_R_036
            property: "rotation"
            keyframeSource: "animations/bottom_arm_R_036_rotation_0.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_035
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_035_rotation_0.qad"
        }
        KeyframeGroup {
            target: clavicle_R_034
            property: "rotation"
            keyframeSource: "animations/clavicle_R_034_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_5_013
            property: "rotation"
            keyframeSource: "animations/spine_5_013_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_4_012
            property: "rotation"
            keyframeSource: "animations/spine_4_012_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_3_011
            property: "rotation"
            keyframeSource: "animations/spine_3_011_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_2_010
            property: "rotation"
            keyframeSource: "animations/spine_2_010_rotation_0.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_L_053
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_L_053_rotation_0.qad"
        }
        KeyframeGroup {
            target: upper_leg_L_052
            property: "rotation"
            keyframeSource: "animations/upper_leg_L_052_rotation_0.qad"
        }
        KeyframeGroup {
            target: foot_R_058
            property: "rotation"
            keyframeSource: "animations/foot_R_058_rotation_0.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_R_057
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_R_057_rotation_0.qad"
        }
        KeyframeGroup {
            target: upper_leg_R_056
            property: "rotation"
            keyframeSource: "animations/upper_leg_R_056_rotation_0.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "position"
            keyframeSource: "animations/hand_IK_L_060_position_0.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "rotation"
            keyframeSource: "animations/hand_IK_L_060_rotation_0.qad"
        }
        KeyframeGroup {
            target: elbow_IK_R_063
            property: "position"
            keyframeSource: "animations/elbow_IK_R_063_position_0.qad"
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "position"
            keyframeSource: "animations/hand_IK_R_062_position_0.qad"
        }
        KeyframeGroup {
            target: knee_IK_R_065
            property: "position"
            keyframeSource: "animations/knee_IK_R_065_position_0.qad"
        }
    }
    Timeline {
        id: creature_armature_death_1_timeline
        objectName: "Creature_armature|death_1"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1334
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 1334
            from: 0
            to: 1334
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: foot_L_054
            property: "rotation"
            keyframeSource: "animations/foot_L_054_rotation_1.qad"
        }
        KeyframeGroup {
            target: knee_IK_L_03
            property: "position"
            keyframeSource: "animations/knee_IK_L_03_position_1.qad"
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "position"
            keyframeSource: "animations/hand_IK_R_062_position_1.qad"
        }
        KeyframeGroup {
            target: finger1_1_L_021
            property: "rotation"
            keyframeSource: "animations/finger1_1_L_021_rotation_1.qad"
        }
        KeyframeGroup {
            target: upper_leg_R_056
            property: "rotation"
            keyframeSource: "animations/upper_leg_R_056_rotation_1.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_L_02
            property: "position"
            keyframeSource: "animations/foot_ctrl_L_02_position_1.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_L_02
            property: "rotation"
            keyframeSource: "animations/foot_ctrl_L_02_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "position"
            keyframeSource: "animations/hips_ctrl_08_position_1.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "rotation"
            keyframeSource: "animations/hips_ctrl_08_rotation_1.qad"
        }
        KeyframeGroup {
            target: jaw_016
            property: "rotation"
            keyframeSource: "animations/jaw_016_rotation_1.qad"
        }
        KeyframeGroup {
            target: head_015
            property: "rotation"
            keyframeSource: "animations/head_015_rotation_1.qad"
        }
        KeyframeGroup {
            target: elbow_IK_L_061
            property: "position"
            keyframeSource: "animations/elbow_IK_L_061_position_1.qad"
        }
        KeyframeGroup {
            target: neck_014
            property: "rotation"
            keyframeSource: "animations/neck_014_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger1_3_L_023
            property: "rotation"
            keyframeSource: "animations/finger1_3_L_023_rotation_1.qad"
        }
        KeyframeGroup {
            target: elbow_IK_R_063
            property: "position"
            keyframeSource: "animations/elbow_IK_R_063_position_1.qad"
        }
        KeyframeGroup {
            target: finger1_2_L_022
            property: "rotation"
            keyframeSource: "animations/finger1_2_L_022_rotation_1.qad"
        }
        KeyframeGroup {
            target: knee_IK_R_065
            property: "position"
            keyframeSource: "animations/knee_IK_R_065_position_1.qad"
        }
        KeyframeGroup {
            target: thumb_2_L_025
            property: "rotation"
            keyframeSource: "animations/thumb_2_L_025_rotation_1.qad"
        }
        KeyframeGroup {
            target: thumb_1_L_024
            property: "rotation"
            keyframeSource: "animations/thumb_1_L_024_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger2_3_L_028
            property: "rotation"
            keyframeSource: "animations/finger2_3_L_028_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger2_2_L_027
            property: "rotation"
            keyframeSource: "animations/finger2_2_L_027_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger2_1_L_026
            property: "rotation"
            keyframeSource: "animations/finger2_1_L_026_rotation_1.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_R_064
            property: "position"
            keyframeSource: "animations/foot_ctrl_R_064_position_1.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_R_064
            property: "rotation"
            keyframeSource: "animations/foot_ctrl_R_064_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger3_3_L_031
            property: "rotation"
            keyframeSource: "animations/finger3_3_L_031_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger3_2_L_030
            property: "rotation"
            keyframeSource: "animations/finger3_2_L_030_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger3_1_L_029
            property: "rotation"
            keyframeSource: "animations/finger3_1_L_029_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger4_3_L_033
            property: "rotation"
            keyframeSource: "animations/finger4_3_L_033_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger4_2_L_00
            property: "rotation"
            keyframeSource: "animations/finger4_2_L_00_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger4_1_L_032
            property: "rotation"
            keyframeSource: "animations/finger4_1_L_032_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_L_020
            property: "rotation"
            keyframeSource: "animations/hand_L_020_rotation_1.qad"
        }
        KeyframeGroup {
            target: bottom_arm_L_019
            property: "rotation"
            keyframeSource: "animations/bottom_arm_L_019_rotation_1.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_018
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_018_rotation_1.qad"
        }
        KeyframeGroup {
            target: clavicle_L_017
            property: "rotation"
            keyframeSource: "animations/clavicle_L_017_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger1_3_R_040
            property: "rotation"
            keyframeSource: "animations/finger1_3_R_040_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger1_2_R_039
            property: "rotation"
            keyframeSource: "animations/finger1_2_R_039_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger1_1_R_038
            property: "rotation"
            keyframeSource: "animations/finger1_1_R_038_rotation_1.qad"
        }
        KeyframeGroup {
            target: thumb_2_R_042
            property: "rotation"
            keyframeSource: "animations/thumb_2_R_042_rotation_1.qad"
        }
        KeyframeGroup {
            target: thumb_1_R_041
            property: "rotation"
            keyframeSource: "animations/thumb_1_R_041_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger2_3_R_045
            property: "rotation"
            keyframeSource: "animations/finger2_3_R_045_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger2_2_R_044
            property: "rotation"
            keyframeSource: "animations/finger2_2_R_044_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger2_1_R_043
            property: "rotation"
            keyframeSource: "animations/finger2_1_R_043_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger3_3_R_048
            property: "rotation"
            keyframeSource: "animations/finger3_3_R_048_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger3_2_R_047
            property: "rotation"
            keyframeSource: "animations/finger3_2_R_047_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger3_1_R_046
            property: "rotation"
            keyframeSource: "animations/finger3_1_R_046_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger4_3_R_051
            property: "rotation"
            keyframeSource: "animations/finger4_3_R_051_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger4_2_R_050
            property: "rotation"
            keyframeSource: "animations/finger4_2_R_050_rotation_1.qad"
        }
        KeyframeGroup {
            target: finger4_1_R_049
            property: "rotation"
            keyframeSource: "animations/finger4_1_R_049_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_037
            property: "rotation"
            keyframeSource: "animations/hand_R_037_rotation_1.qad"
        }
        KeyframeGroup {
            target: bottom_arm_R_036
            property: "rotation"
            keyframeSource: "animations/bottom_arm_R_036_rotation_1.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_035
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_035_rotation_1.qad"
        }
        KeyframeGroup {
            target: clavicle_R_034
            property: "rotation"
            keyframeSource: "animations/clavicle_R_034_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_5_013
            property: "rotation"
            keyframeSource: "animations/spine_5_013_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_4_012
            property: "rotation"
            keyframeSource: "animations/spine_4_012_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_3_011
            property: "rotation"
            keyframeSource: "animations/spine_3_011_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_2_010
            property: "rotation"
            keyframeSource: "animations/spine_2_010_rotation_1.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_L_053
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_L_053_rotation_1.qad"
        }
        KeyframeGroup {
            target: upper_leg_L_052
            property: "rotation"
            keyframeSource: "animations/upper_leg_L_052_rotation_1.qad"
        }
        KeyframeGroup {
            target: foot_R_058
            property: "rotation"
            keyframeSource: "animations/foot_R_058_rotation_1.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_R_057
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_R_057_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "position"
            keyframeSource: "animations/hand_IK_L_060_position_1.qad"
        }
    }
    Timeline {
        id: creature_armature_hit_1_timeline
        objectName: "Creature_armature|hit_1"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 625
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 625
            from: 0
            to: 625
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: upper_arm_L_018
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_018_rotation_2.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "position"
            keyframeSource: "animations/hips_ctrl_08_position_2.qad"
        }
        KeyframeGroup {
            target: jaw_016
            property: "rotation"
            keyframeSource: "animations/jaw_016_rotation_2.qad"
        }
        KeyframeGroup {
            target: clavicle_L_017
            property: "rotation"
            keyframeSource: "animations/clavicle_L_017_rotation_2.qad"
        }
        KeyframeGroup {
            target: head_015
            property: "rotation"
            keyframeSource: "animations/head_015_rotation_2.qad"
        }
        KeyframeGroup {
            target: elbow_IK_L_061
            property: "position"
            keyframeSource: "animations/elbow_IK_L_061_position_2.qad"
        }
        KeyframeGroup {
            target: neck_014
            property: "rotation"
            keyframeSource: "animations/neck_014_rotation_2.qad"
        }
        KeyframeGroup {
            target: hand_L_020
            property: "rotation"
            keyframeSource: "animations/hand_L_020_rotation_2.qad"
        }
        KeyframeGroup {
            target: bottom_arm_L_019
            property: "rotation"
            keyframeSource: "animations/bottom_arm_L_019_rotation_2.qad"
        }
        KeyframeGroup {
            target: hand_R_037
            property: "rotation"
            keyframeSource: "animations/hand_R_037_rotation_2.qad"
        }
        KeyframeGroup {
            target: bottom_arm_R_036
            property: "rotation"
            keyframeSource: "animations/bottom_arm_R_036_rotation_2.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_035
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_035_rotation_2.qad"
        }
        KeyframeGroup {
            target: clavicle_R_034
            property: "rotation"
            keyframeSource: "animations/clavicle_R_034_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_5_013
            property: "rotation"
            keyframeSource: "animations/spine_5_013_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_4_012
            property: "rotation"
            keyframeSource: "animations/spine_4_012_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_3_011
            property: "rotation"
            keyframeSource: "animations/spine_3_011_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_2_010
            property: "rotation"
            keyframeSource: "animations/spine_2_010_rotation_2.qad"
        }
        KeyframeGroup {
            target: foot_L_054
            property: "rotation"
            keyframeSource: "animations/foot_L_054_rotation_2.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_L_053
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_L_053_rotation_2.qad"
        }
        KeyframeGroup {
            target: upper_leg_L_052
            property: "rotation"
            keyframeSource: "animations/upper_leg_L_052_rotation_2.qad"
        }
        KeyframeGroup {
            target: foot_R_058
            property: "rotation"
            keyframeSource: "animations/foot_R_058_rotation_2.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_R_057
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_R_057_rotation_2.qad"
        }
        KeyframeGroup {
            target: upper_leg_R_056
            property: "rotation"
            keyframeSource: "animations/upper_leg_R_056_rotation_2.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "position"
            keyframeSource: "animations/hand_IK_L_060_position_2.qad"
        }
        KeyframeGroup {
            target: elbow_IK_R_063
            property: "position"
            keyframeSource: "animations/elbow_IK_R_063_position_2.qad"
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "position"
            keyframeSource: "animations/hand_IK_R_062_position_2.qad"
        }
    }
    Timeline {
        id: creature_armature_idle_timeline
        objectName: "Creature_armature|idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3334
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 3334
            from: 0
            to: 3334
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "position"
            keyframeSource: "animations/hand_IK_R_062_position_3.qad"
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-0.0237889, 0.998493, -0.0341567, 0.0357758)
            }
        }
        KeyframeGroup {
            target: finger1_1_L_021
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.69718, -0.29178, 0.551886, -0.352458)
            }
        }
        KeyframeGroup {
            target: upper_leg_R_056
            property: "rotation"
            keyframeSource: "animations/upper_leg_R_056_rotation_3.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_L_02
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.224699, 0.277285, -0.164696)
            }
        }
        KeyframeGroup {
            target: thumb_2_L_025
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-0.0835658, 0.281923, 0.803544, 0.517546)
            }
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "position"
            keyframeSource: "animations/hips_ctrl_08_position_3.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.422713, 0.577516, -0.460931, -0.52472)
            }
        }
        KeyframeGroup {
            target: jaw_016
            property: "rotation"
            keyframeSource: "animations/jaw_016_rotation_3.qad"
        }
        KeyframeGroup {
            target: head_015
            property: "rotation"
            keyframeSource: "animations/head_015_rotation_3.qad"
        }
        KeyframeGroup {
            target: elbow_IK_L_061
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.443265, 1.16492, 0.00724404)
            }
        }
        KeyframeGroup {
            target: neck_014
            property: "rotation"
            keyframeSource: "animations/neck_014_rotation_3.qad"
        }
        KeyframeGroup {
            target: finger1_3_L_023
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.74212, 0.31636, 0.511534, -0.295816)
            }
        }
        KeyframeGroup {
            target: elbow_IK_R_063
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.696734, 1.15939, -0.00828199)
            }
        }
        KeyframeGroup {
            target: finger1_2_L_022
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.822914, -0.128717, 0.143156, -0.534557)
            }
        }
        KeyframeGroup {
            target: thumb_1_L_024
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-0.340356, 0.407137, 0.758366, -0.378522)
            }
        }
        KeyframeGroup {
            target: finger2_3_L_028
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.702931, 0.369322, 0.560551, -0.235099)
            }
        }
        KeyframeGroup {
            target: finger2_2_L_027
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.907021, -0.00621093, -0.0103733, -0.420912)
            }
        }
        KeyframeGroup {
            target: finger2_1_L_026
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.652739, -0.348244, 0.581564, -0.338292)
            }
        }
        KeyframeGroup {
            target: foot_ctrl_R_064
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.224699, 0.277285, -0.164696)
            }
        }
        KeyframeGroup {
            target: finger3_3_L_031
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.63984, 0.425748, 0.570718, -0.28918)
            }
        }
        KeyframeGroup {
            target: finger3_2_L_030
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.815471, 0.0574187, 0.0726343, -0.571345)
            }
        }
        KeyframeGroup {
            target: finger3_1_L_029
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.625251, -0.406462, 0.576877, -0.333259)
            }
        }
        KeyframeGroup {
            target: finger4_3_L_033
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.574157, 0.619245, 0.50632, -0.1747)
            }
        }
        KeyframeGroup {
            target: finger4_2_L_00
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.889203, 0.151604, 0.146994, -0.405865)
            }
        }
        KeyframeGroup {
            target: finger4_1_L_032
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.499762, -0.476696, 0.549577, -0.470067)
            }
        }
        KeyframeGroup {
            target: hand_L_020
            property: "rotation"
            keyframeSource: "animations/hand_L_020_rotation_3.qad"
        }
        KeyframeGroup {
            target: bottom_arm_L_019
            property: "rotation"
            keyframeSource: "animations/bottom_arm_L_019_rotation_3.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_018
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_018_rotation_3.qad"
        }
        KeyframeGroup {
            target: clavicle_L_017
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-0.46987, 0.523364, 0.403905, 0.584956)
            }
        }
        KeyframeGroup {
            target: finger1_3_R_040
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.74212, 0.31636, -0.511534, 0.295816)
            }
        }
        KeyframeGroup {
            target: finger1_2_R_039
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.822914, -0.128717, -0.143157, 0.534557)
            }
        }
        KeyframeGroup {
            target: finger1_1_R_038
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.69718, -0.29178, -0.551886, 0.352458)
            }
        }
        KeyframeGroup {
            target: thumb_2_R_042
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.0835667, -0.281923, 0.803544, 0.517546)
            }
        }
        KeyframeGroup {
            target: thumb_1_R_041
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.340356, -0.407137, 0.758365, -0.378522)
            }
        }
        KeyframeGroup {
            target: finger2_3_R_045
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.702931, 0.369322, -0.560551, 0.235099)
            }
        }
        KeyframeGroup {
            target: finger2_2_R_044
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.907021, -0.00621096, 0.0103733, 0.420912)
            }
        }
        KeyframeGroup {
            target: finger2_1_R_043
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.652739, -0.348244, -0.581564, 0.338292)
            }
        }
        KeyframeGroup {
            target: finger3_3_R_048
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.63984, 0.425748, -0.570718, 0.28918)
            }
        }
        KeyframeGroup {
            target: finger3_2_R_047
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.815471, 0.0574187, -0.0726342, 0.571345)
            }
        }
        KeyframeGroup {
            target: finger3_1_R_046
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.625251, -0.406463, -0.576877, 0.333259)
            }
        }
        KeyframeGroup {
            target: finger4_3_R_051
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.574157, 0.619245, -0.50632, 0.1747)
            }
        }
        KeyframeGroup {
            target: finger4_2_R_050
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.889203, 0.151604, -0.146994, 0.405865)
            }
        }
        KeyframeGroup {
            target: finger4_1_R_049
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-0.499762, 0.476696, 0.549577, -0.470067)
            }
        }
        KeyframeGroup {
            target: hand_R_037
            property: "rotation"
            keyframeSource: "animations/hand_R_037_rotation_3.qad"
        }
        KeyframeGroup {
            target: bottom_arm_R_036
            property: "rotation"
            keyframeSource: "animations/bottom_arm_R_036_rotation_3.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_035
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_035_rotation_3.qad"
        }
        KeyframeGroup {
            target: clavicle_R_034
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.469872, -0.523365, 0.403904, 0.584954)
            }
        }
        KeyframeGroup {
            target: spine_5_013
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.965729, 0.259552, 7.49603e-07, 5.79767e-07)
            }
        }
        KeyframeGroup {
            target: spine_4_012
            property: "rotation"
            keyframeSource: "animations/spine_4_012_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_3_011
            property: "rotation"
            keyframeSource: "animations/spine_3_011_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_2_010
            property: "rotation"
            keyframeSource: "animations/spine_2_010_rotation_3.qad"
        }
        KeyframeGroup {
            target: foot_L_054
            property: "rotation"
            keyframeSource: "animations/foot_L_054_rotation_3.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_L_053
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_L_053_rotation_3.qad"
        }
        KeyframeGroup {
            target: upper_leg_L_052
            property: "rotation"
            keyframeSource: "animations/upper_leg_L_052_rotation_3.qad"
        }
        KeyframeGroup {
            target: foot_R_058
            property: "rotation"
            keyframeSource: "animations/foot_R_058_rotation_3.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_R_057
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_R_057_rotation_3.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "position"
            keyframeSource: "animations/hand_IK_L_060_position_3.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-0.0237685, 0.998681, -0.0312832, 0.0330584)
            }
        }
    }
    Timeline {
        id: creature_armature_Run_timeline
        objectName: "Creature_armature|Run"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 834
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 834
            from: 0
            to: 834
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: heel_roll_L_04
            property: "rotation"
            keyframeSource: "animations/heel_roll_L_04_rotation_4.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_R_057
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_R_057_rotation_4.qad"
        }
        KeyframeGroup {
            target: footRoll_crtl_L_07
            property: "rotation"
            keyframeSource: "animations/footRoll_crtl_L_07_rotation_4.qad"
        }
        KeyframeGroup {
            target: hand_L_020
            property: "rotation"
            keyframeSource: "animations/hand_L_020_rotation_4.qad"
        }
        KeyframeGroup {
            target: upper_leg_R_056
            property: "rotation"
            keyframeSource: "animations/upper_leg_R_056_rotation_4.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_L_02
            property: "position"
            keyframeSource: "animations/foot_ctrl_L_02_position_4.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_L_02
            property: "rotation"
            keyframeSource: "animations/foot_ctrl_L_02_rotation_4.qad"
        }
        KeyframeGroup {
            target: head_015
            property: "rotation"
            keyframeSource: "animations/head_015_rotation_4.qad"
        }
        KeyframeGroup {
            target: elbow_IK_L_061
            property: "position"
            keyframeSource: "animations/elbow_IK_L_061_position_4.qad"
        }
        KeyframeGroup {
            target: neck_014
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.96602, 0.258467, 8.80842e-07, 1.01066e-06)
            }
        }
        KeyframeGroup {
            target: bottom_arm_L_019
            property: "rotation"
            keyframeSource: "animations/bottom_arm_L_019_rotation_4.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_018
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_018_rotation_4.qad"
        }
        KeyframeGroup {
            target: clavicle_L_017
            property: "rotation"
            keyframeSource: "animations/clavicle_L_017_rotation_4.qad"
        }
        KeyframeGroup {
            target: hand_R_037
            property: "rotation"
            keyframeSource: "animations/hand_R_037_rotation_4.qad"
        }
        KeyframeGroup {
            target: bottom_arm_R_036
            property: "rotation"
            keyframeSource: "animations/bottom_arm_R_036_rotation_4.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_035
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_035_rotation_4.qad"
        }
        KeyframeGroup {
            target: clavicle_R_034
            property: "rotation"
            keyframeSource: "animations/clavicle_R_034_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_5_013
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973704, 0.227817, 7.5694e-07, 5.05981e-07)
            }
        }
        KeyframeGroup {
            target: spine_4_012
            property: "rotation"
            keyframeSource: "animations/spine_4_012_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_3_011
            property: "rotation"
            keyframeSource: "animations/spine_3_011_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_2_010
            property: "rotation"
            keyframeSource: "animations/spine_2_010_rotation_4.qad"
        }
        KeyframeGroup {
            target: foot_L_054
            property: "rotation"
            keyframeSource: "animations/foot_L_054_rotation_4.qad"
        }
        KeyframeGroup {
            target: bottom_low_leg_L_053
            property: "rotation"
            keyframeSource: "animations/bottom_low_leg_L_053_rotation_4.qad"
        }
        KeyframeGroup {
            target: upper_leg_L_052
            property: "rotation"
            keyframeSource: "animations/upper_leg_L_052_rotation_4.qad"
        }
        KeyframeGroup {
            target: foot_R_058
            property: "rotation"
            keyframeSource: "animations/foot_R_058_rotation_4.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "position"
            keyframeSource: "animations/hips_ctrl_08_position_4.qad"
        }
        KeyframeGroup {
            target: hips_ctrl_08
            property: "rotation"
            keyframeSource: "animations/hips_ctrl_08_rotation_4.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "position"
            keyframeSource: "animations/hand_IK_L_060_position_4.qad"
        }
        KeyframeGroup {
            target: hand_IK_L_060
            property: "rotation"
            keyframeSource: "animations/hand_IK_L_060_rotation_4.qad"
        }
        KeyframeGroup {
            target: elbow_IK_R_063
            property: "position"
            keyframeSource: "animations/elbow_IK_R_063_position_4.qad"
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "position"
            keyframeSource: "animations/hand_IK_R_062_position_4.qad"
        }
        KeyframeGroup {
            target: hand_IK_R_062
            property: "rotation"
            keyframeSource: "animations/hand_IK_R_062_rotation_4.qad"
        }
        KeyframeGroup {
            target: heel_roll_R_066
            property: "rotation"
            keyframeSource: "animations/heel_roll_R_066_rotation_4.qad"
        }
        KeyframeGroup {
            target: footRoll_crtl_R_069
            property: "rotation"
            keyframeSource: "animations/footRoll_crtl_R_069_rotation_4.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_R_064
            property: "position"
            keyframeSource: "animations/foot_ctrl_R_064_position_4.qad"
        }
        KeyframeGroup {
            target: foot_ctrl_R_064
            property: "rotation"
            keyframeSource: "animations/foot_ctrl_R_064_rotation_4.qad"
        }
    }
}
