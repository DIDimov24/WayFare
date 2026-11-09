import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: root
    objectName: "Root"

    // Resources
    Texture {
        id: textures_zombieBody_baseColor_png_texture
        objectName: "textures/zombieBody_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/zombieBody_baseColor.png"
    }
    Texture {
        id: textures_zombieBody_metallicRoughness_png_texture
        objectName: "textures/zombieBody_metallicRoughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/zombieBody_metallicRoughness.png"
    }
    Texture {
        id: textures_zombieBody_normal_png_texture
        objectName: "textures/zombieBody_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/zombieBody_normal.png"
    }
    PrincipledMaterial {
        id: zombieBody_material
        objectName: "zombieBody"
        baseColorMap: textures_zombieBody_baseColor_png_texture
        metalnessMap: textures_zombieBody_metallicRoughness_png_texture
        roughnessMap: textures_zombieBody_metallicRoughness_png_texture
        metalness: 0.7588225603103638
        roughness: 1
        normalMap: textures_zombieBody_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            _rootJoint,
            spine_01,
            spine_001_02,
            spine_002_03,
            spine_003_04,
            spine_004_00,
            spine_005_05,
            spine_006_06,
            mandibula_07,
            mandibula_end_042,
            shoulder_L_08,
            upper_arm_L_09,
            forearm_L_010,
            hand_L_011,
            hand_L_001_012,
            hand_L_002_013,
            hand_L_002_end_043,
            hand_L_003_014,
            hand_L_004_015,
            hand_L_004_end_044,
            hand_L_005_016,
            hand_L_006_017,
            hand_L_006_end_045,
            hand_L_007_018,
            hand_L_008_019,
            hand_L_008_end_046,
            shoulder_R_020,
            upper_arm_R_021,
            forearm_R_022,
            hand_R_023,
            hand_R_001_024,
            hand_R_002_025,
            hand_R_002_end_047,
            hand_R_003_026,
            hand_R_004_027,
            hand_R_004_end_048,
            hand_R_005_028,
            hand_R_006_029,
            hand_R_006_end_049,
            hand_R_007_030,
            hand_R_008_031,
            hand_R_008_end_050,
            pelvis_L_032,
            pelvis_L_end_051,
            pelvis_R_033,
            pelvis_R_end_052,
            thigh_L_034,
            shin_L_035,
            foot_L_036,
            toe_L_037,
            toe_L_end_053,
            thigh_R_038,
            shin_R_039,
            foot_R_040,
            toe_R_041,
            toe_R_end_054
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 3.64812e-08, -2.35721e-07, -2.11602e-07, -6.81459e-10, 0.989115, 0.147172, -5.12165, 2.38418e-07, -0.150063, 0.988672, 0.872207, 0, 0, 0, 1),
            Qt.matrix4x4(1, -7.21699e-16, -2.79954e-14, 5.19775e-15, -4.54278e-17, 0.999638, -0.0268848, -6.20059, 2.80043e-14, 0.0274248, 0.999624, -0.22959, 0, 0, 0, 1),
            Qt.matrix4x4(1, -1.67097e-08, -2.37855e-07, 1.25839e-07, 3.20513e-10, 0.997729, -0.0673635, -6.97375, 2.38418e-07, 0.0687111, 0.997636, -0.518196, 0, 0, 0, 1),
            Qt.matrix4x4(1, 3.58397e-15, 2.8422e-14, -2.66491e-14, -2.71622e-15, 0.999608, -0.0279979, -8.00766, -2.85107e-14, 0.0285602, 0.999592, -0.196535, 0, 0, 0, 1),
            Qt.matrix4x4(1, -2.64413e-08, 2.37005e-07, 2.22161e-07, 5.01889e-10, 0.994301, 0.106625, -9.20167, -2.38418e-07, -0.108743, 0.994067, 0.91184, 0, 0, 0, 1),
            Qt.matrix4x4(1, 1.58238e-08, -2.37913e-07, -1.15417e-07, -3.03747e-10, 0.997964, 0.0637907, -10.0699, 2.38418e-07, -0.0650674, 0.99788, 0.47097, 0, 0, 0, 1),
            Qt.matrix4x4(1, 1.44664e-08, 2.37996e-07, -2.16636e-07, -2.7796e-10, 0.998299, -0.0583173, -10.9381, -2.38418e-07, 0.0594853, 0.998228, -0.895566, 0, 0, 0, 1),
            Qt.matrix4x4(1, -5.5868e-07, -4.60049e-07, 6.78264e-06, -2.90198e-09, -0.646292, 0.763079, 6.27132, -7.1525e-07, -0.769388, -0.638795, 9.3471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.537123, 0.000296767, 0.843504, -0.554122, 0.842709, -0.0435817, -0.536602, 0.565483, 0.0358822, 0.999087, -0.0231935, -8.88648, 0, 0, 0, 1),
            Qt.matrix4x4(-0.166378, -0.983283, -0.0740663, 8.70732, 0.984954, -0.171577, 0.020394, 0.422965, -0.0327581, -0.0709502, 0.996941, 0.467845, 0, 0, 0, 1),
            Qt.matrix4x4(-0.149357, -0.986014, 0.074029, 8.65343, 0.986381, -0.156325, -0.0510459, -1.06076, 0.0618993, 0.0667056, 0.99585, -0.921255, 0, 0, 0, 1),
            Qt.matrix4x4(0.00422325, -0.999574, 0.0288708, 8.22233, 0.999891, 0.00388973, -0.0142473, -3.58637, 0.0141287, 0.0295088, 0.999464, -0.444934, 0, 0, 0, 1),
            Qt.matrix4x4(0.00330225, -0.999576, 0.0289198, 8.24316, 0.993543, -1.24404e-07, -0.113453, -3.96923, 0.113403, 0.0296922, 0.993105, -0.700585, 0, 0, 0, 1),
            Qt.matrix4x4(0.00263522, -0.999576, 0.0289882, 8.2459, 0.995893, -1.16032e-07, -0.0905374, -4.10435, 0.0904974, 0.0296922, 0.995454, -0.606181, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00169649, -0.999576, 0.0290582, 8.24749, 0.9983, -9.51426e-08, -0.0582865, -4.02818, 0.0582608, 0.0296922, 0.99786, -0.60424, 0, 0, 0, 1),
            Qt.matrix4x4(0.000572293, -0.999576, 0.0291021, 8.2522, 0.999807, -7.42842e-08, -0.0196637, -4.19263, 0.0196551, 0.0296922, 0.999365, -0.442435, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.105349, -0.993868, 0.0336423, 8.61617, 0.99315, -0.108854, -0.0424251, -3.10497, 0.0458264, 0.0295237, 0.998513, -0.673192, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0475207, -0.998419, 0.0300326, 8.41329, 0.997342, -0.0500482, -0.0529488, -3.73067, 0.0543674, 0.0279877, 0.998128, -0.696028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.195158, -0.972476, -0.127375, 8.72707, 0.814116, -0.237464, 0.529911, -1.25996, -0.545578, -0.000287189, 0.83806, 1.79072, 0, 0, 0, 1),
            Qt.matrix4x4(-0.330966, -0.94284, -0.0394216, 8.97558, 0.882953, -0.330396, 0.333458, -0.839352, -0.32739, 0.077067, 0.94174, 0.279388, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.537123, -0.000296767, -0.843504, 0.554122, -0.842709, -0.0435817, -0.536602, 0.565483, -0.0358822, 0.999087, -0.0231935, -8.88648, 0, 0, 0, 1),
            Qt.matrix4x4(-0.166378, 0.983283, 0.0740663, -8.70732, -0.984954, -0.171577, 0.020394, 0.422965, 0.0327581, -0.0709502, 0.996941, 0.467845, 0, 0, 0, 1),
            Qt.matrix4x4(-0.149357, 0.986014, -0.074029, -8.65343, -0.986381, -0.156325, -0.0510459, -1.06076, -0.0618993, 0.0667056, 0.99585, -0.921255, 0, 0, 0, 1),
            Qt.matrix4x4(0.00422325, 0.999574, -0.0288708, -8.22233, -0.999891, 0.00388973, -0.0142473, -3.58637, -0.0141287, 0.0295088, 0.999464, -0.444934, 0, 0, 0, 1),
            Qt.matrix4x4(0.00330225, 0.999576, -0.0289198, -8.24316, -0.993543, -1.24404e-07, -0.113453, -3.96923, -0.113403, 0.0296922, 0.993105, -0.700585, 0, 0, 0, 1),
            Qt.matrix4x4(0.00263522, 0.999576, -0.0289882, -8.2459, -0.995893, -1.16032e-07, -0.0905374, -4.10435, -0.0904974, 0.0296922, 0.995454, -0.606181, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.00169649, 0.999576, -0.0290582, -8.24749, -0.9983, -9.51426e-08, -0.0582865, -4.02818, -0.0582608, 0.0296922, 0.99786, -0.60424, 0, 0, 0, 1),
            Qt.matrix4x4(0.000572293, 0.999576, -0.0291021, -8.2522, -0.999807, -7.42842e-08, -0.0196637, -4.19263, -0.0196551, 0.0296922, 0.999365, -0.442435, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.105349, 0.993868, -0.0336423, -8.61617, -0.99315, -0.108854, -0.0424251, -3.10497, -0.0458264, 0.0295237, 0.998513, -0.673192, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0475207, 0.998419, -0.0300326, -8.41329, -0.997342, -0.0500482, -0.0529488, -3.73067, -0.0543674, 0.0279877, 0.998128, -0.696028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.195158, 0.972476, 0.127375, -8.72707, -0.814116, -0.237464, 0.529911, -1.25996, 0.545578, -0.000287189, 0.83806, 1.79072, 0, 0, 0, 1),
            Qt.matrix4x4(-0.330966, 0.94284, 0.0394216, -8.97558, -0.882953, -0.330396, 0.333458, -0.839352, 0.32739, 0.077067, 0.94174, 0.279388, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.526979, -0.380595, 0.759926, 2.0476, 0.603076, 0.466366, 0.647179, -2.36046, -0.593026, 0.804969, -0.0160296, -4.18093, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.526979, 0.380595, -0.759926, -2.0476, -0.603076, 0.466367, 0.647179, -2.36046, 0.593026, 0.80497, -0.0160296, -4.18093, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.989611, 0.143373, -0.0112394, -1.17261, 0.141006, -0.988576, 0.0531762, 5.00929, -0.00348676, -0.0552951, -0.998467, 0.425177, 0, 0, 0, 1),
            Qt.matrix4x4(0.999255, 0.0384591, 0.00386664, -0.866786, 0.0378379, -0.998278, -0.0448294, 2.94092, 0.0021358, 0.0458438, -0.99895, 0.121334, 0, 0, 0, 1),
            Qt.matrix4x4(1, -1.8011e-06, 4.8777e-06, -0.846915, -5.18608e-06, -0.319395, 0.947611, 0.0127089, -1.46187e-07, -0.949526, -0.313734, 0.491213, 0, 0, 0, 1),
            Qt.matrix4x4(-1, 9.6371e-07, -5.15617e-06, 0.846921, -5.15618e-06, -1.3113e-06, 1, -1.30363, 9.44713e-07, 1, 1.28546e-06, -0.0796836, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.989608, -0.143374, 0.0112471, 1.17261, -0.141007, -0.988576, 0.0531762, 5.00928, 0.00349429, -0.0552959, -0.998462, 0.425184, 0, 0, 0, 1),
            Qt.matrix4x4(0.999252, -0.0384602, -0.00385918, 0.866785, -0.0378388, -0.998278, -0.0448294, 2.94092, -0.0021283, 0.0458432, -0.998944, 0.12134, 0, 0, 0, 1),
            Qt.matrix4x4(0.999999, 4.84e-07, 2.50409e-06, 0.846912, -2.22135e-06, -0.319394, 0.947605, 0.0127029, 1.23614e-06, -0.949525, -0.313735, 0.491213, 0, 0, 0, 1),
            Qt.matrix4x4(-0.999999, 3.48021e-07, -2.20569e-06, -0.84691, -2.20569e-06, 8.64265e-07, 0.999998, -1.30363, 3.41165e-07, 1, -8.47236e-07, -0.0796791, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: sketchfab_model
        objectName: "Sketchfab_model"
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        Node {
            id: db5e30b917dc497bb72a92c8f8a71d48_fbx
            objectName: "db5e30b917dc497bb72a92c8f8a71d48.fbx"
            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
            Node {
                id: object_2
                objectName: "Object_2"
                Node {
                    id: rootNode
                    objectName: "RootNode"
                    Node {
                        id: zombie
                        objectName: "Zombie"
                        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                        scale: Qt.vector3d(1, 1, 1.01)
                        Node {
                            id: object_5
                            objectName: "Object_5"
                            Node {
                                id: _rootJoint
                                objectName: "_rootJoint"
                                Node {
                                    id: spine_01
                                    objectName: "spine_01"
                                    position: Qt.vector3d(1.10162e-13, 0.0655986, 4.0328)
                                    rotation: Qt.quaternion(0.547316, 0.836926, 6.52631e-08, 9.97577e-08)
                                    Node {
                                        id: spine_001_02
                                        objectName: "spine.001_02"
                                        position: Qt.vector3d(4.60743e-15, 1.02399, 2.98023e-08)
                                        rotation: Qt.quaternion(0.999421, 0.0340106, -1.1914e-07, 4.05438e-09)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: spine_002_03
                                            objectName: "spine.002_03"
                                            position: Qt.vector3d(-1.38778e-17, 0.78804, -1.19209e-07)
                                            rotation: Qt.quaternion(0.996546, 0.0830384, 1.18798e-07, 9.89896e-09)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: spine_003_04
                                                objectName: "spine.003_04"
                                                position: Qt.vector3d(-3.6679e-14, 1.02014, 0)
                                                rotation: Qt.quaternion(0.996725, 0.0808703, -1.18819e-07, 9.6405e-09)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: spine_004_00
                                                    objectName: "spine.004_00"
                                                    position: Qt.vector3d(2.41127e-15, 1.23032, 0.161416)
                                                    rotation: Qt.quaternion(0.980971, 0.194157, -1.16941e-07, -2.31453e-08)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: spine_005_05
                                                        objectName: "spine.005_05"
                                                        position: Qt.vector3d(-7.30804e-14, 0.839239, -2.38419e-07)
                                                        rotation: Qt.quaternion(0.997846, 0.0655973, 2.37905e-07, -3.56038e-15)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: spine_006_06
                                                            objectName: "spine.006_06"
                                                            position: Qt.vector3d(-2.11636e-14, 0.894217, 5.96046e-08)
                                                            rotation: Qt.quaternion(0.998059, -0.0622718, -2.37956e-07, 4.00457e-15)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: mandibula_07
                                                                objectName: "mandibula_07"
                                                                position: Qt.vector3d(2.33848e-07, 0.110135, 0.980828)
                                                                rotation: Qt.quaternion(0.39522, 0.918586, -9.42279e-08, -4.38016e-07)
                                                                scale: Qt.vector3d(1, 1, 0.999999)
                                                                Node {
                                                                    id: mandibula_end_042
                                                                    objectName: "mandibula_end_042"
                                                                    position: Qt.vector3d(2.11758e-22, 1.35489, 0)
                                                                    rotation: Qt.quaternion(1, 1.4013e-45, 5.29396e-23, -2.64698e-23)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                Node {
                                                    id: shoulder_L_08
                                                    objectName: "shoulder.L_08"
                                                    position: Qt.vector3d(0.14634, 0.875168, 0.618101)
                                                    rotation: Qt.quaternion(0.527517, -0.627171, -0.294249, -0.491732)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: upper_arm_L_09
                                                        objectName: "upper_arm.L_09"
                                                        position: Qt.vector3d(0.179825, 0.996401, -0.199498)
                                                        rotation: Qt.quaternion(-0.436883, -0.157107, -0.556509, 0.68902)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: forearm_L_010
                                                            objectName: "forearm.L_010"
                                                            position: Qt.vector3d(7.45058e-08, 1.36679, 2.22045e-16)
                                                            rotation: Qt.quaternion(0.988167, 0.0622946, -0.0772808, -0.116932)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: hand_L_011
                                                                objectName: "hand.L_011"
                                                                position: Qt.vector3d(0, 1.15099, -1.19209e-07)
                                                                rotation: Qt.quaternion(0.993817, 0.0134868, -0.0892935, 0.06459)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: hand_L_001_012
                                                                    objectName: "hand.L.001_012"
                                                                    position: Qt.vector3d(-0.017182, 0.440571, -0.142481)
                                                                    rotation: Qt.quaternion(0.972223, -0.17082, 0.0552726, -0.150163)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_L_002_013
                                                                        objectName: "hand.L.002_013"
                                                                        position: Qt.vector3d(1.08033e-07, 0.125713, 1.35973e-07)
                                                                        rotation: Qt.quaternion(0.93494, -0.00276177, 0.18954, -0.299925)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_L_002_end_043
                                                                            objectName: "hand.L.002_end_043"
                                                                            position: Qt.vector3d(0, 0.11709, 1.11022e-16)
                                                                            rotation: Qt.quaternion(1, 5.55112e-17, -1.38778e-17, -4.16334e-17)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: hand_L_003_014
                                                                    objectName: "hand.L.003_014"
                                                                    position: Qt.vector3d(-0.0149248, 0.485821, -0.020406)
                                                                    rotation: Qt.quaternion(0.993326, -0.0498271, 0.0170811, -0.10261)
                                                                    Node {
                                                                        id: hand_L_004_015
                                                                        objectName: "hand.L.004_015"
                                                                        position: Qt.vector3d(-1.19209e-07, 0.153696, -1.49012e-07)
                                                                        rotation: Qt.quaternion(0.912018, -0.0671047, -0.00134047, -0.404621)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_L_004_end_044
                                                                            objectName: "hand.L.004_end_044"
                                                                            position: Qt.vector3d(0, 0.11709, 2.22045e-16)
                                                                            rotation: Qt.quaternion(1, -5.55112e-17, -3.46945e-18, -1.73472e-17)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: hand_L_005_016
                                                                    objectName: "hand.L.005_016"
                                                                    position: Qt.vector3d(0.00079754, 0.482784, 0.100276)
                                                                    rotation: Qt.quaternion(0.987905, -0.0421617, 0.0128885, -0.148659)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_L_006_017
                                                                        objectName: "hand.L.006_017"
                                                                        position: Qt.vector3d(1.19209e-07, 0.126465, 4.47035e-08)
                                                                        rotation: Qt.quaternion(0.984104, -0.0466217, -0.00158783, -0.17136)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_L_006_end_045
                                                                            objectName: "hand.L.006_end_045"
                                                                            position: Qt.vector3d(0, 0.117379, 1.11022e-16)
                                                                            rotation: Qt.quaternion(1, 2.77556e-17, -1.38778e-17, 4.16334e-17)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: hand_L_007_018
                                                                    objectName: "hand.L.007_018"
                                                                    position: Qt.vector3d(0.0660653, 0.180128, 0.149635)
                                                                    rotation: Qt.quaternion(0.94884, 0.287829, 0.0483967, -0.120477)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_L_008_019
                                                                        objectName: "hand.L.008_019"
                                                                        position: Qt.vector3d(1.19209e-07, 0.145372, 2.23517e-07)
                                                                        rotation: Qt.quaternion(0.954659, -0.288972, -0.0398778, 0.0594275)
                                                                        Node {
                                                                            id: hand_L_008_end_046
                                                                            objectName: "hand.L.008_end_046"
                                                                            position: Qt.vector3d(0, 0.156962, 0)
                                                                            rotation: Qt.quaternion(1, 3.46945e-18, -2.77556e-17, 1.99493e-17)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                Node {
                                                    id: shoulder_R_020
                                                    objectName: "shoulder.R_020"
                                                    position: Qt.vector3d(-0.14634, 0.875168, 0.618101)
                                                    rotation: Qt.quaternion(0.510059, -0.584266, 0.393846, 0.493313)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: upper_arm_R_021
                                                        objectName: "upper_arm.R_021"
                                                        position: Qt.vector3d(-0.179825, 0.996401, -0.199498)
                                                        rotation: Qt.quaternion(0.459805, 0.0979602, -0.597873, 0.649255)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: forearm_R_022
                                                            objectName: "forearm.R_022"
                                                            position: Qt.vector3d(-2.98023e-08, 1.36679, 8.9407e-08)
                                                            rotation: Qt.quaternion(0.932827, 0.218118, 0.272773, 0.0886173)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: hand_R_023
                                                                objectName: "hand.R_023"
                                                                position: Qt.vector3d(0, 1.15099, 7.45058e-08)
                                                                rotation: Qt.quaternion(0.996385, 0.0225575, -0.0203858, -0.0793285)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: hand_R_001_024
                                                                    objectName: "hand.R.001_024"
                                                                    position: Qt.vector3d(0.0171822, 0.440572, -0.142481)
                                                                    rotation: Qt.quaternion(0.88152, 0.0190795, 0.0248354, 0.471107)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_R_002_025
                                                                        objectName: "hand.R.002_025"
                                                                        position: Qt.vector3d(1.19209e-07, 0.125713, 2.98023e-08)
                                                                        rotation: Qt.quaternion(0.722024, -0.0813661, -0.00523431, 0.687047)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_R_002_end_047
                                                                            objectName: "hand.R.002_end_047"
                                                                            position: Qt.vector3d(0, 0.11709, 0)
                                                                            rotation: Qt.quaternion(1, 5.55112e-17, -1.73472e-17, 2.08167e-17)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: hand_R_003_026
                                                                    objectName: "hand.R.003_026"
                                                                    position: Qt.vector3d(0.0149251, 0.485821, -0.0204063)
                                                                    rotation: Qt.quaternion(0.920944, 0.00288792, 0.115291, 0.37224)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_R_004_027
                                                                        objectName: "hand.R.004_027"
                                                                        position: Qt.vector3d(-5.06639e-07, 0.153696, 1.3411e-07)
                                                                        rotation: Qt.quaternion(0.875973, -0.126048, -0.123726, 0.448861)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_R_004_end_048
                                                                            objectName: "hand.R.004_end_048"
                                                                            position: Qt.vector3d(0, 0.11709, -4.44089e-16)
                                                                            rotation: Qt.quaternion(1, 0, 0, 6.93889e-18)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: hand_R_005_028
                                                                    objectName: "hand.R.005_028"
                                                                    position: Qt.vector3d(-0.000797357, 0.482784, 0.100276)
                                                                    rotation: Qt.quaternion(0.961769, 0.0065928, 0.0863347, 0.259815)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_R_006_029
                                                                        objectName: "hand.R.006_029"
                                                                        position: Qt.vector3d(8.9407e-08, 0.126465, 1.93715e-07)
                                                                        rotation: Qt.quaternion(0.90297, -0.232839, 0.249843, 0.260786)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_R_006_end_049
                                                                            objectName: "hand.R.006_end_049"
                                                                            position: Qt.vector3d(8.88178e-16, 0.117379, 2.22045e-16)
                                                                            rotation: Qt.quaternion(1, -2.77556e-17, 2.77556e-17, 1.38778e-17)
                                                                        }
                                                                    }
                                                                }
                                                                Node {
                                                                    id: hand_R_007_030
                                                                    objectName: "hand.R.007_030"
                                                                    position: Qt.vector3d(-0.066065, 0.180127, 0.149635)
                                                                    rotation: Qt.quaternion(0.950161, 0.282997, -0.0482044, 0.121583)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: hand_R_008_031
                                                                        objectName: "hand.R.008_031"
                                                                        position: Qt.vector3d(-2.98023e-07, 0.145372, 1.78814e-07)
                                                                        rotation: Qt.quaternion(0.785253, -0.578286, 0.185282, 0.120969)
                                                                        scale: Qt.vector3d(1, 1, 1)
                                                                        Node {
                                                                            id: hand_R_008_end_050
                                                                            objectName: "hand.R.008_end_050"
                                                                            position: Qt.vector3d(0, 0.156962, -2.22045e-16)
                                                                            rotation: Qt.quaternion(1, 0, 0, -2.77556e-17)
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
                                        id: pelvis_L_032
                                        objectName: "pelvis.L_032"
                                        position: Qt.vector3d(2.84448e-14, -7.45058e-09, -3.35276e-08)
                                        rotation: Qt.quaternion(-0.47098, 0.118096, 0.744591, 0.458057)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: pelvis_L_end_051
                                            objectName: "pelvis.L_end_051"
                                            position: Qt.vector3d(-8.88178e-16, 0.846794, 0)
                                            rotation: Qt.quaternion(1, 4.16334e-17, 2.77556e-17, -1.15556e-33)
                                        }
                                    }
                                    Node {
                                        id: pelvis_R_033
                                        objectName: "pelvis.R_033"
                                        position: Qt.vector3d(2.84448e-14, -7.45058e-09, -3.35276e-08)
                                        rotation: Qt.quaternion(0.47098, -0.118096, 0.744591, 0.458057)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: pelvis_R_end_052
                                            objectName: "pelvis.R_end_052"
                                            position: Qt.vector3d(0, 0.846794, 0)
                                            rotation: Qt.quaternion(1, -2.77556e-17, 1.04083e-16, 8.32667e-17)
                                        }
                                    }
                                    Node {
                                        id: thigh_L_034
                                        objectName: "thigh.L_034"
                                        position: Qt.vector3d(0.442154, -0.0185714, 0.239392)
                                        rotation: Qt.quaternion(0.645112, 0.744746, 0.137204, -0.101778)
                                        scale: Qt.vector3d(0.999996, 0.999998, 1)
                                        Node {
                                            id: shin_L_035
                                            objectName: "shin.L_035"
                                            position: Qt.vector3d(-1.19209e-07, 2.20013, 7.82311e-08)
                                            rotation: Qt.quaternion(0.818425, 0.554266, 0.148939, 0.0280365)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: foot_L_036
                                                objectName: "foot.L_036"
                                                position: Qt.vector3d(-9.31323e-08, 2.49781, -7.45058e-09)
                                                rotation: Qt.quaternion(0.686765, -0.696051, 0.123279, 0.169319)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: toe_L_037
                                                    objectName: "toe.L_037"
                                                    position: Qt.vector3d(1.24797e-07, 1.22261, -4.47035e-08)
                                                    rotation: Qt.quaternion(0.0125456, -0.00509404, 0.991087, -0.132529)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: toe_L_end_053
                                                        objectName: "toe.L_end_053"
                                                        position: Qt.vector3d(0, 0.367241, -6.93889e-18)
                                                        rotation: Qt.quaternion(1, -1.73472e-18, 5.20417e-18, 9.0278e-36)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Node {
                                        id: thigh_R_038
                                        objectName: "thigh.R_038"
                                        position: Qt.vector3d(-0.442154, -0.0185716, 0.239392)
                                        rotation: Qt.quaternion(0.162942, 0.960303, -0.218263, 0.0602362)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: shin_R_039
                                            objectName: "shin.R_039"
                                            position: Qt.vector3d(-1.93395e-07, 2.20013, 1.86265e-09)
                                            rotation: Qt.quaternion(0.912133, 0.391369, -0.100851, -0.0683647)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: foot_R_040
                                                objectName: "foot.R_040"
                                                position: Qt.vector3d(5.21541e-08, 2.49781, -1.04308e-07)
                                                rotation: Qt.quaternion(-0.411407, 0.904424, 0.107155, 0.0357664)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: toe_R_041
                                                    objectName: "toe.R_041"
                                                    position: Qt.vector3d(-2.98023e-08, 1.2226, 5.96046e-08)
                                                    rotation: Qt.quaternion(4.2503e-07, 8.46756e-08, 0.986868, -0.161531)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: toe_R_end_054
                                                        objectName: "toe.R_end_054"
                                                        position: Qt.vector3d(2.22045e-16, 0.367241, -8.32667e-17)
                                                        rotation: Qt.quaternion(1, 6.93889e-18, -1.04083e-17, 2.77556e-17)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Model {
                                id: object_63
                                objectName: "Object_63"
                                source: "meshes/body_zombieBody_0_mesh.mesh"
                                skin: skin
                                materials: [
                                    zombieBody_material
                                ]
                            }
                            Node {
                                id: object_62
                                objectName: "Object_62"
                                position: Qt.vector3d(-3.71993e-08, 13.0006, 0.42551)
                                rotation: Qt.quaternion(2.8213e-07, 2.4377e-10, 1, -0.000864032)
                                scale: Qt.vector3d(1, 1.01, 1)
                            }
                        }
                    }
                    Node {
                        id: body
                        objectName: "body"
                        position: Qt.vector3d(-3.71993e-08, 13.0006, 0.42551)
                        rotation: Qt.quaternion(3.13916e-07, 2.71507e-10, 1, -0.000872708)
                        scale: Qt.vector3d(1, 1.01, 1)
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: zombie_Idle_timeline
        objectName: "Zombie|Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 24959
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 24959
            from: 0
            to: 24959
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: mandibula_07
            property: "rotation"
            keyframeSource: "animations/mandibula_07_rotation_0.qad"
        }
        KeyframeGroup {
            target: forearm_R_022
            property: "rotation"
            keyframeSource: "animations/forearm_R_022_rotation_0.qad"
        }
        KeyframeGroup {
            target: forearm_L_010
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.980625, 0.179276, -0.0685813, -0.0391394)
            }
        }
        KeyframeGroup {
            target: spine_006_06
            property: "rotation"
            keyframeSource: "animations/spine_006_06_rotation_0.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_09
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_09_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_005_05
            property: "rotation"
            keyframeSource: "animations/spine_005_05_rotation_0.qad"
        }
        KeyframeGroup {
            target: shoulder_L_08
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.545665, -0.631965, -0.295806, -0.464079)
            }
        }
        KeyframeGroup {
            target: spine_004_00
            property: "rotation"
            keyframeSource: "animations/spine_004_00_rotation_0.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_021
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_021_rotation_0.qad"
        }
        KeyframeGroup {
            target: shoulder_R_020
            property: "rotation"
            keyframeSource: "animations/shoulder_R_020_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_003_04
            property: "rotation"
            keyframeSource: "animations/spine_003_04_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_002_03
            property: "rotation"
            keyframeSource: "animations/spine_002_03_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_001_02
            property: "rotation"
            keyframeSource: "animations/spine_001_02_rotation_0.qad"
        }
        KeyframeGroup {
            target: toe_L_037
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-5.25561e-07, -8.65064e-08, 0.986868, -0.16153)
            }
        }
        KeyframeGroup {
            target: foot_L_036
            property: "rotation"
            keyframeSource: "animations/foot_L_036_rotation_0.qad"
        }
        KeyframeGroup {
            target: shin_L_035
            property: "rotation"
            keyframeSource: "animations/shin_L_035_rotation_0.qad"
        }
        KeyframeGroup {
            target: thigh_L_034
            property: "rotation"
            keyframeSource: "animations/thigh_L_034_rotation_0.qad"
        }
        KeyframeGroup {
            target: foot_R_040
            property: "rotation"
            keyframeSource: "animations/foot_R_040_rotation_0.qad"
        }
        KeyframeGroup {
            target: shin_R_039
            property: "rotation"
            keyframeSource: "animations/shin_R_039_rotation_0.qad"
        }
        KeyframeGroup {
            target: thigh_R_038
            property: "rotation"
            keyframeSource: "animations/thigh_R_038_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "position"
            keyframeSource: "animations/spine_01_position_0.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.651921, 0.758287, 7.7715e-08, 9.03948e-08)
            }
        }
    }
    Timeline {
        id: zombie_attackA_timeline
        objectName: "Zombie|attackA"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1792
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 1792
            from: 0
            to: 1792
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: hand_L_011
            property: "rotation"
            keyframeSource: "animations/hand_L_011_rotation_1.qad"
        }
        KeyframeGroup {
            target: mandibula_07
            property: "rotation"
            keyframeSource: "animations/mandibula_07_rotation_1.qad"
        }
        KeyframeGroup {
            target: forearm_L_010
            property: "rotation"
            keyframeSource: "animations/forearm_L_010_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_006_06
            property: "rotation"
            keyframeSource: "animations/spine_006_06_rotation_1.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_09
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_09_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_005_05
            property: "rotation"
            keyframeSource: "animations/spine_005_05_rotation_1.qad"
        }
        KeyframeGroup {
            target: shoulder_L_08
            property: "rotation"
            keyframeSource: "animations/shoulder_L_08_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_004_00
            property: "rotation"
            keyframeSource: "animations/spine_004_00_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_002_025
            property: "rotation"
            keyframeSource: "animations/hand_R_002_025_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_001_024
            property: "rotation"
            keyframeSource: "animations/hand_R_001_024_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_004_027
            property: "rotation"
            keyframeSource: "animations/hand_R_004_027_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_003_026
            property: "rotation"
            keyframeSource: "animations/hand_R_003_026_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_006_029
            property: "rotation"
            keyframeSource: "animations/hand_R_006_029_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_005_028
            property: "rotation"
            keyframeSource: "animations/hand_R_005_028_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_008_031
            property: "rotation"
            keyframeSource: "animations/hand_R_008_031_rotation_1.qad"
        }
        KeyframeGroup {
            target: hand_R_007_030
            property: "rotation"
            keyframeSource: "animations/hand_R_007_030_rotation_1.qad"
        }
        KeyframeGroup {
            target: forearm_R_022
            property: "rotation"
            keyframeSource: "animations/forearm_R_022_rotation_1.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_021
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_021_rotation_1.qad"
        }
        KeyframeGroup {
            target: shoulder_R_020
            property: "rotation"
            keyframeSource: "animations/shoulder_R_020_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_003_04
            property: "rotation"
            keyframeSource: "animations/spine_003_04_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_002_03
            property: "rotation"
            keyframeSource: "animations/spine_002_03_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_001_02
            property: "rotation"
            keyframeSource: "animations/spine_001_02_rotation_1.qad"
        }
        KeyframeGroup {
            target: toe_L_037
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-3.94151e-07, -6.49974e-08, 0.986868, -0.16153)
            }
        }
        KeyframeGroup {
            target: foot_L_036
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.791192, -0.591344, -0.102602, 0.117473)
            }
        }
        KeyframeGroup {
            target: shin_L_035
            property: "rotation"
            keyframeSource: "animations/shin_L_035_rotation_1.qad"
        }
        KeyframeGroup {
            target: thigh_L_034
            property: "rotation"
            keyframeSource: "animations/thigh_L_034_rotation_1.qad"
        }
        KeyframeGroup {
            target: foot_R_040
            property: "rotation"
            keyframeSource: "animations/foot_R_040_rotation_1.qad"
        }
        KeyframeGroup {
            target: shin_R_039
            property: "rotation"
            keyframeSource: "animations/shin_R_039_rotation_1.qad"
        }
        KeyframeGroup {
            target: thigh_R_038
            property: "rotation"
            keyframeSource: "animations/thigh_R_038_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "position"
            keyframeSource: "animations/spine_01_position_1.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "rotation"
            keyframeSource: "animations/spine_01_rotation_1.qad"
        }
    }
    Timeline {
        id: zombie_damage_timeline
        objectName: "Zombie|damage"
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
            target: mandibula_07
            property: "rotation"
            keyframeSource: "animations/mandibula_07_rotation_2.qad"
        }
        KeyframeGroup {
            target: forearm_R_022
            property: "rotation"
            keyframeSource: "animations/forearm_R_022_rotation_2.qad"
        }
        KeyframeGroup {
            target: forearm_L_010
            property: "rotation"
            keyframeSource: "animations/forearm_L_010_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_006_06
            property: "rotation"
            keyframeSource: "animations/spine_006_06_rotation_2.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_09
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_09_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_005_05
            property: "rotation"
            keyframeSource: "animations/spine_005_05_rotation_2.qad"
        }
        KeyframeGroup {
            target: shoulder_L_08
            property: "rotation"
            keyframeSource: "animations/shoulder_L_08_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_004_00
            property: "rotation"
            keyframeSource: "animations/spine_004_00_rotation_2.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_021
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_021_rotation_2.qad"
        }
        KeyframeGroup {
            target: shoulder_R_020
            property: "rotation"
            keyframeSource: "animations/shoulder_R_020_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_003_04
            property: "rotation"
            keyframeSource: "animations/spine_003_04_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_002_03
            property: "rotation"
            keyframeSource: "animations/spine_002_03_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine_001_02
            property: "rotation"
            keyframeSource: "animations/spine_001_02_rotation_2.qad"
        }
        KeyframeGroup {
            target: toe_L_037
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-5.25561e-07, -8.65064e-08, 0.986868, -0.16153)
            }
        }
        KeyframeGroup {
            target: foot_L_036
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.791192, -0.591344, -0.102602, 0.117473)
            }
        }
        KeyframeGroup {
            target: shin_L_035
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.943886, 0.311341, 0.0986902, 0.0490555)
            }
        }
        KeyframeGroup {
            target: thigh_L_034
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.425901, 0.882587, 0.184093, -0.0758793)
            }
        }
        KeyframeGroup {
            target: foot_R_040
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.506434, -0.844605, 0.139591, -0.103348)
            }
        }
        KeyframeGroup {
            target: shin_R_039
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.885849, 0.438134, -0.145545, -0.0461227)
            }
        }
        KeyframeGroup {
            target: thigh_R_038
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.188347, 0.962658, -0.191782, 0.032177)
            }
        }
        KeyframeGroup {
            target: spine_01
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(2.81594e-17, 0.0941404, 4.26117)
            }
        }
        KeyframeGroup {
            target: spine_01
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.651921, 0.758287, 7.7715e-08, 9.03948e-08)
            }
        }
    }
    Timeline {
        id: zombie_death_timeline
        objectName: "Zombie|death"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1167
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 1167
            from: 0
            to: 1167
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: mandibula_07
            property: "rotation"
            keyframeSource: "animations/mandibula_07_rotation_3.qad"
        }
        KeyframeGroup {
            target: forearm_R_022
            property: "rotation"
            keyframeSource: "animations/forearm_R_022_rotation_3.qad"
        }
        KeyframeGroup {
            target: forearm_L_010
            property: "rotation"
            keyframeSource: "animations/forearm_L_010_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_006_06
            property: "rotation"
            keyframeSource: "animations/spine_006_06_rotation_3.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_09
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_09_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_005_05
            property: "rotation"
            keyframeSource: "animations/spine_005_05_rotation_3.qad"
        }
        KeyframeGroup {
            target: shoulder_L_08
            property: "rotation"
            keyframeSource: "animations/shoulder_L_08_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_004_00
            property: "rotation"
            keyframeSource: "animations/spine_004_00_rotation_3.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_021
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_021_rotation_3.qad"
        }
        KeyframeGroup {
            target: shoulder_R_020
            property: "rotation"
            keyframeSource: "animations/shoulder_R_020_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_003_04
            property: "rotation"
            keyframeSource: "animations/spine_003_04_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_002_03
            property: "rotation"
            keyframeSource: "animations/spine_002_03_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_001_02
            property: "rotation"
            keyframeSource: "animations/spine_001_02_rotation_3.qad"
        }
        KeyframeGroup {
            target: toe_L_037
            property: "rotation"
            keyframeSource: "animations/toe_L_037_rotation_3.qad"
        }
        KeyframeGroup {
            target: foot_L_036
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.791192, -0.591344, -0.102602, 0.117473)
            }
        }
        KeyframeGroup {
            target: shin_L_035
            property: "rotation"
            keyframeSource: "animations/shin_L_035_rotation_3.qad"
        }
        KeyframeGroup {
            target: thigh_L_034
            property: "rotation"
            keyframeSource: "animations/thigh_L_034_rotation_3.qad"
        }
        KeyframeGroup {
            target: foot_R_040
            property: "rotation"
            keyframeSource: "animations/foot_R_040_rotation_3.qad"
        }
        KeyframeGroup {
            target: shin_R_039
            property: "rotation"
            keyframeSource: "animations/shin_R_039_rotation_3.qad"
        }
        KeyframeGroup {
            target: thigh_R_038
            property: "rotation"
            keyframeSource: "animations/thigh_R_038_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "position"
            keyframeSource: "animations/spine_01_position_3.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "rotation"
            keyframeSource: "animations/spine_01_rotation_3.qad"
        }
    }
    Timeline {
        id: zombie_running_timeline
        objectName: "Zombie|running"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1292
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 1292
            from: 0
            to: 1292
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: mandibula_07
            property: "rotation"
            keyframeSource: "animations/mandibula_07_rotation_4.qad"
        }
        KeyframeGroup {
            target: forearm_R_022
            property: "rotation"
            keyframeSource: "animations/forearm_R_022_rotation_4.qad"
        }
        KeyframeGroup {
            target: forearm_L_010
            property: "rotation"
            keyframeSource: "animations/forearm_L_010_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_006_06
            property: "rotation"
            keyframeSource: "animations/spine_006_06_rotation_4.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_09
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_09_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_005_05
            property: "rotation"
            keyframeSource: "animations/spine_005_05_rotation_4.qad"
        }
        KeyframeGroup {
            target: shoulder_L_08
            property: "rotation"
            keyframeSource: "animations/shoulder_L_08_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_004_00
            property: "rotation"
            keyframeSource: "animations/spine_004_00_rotation_4.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_021
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_021_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_003_04
            property: "rotation"
            keyframeSource: "animations/spine_003_04_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_002_03
            property: "rotation"
            keyframeSource: "animations/spine_002_03_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_001_02
            property: "rotation"
            keyframeSource: "animations/spine_001_02_rotation_4.qad"
        }
        KeyframeGroup {
            target: toe_L_037
            property: "rotation"
            keyframeSource: "animations/toe_L_037_rotation_4.qad"
        }
        KeyframeGroup {
            target: foot_L_036
            property: "rotation"
            keyframeSource: "animations/foot_L_036_rotation_4.qad"
        }
        KeyframeGroup {
            target: shin_L_035
            property: "rotation"
            keyframeSource: "animations/shin_L_035_rotation_4.qad"
        }
        KeyframeGroup {
            target: thigh_L_034
            property: "rotation"
            keyframeSource: "animations/thigh_L_034_rotation_4.qad"
        }
        KeyframeGroup {
            target: toe_R_041
            property: "rotation"
            keyframeSource: "animations/toe_R_041_rotation_4.qad"
        }
        KeyframeGroup {
            target: foot_R_040
            property: "rotation"
            keyframeSource: "animations/foot_R_040_rotation_4.qad"
        }
        KeyframeGroup {
            target: shin_R_039
            property: "rotation"
            keyframeSource: "animations/shin_R_039_rotation_4.qad"
        }
        KeyframeGroup {
            target: thigh_R_038
            property: "rotation"
            keyframeSource: "animations/thigh_R_038_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "position"
            keyframeSource: "animations/spine_01_position_4.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "rotation"
            keyframeSource: "animations/spine_01_rotation_4.qad"
        }
    }
    Timeline {
        id: zombie_scream_timeline
        objectName: "Zombie|scream"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 4417
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 4417
            from: 0
            to: 4417
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: hand_L_004_015
            property: "rotation"
            keyframeSource: "animations/hand_L_004_015_rotation_5.qad"
        }
        KeyframeGroup {
            target: mandibula_07
            property: "rotation"
            keyframeSource: "animations/mandibula_07_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_003_014
            property: "rotation"
            keyframeSource: "animations/hand_L_003_014_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_006_06
            property: "rotation"
            keyframeSource: "animations/spine_006_06_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_005_05
            property: "rotation"
            keyframeSource: "animations/spine_005_05_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_004_00
            property: "rotation"
            keyframeSource: "animations/spine_004_00_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_002_013
            property: "rotation"
            keyframeSource: "animations/hand_L_002_013_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_001_012
            property: "rotation"
            keyframeSource: "animations/hand_L_001_012_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_006_017
            property: "rotation"
            keyframeSource: "animations/hand_L_006_017_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_005_016
            property: "rotation"
            keyframeSource: "animations/hand_L_005_016_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_008_019
            property: "rotation"
            keyframeSource: "animations/hand_L_008_019_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_L_007_018
            property: "rotation"
            keyframeSource: "animations/hand_L_007_018_rotation_5.qad"
        }
        KeyframeGroup {
            target: forearm_L_010
            property: "rotation"
            keyframeSource: "animations/forearm_L_010_rotation_5.qad"
        }
        KeyframeGroup {
            target: upper_arm_L_09
            property: "rotation"
            keyframeSource: "animations/upper_arm_L_09_rotation_5.qad"
        }
        KeyframeGroup {
            target: shoulder_L_08
            property: "rotation"
            keyframeSource: "animations/shoulder_L_08_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_R_001_024
            property: "rotation"
            keyframeSource: "animations/hand_R_001_024_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_R_004_027
            property: "rotation"
            keyframeSource: "animations/hand_R_004_027_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_R_003_026
            property: "rotation"
            keyframeSource: "animations/hand_R_003_026_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_R_006_029
            property: "rotation"
            keyframeSource: "animations/hand_R_006_029_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_R_005_028
            property: "rotation"
            keyframeSource: "animations/hand_R_005_028_rotation_5.qad"
        }
        KeyframeGroup {
            target: hand_R_008_031
            property: "rotation"
            keyframeSource: "animations/hand_R_008_031_rotation_5.qad"
        }
        KeyframeGroup {
            target: forearm_R_022
            property: "rotation"
            keyframeSource: "animations/forearm_R_022_rotation_5.qad"
        }
        KeyframeGroup {
            target: upper_arm_R_021
            property: "rotation"
            keyframeSource: "animations/upper_arm_R_021_rotation_5.qad"
        }
        KeyframeGroup {
            target: shoulder_R_020
            property: "rotation"
            keyframeSource: "animations/shoulder_R_020_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_003_04
            property: "rotation"
            keyframeSource: "animations/spine_003_04_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_002_03
            property: "rotation"
            keyframeSource: "animations/spine_002_03_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_001_02
            property: "rotation"
            keyframeSource: "animations/spine_001_02_rotation_5.qad"
        }
        KeyframeGroup {
            target: toe_L_037
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(-5.25561e-07, -8.65064e-08, 0.986868, -0.16153)
            }
        }
        KeyframeGroup {
            target: foot_L_036
            property: "rotation"
            keyframeSource: "animations/foot_L_036_rotation_5.qad"
        }
        KeyframeGroup {
            target: shin_L_035
            property: "rotation"
            keyframeSource: "animations/shin_L_035_rotation_5.qad"
        }
        KeyframeGroup {
            target: thigh_L_034
            property: "rotation"
            keyframeSource: "animations/thigh_L_034_rotation_5.qad"
        }
        KeyframeGroup {
            target: foot_R_040
            property: "rotation"
            keyframeSource: "animations/foot_R_040_rotation_5.qad"
        }
        KeyframeGroup {
            target: shin_R_039
            property: "rotation"
            keyframeSource: "animations/shin_R_039_rotation_5.qad"
        }
        KeyframeGroup {
            target: thigh_R_038
            property: "rotation"
            keyframeSource: "animations/thigh_R_038_rotation_5.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "position"
            keyframeSource: "animations/spine_01_position_5.qad"
        }
        KeyframeGroup {
            target: spine_01
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.651921, 0.758287, 7.7715e-08, 9.03948e-08)
            }
        }
    }
}
