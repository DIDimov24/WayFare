import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: root
    objectName: "Root"

    // Resources
    Texture {
        id: textures_zombie1_diffuse_png_texture
        objectName: "textures/zombie1_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/zombie1_diffuse.png"
    }
    Texture {
        id: textures_zombie1_specularGlossiness_png_texture
        objectName: "textures/zombie1_specularGlossiness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/zombie1_specularGlossiness.png"
    }
    Texture {
        id: textures_zombie1_normal_png_texture
        objectName: "textures/zombie1_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/zombie1_normal.png"
    }
    SpecularGlossyMaterial {
        id: zombie1_material
        objectName: "zombie1"
        albedoMap: textures_zombie1_diffuse_png_texture
        specularMap: textures_zombie1_specularGlossiness_png_texture
        glossinessMap: textures_zombie1_specularGlossiness_png_texture
        glossiness: 0.8980563879013062
        normalMap: textures_zombie1_normal_png_texture
        alphaMode: SpecularGlossyMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            _rootJoint,
            hips_01,
            l_leg_02,
            l_knee_03,
            l_ankle_04,
            l_foot_05,
            l_toes_06,
            r_leg_07,
            r_knee_08,
            r_ankle_09,
            r_foot_010,
            r_toes_011,
            spine_012,
            chest_013,
            l_shoulder_014,
            l_arm_015,
            l_elbow_016,
            l_wrist_017,
            l_thumb1_018,
            l_thumb2_019,
            l_thumb3_020,
            l_thumb4_021,
            l_point1_022,
            l_point2_023,
            l_point3_024,
            l_point4_025,
            l_middle1_026,
            l_middle2_027,
            l_middle3_028,
            l_middle4_029,
            l_ring1_030,
            l_ring2_031,
            l_ring3_032,
            l_ring4_033,
            l_pink1_034,
            l_pink2_035,
            l_pink3_036,
            l_pink4_037,
            r_shoulder_038,
            r_arm_039,
            r_elbow_040,
            r_wrist_041,
            r_thumb1_042,
            r_thumb2_043,
            r_thumb3_044,
            r_thumb4_045,
            r_point1_046,
            r_point2_047,
            r_point3_048,
            r_point4_049,
            r_middle1_050,
            r_middle2_051,
            r_middle3_052,
            r_middle4_053,
            r_ring1_054,
            r_ring2_00,
            r_ring3_055,
            r_ring4_056,
            r_pink1_057,
            r_pink2_058,
            r_pink3_059,
            r_pink4_060,
            neck_061,
            head_062,
            l_eye_063,
            r_eye_064,
            jaw_065,
            lip_066,
            tip_067
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-1, -1.22465e-16, -1.18449e-13, 1.41343e-12, 1.18181e-13, 0.0662821, -0.997801, 5.31163, 7.97327e-15, -0.997801, -0.0662821, 98.5417, 0, 0, 0, 1),
            Qt.matrix4x4(0.986016, 0.166352, 0.00998347, -27.41, -0.00466132, 0.0874126, -0.996161, 3.33521, -0.166586, 0.982184, 0.0869657, -95.2814, 0, 0, 0, 1),
            Qt.matrix4x4(0.989911, 0.141473, 0.00778213, -26.0239, -0.0302223, 0.264493, -0.963914, -6.70778, -0.138426, 0.953954, 0.266101, -54.8596, 0, 0, 0, 1),
            Qt.matrix4x4(0.983876, 0.177947, 0.0179796, -26.3042, 0.132701, -0.658895, -0.740438, 2.15744, -0.119912, 0.730885, -0.671884, -9.30993, 0, 0, 0, 1),
            Qt.matrix4x4(0.970265, 0.238929, -0.0387257, -25.7881, 0.231375, -0.962521, -0.141491, -2.94349, -0.0710806, 0.128324, -0.989182, 6.92771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.986016, -0.165518, -0.0194014, 27.4403, -0.00466132, 0.0889815, -0.996022, 3.07591, 0.166586, 0.982184, 0.0869657, -95.2814, 0, 0, 0, 1),
            Qt.matrix4x4(0.989911, -0.125075, -0.0665701, 25.5662, -0.0302223, 0.272631, -0.961644, -8.28285, 0.138426, 0.953954, 0.266101, -54.8596, 0, 0, 0, 1),
            Qt.matrix4x4(0.983876, 0.00297362, 0.178828, 24.7927, 0.132701, -0.682494, -0.718743, 9.04918, 0.119912, 0.730885, -0.671884, -9.30993, 0, 0, 0, 1),
            Qt.matrix4x4(0.970265, 0.221139, 0.0984089, 24.3413, 0.231375, -0.966763, -0.108789, 9.01064, 0.0710806, 0.128324, -0.989182, 6.92771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-1, 4.42221e-11, 2.81938e-12, -5.26282e-09, -8.21489e-12, -0.12249, -0.99247, 27.5477, -4.35437e-11, -0.99247, 0.12249, 115.662, 0, 0, 0, 1),
            Qt.matrix4x4(-1, -1.74899e-10, 2.9863e-11, 2.43766e-08, -1.39723e-11, -0.0901612, -0.995927, 23.169, 1.76879e-10, -0.995927, 0.0901612, 135.071, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0448025, 1.65666e-16, 0.998996, -9.89894, 0.12283, 0.992412, 0.00550863, -150.495, -0.991416, 0.122954, -0.0444625, -10.87, 0, 0, 0, 1),
            Qt.matrix4x4(-0.201032, 0.0194452, 0.979392, -9.65669, 0.618165, 0.778109, 0.111437, -128.949, -0.759907, 0.627828, -0.168445, -77.6292, 0, 0, 0, 1),
            Qt.matrix4x4(-0.438852, 0.22402, 0.870186, -26.0986, 0.699624, 0.692886, 0.174458, -121.688, -0.563858, 0.685364, -0.460804, -62.5903, 0, 0, 0, 1),
            Qt.matrix4x4(-0.438852, 0.22402, 0.870186, -26.0986, 0.699624, 0.692886, 0.174458, -121.688, -0.563858, 0.685364, -0.460804, -35.8923, 0, 0, 0, 1),
            Qt.matrix4x4(-0.961328, -0.256879, -0.0993092, 83.7663, -0.275148, 0.911475, 0.305791, -97.0157, 0.0119665, 0.32129, -0.946905, -7.06583, 0, 0, 0, 1),
            Qt.matrix4x4(-0.959186, -0.238675, -0.151644, 83.6111, -0.269704, 0.61101, 0.744263, -80.6861, -0.0849809, 0.754785, -0.650444, -54.1111, 0, 0, 0, 1),
            Qt.matrix4x4(-0.962693, -0.188696, -0.193946, 80.1697, -0.256173, 0.404676, 0.877846, -64.7703, -0.0871603, 0.89478, -0.437918, -73.1816, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.287984, -0.350531, -0.891175, 53.1345, -0.885612, -0.451557, -0.108573, 107.393, -0.364358, 0.820503, -0.440475, -48.6586, 0, 0, 0, 1),
            Qt.matrix4x4(0.265866, -0.301248, -0.915732, 50.3733, -0.963208, -0.0442786, -0.265084, 76.0829, 0.0393085, 0.952517, -0.301937, -89.7415, 0, 0, 0, 1),
            Qt.matrix4x4(0.267647, -0.24755, -0.931173, 45.4748, -0.91924, 0.223996, -0.323766, 48.6478, 0.288727, 0.942627, -0.167606, -106.446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.146098, -0.394592, -0.907167, 63.379, -0.966398, -0.252972, -0.0456018, 88.6461, -0.211494, 0.883347, -0.418292, -65.8828, 0, 0, 0, 1),
            Qt.matrix4x4(0.135605, -0.351021, -0.926496, 60.3215, -0.972482, 0.131653, -0.192215, 55.2976, 0.189447, 0.927066, -0.323509, -94.4125, 0, 0, 0, 1),
            Qt.matrix4x4(0.133312, -0.362171, -0.922529, 61.4129, -0.897429, 0.350861, -0.267427, 31.8539, 0.420534, 0.863556, -0.278249, -100.869, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.231373, -0.34006, -0.911496, 78.0959, -0.970511, 0.145819, 0.191951, 38.8179, 0.0676385, 0.92903, -0.36377, -89.8976, 0, 0, 0, 1),
            Qt.matrix4x4(-0.231357, -0.339849, -0.911579, 78.0765, -0.871679, 0.488515, 0.0391059, 3.40431, 0.43203, 0.803652, -0.409261, -93.7052, 0, 0, 0, 1),
            Qt.matrix4x4(-0.202038, -0.28551, -0.936837, 71.8861, -0.711094, 0.700521, -0.0601366, -23.4969, 0.673444, 0.654029, -0.344556, -92.3655, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.293945, -0.304408, -0.906053, 74.8648, -0.892299, 0.4272, 0.145956, 4.82405, 0.342636, 0.851373, -0.397196, -96.4741, 0, 0, 0, 1),
            Qt.matrix4x4(-0.315718, -0.359419, -0.878146, 80.7915, -0.675402, 0.73516, -0.0580699, -32.4443, 0.666449, 0.574768, -0.474855, -81.9507, 0, 0, 0, 1),
            Qt.matrix4x4(-0.344458, -0.384123, -0.85662, 84.1829, -0.340331, 0.901486, -0.26739, -61.2825, 0.874942, 0.199429, -0.441253, -55.4281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0448025, 6.21898e-16, -0.998996, 9.89894, -0.12283, 0.992412, 0.00550863, -150.495, 0.991416, 0.122954, -0.0444625, -10.87, 0, 0, 0, 1),
            Qt.matrix4x4(-0.201032, -0.0194452, -0.979392, 9.65669, -0.618165, 0.778109, 0.111437, -128.949, 0.759907, 0.627828, -0.168445, -77.6292, 0, 0, 0, 1),
            Qt.matrix4x4(-0.438852, -0.22402, -0.870186, 26.0986, -0.699624, 0.692886, 0.174458, -121.688, 0.563858, 0.685364, -0.460804, -62.5903, 0, 0, 0, 1),
            Qt.matrix4x4(-0.438852, -0.22402, -0.870186, 26.0986, -0.699624, 0.692886, 0.174458, -121.688, 0.563858, 0.685364, -0.460804, -35.8923, 0, 0, 0, 1),
            Qt.matrix4x4(-0.961328, 0.256879, 0.0993092, -83.7663, 0.275148, 0.911475, 0.305791, -97.0157, -0.0119665, 0.32129, -0.946905, -7.06583, 0, 0, 0, 1),
            Qt.matrix4x4(-0.959186, 0.238675, 0.151644, -83.6111, 0.269704, 0.61101, 0.744263, -80.6861, 0.0849809, 0.754785, -0.650444, -54.1111, 0, 0, 0, 1),
            Qt.matrix4x4(-0.962693, 0.188696, 0.193946, -80.1697, 0.256173, 0.404676, 0.877846, -64.7703, 0.0871603, 0.89478, -0.437918, -73.1816, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.287984, 0.350531, 0.891175, -53.1345, 0.885612, -0.451557, -0.108573, 107.393, 0.364358, 0.820503, -0.440475, -48.6586, 0, 0, 0, 1),
            Qt.matrix4x4(0.265866, 0.301248, 0.915732, -50.3733, 0.963208, -0.0442786, -0.265084, 76.0829, -0.0393085, 0.952517, -0.301937, -89.7415, 0, 0, 0, 1),
            Qt.matrix4x4(0.267647, 0.24755, 0.931173, -45.4748, 0.91924, 0.223996, -0.323766, 48.6478, -0.288727, 0.942627, -0.167606, -106.446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.146098, 0.394592, 0.907167, -63.379, 0.966398, -0.252972, -0.0456018, 88.6461, 0.211494, 0.883347, -0.418292, -65.8828, 0, 0, 0, 1),
            Qt.matrix4x4(0.135605, 0.351021, 0.926496, -60.3215, 0.972482, 0.131653, -0.192215, 55.2976, -0.189447, 0.927066, -0.323509, -94.4125, 0, 0, 0, 1),
            Qt.matrix4x4(0.133312, 0.362171, 0.922529, -61.4129, 0.897429, 0.350861, -0.267427, 31.8539, -0.420534, 0.863556, -0.278249, -100.869, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.231373, 0.34006, 0.911496, -78.0959, 0.970511, 0.145819, 0.191951, 38.8179, -0.0676385, 0.92903, -0.36377, -89.8976, 0, 0, 0, 1),
            Qt.matrix4x4(-0.231357, 0.339849, 0.911579, -78.0765, 0.871679, 0.488515, 0.0391059, 3.40431, -0.43203, 0.803652, -0.409261, -93.7052, 0, 0, 0, 1),
            Qt.matrix4x4(-0.202038, 0.28551, 0.936837, -71.8861, 0.711094, 0.700521, -0.0601366, -23.4969, -0.673444, 0.654029, -0.344556, -92.3655, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-0.293945, 0.304408, 0.906053, -74.8648, 0.892299, 0.4272, 0.145956, 4.82405, -0.342636, 0.851373, -0.397196, -96.4741, 0, 0, 0, 1),
            Qt.matrix4x4(-0.315718, 0.359419, 0.878146, -80.7915, 0.675402, 0.73516, -0.0580699, -32.4443, -0.666449, 0.574768, -0.474855, -81.9507, 0, 0, 0, 1),
            Qt.matrix4x4(-0.344458, 0.384123, 0.85662, -84.1829, 0.340331, 0.901486, -0.26739, -61.2825, -0.874942, 0.199429, -0.441253, -55.4281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(-1, -1.50421e-08, -1.24995e-08, 2.47621e-06, 7.61841e-09, 0.28903, -0.95732, -36.8308, 1.80128e-08, -0.95732, -0.28903, 153.206, 0, 0, 0, 1),
            Qt.matrix4x4(-1, -5.82632e-09, 5.44792e-09, 6.65496e-07, -5.81971e-09, 0.065841, -0.99783, 1.84694, 5.45499e-09, -0.99783, -0.065841, 171.406, 0, 0, 0, 1),
            Qt.matrix4x4(1, 2.34024e-10, -2.17085e-18, -3.38408, -2.34024e-10, 1, 5.55112e-17, -178.592, 2.17085e-18, -5.55112e-17, 1, -21.2827, 0, 0, 0, 1),
            Qt.matrix4x4(1, 2.34024e-10, 1.39555e-17, 3.38408, -2.34024e-10, 1, 8.32667e-17, -178.592, -1.39555e-17, -8.32667e-17, 1, -21.2827, 0, 0, 0, 1),
            Qt.matrix4x4(-1, 1.69174e-09, 2.99495e-10, -2.93649e-07, 1.71805e-09, 0.984689, 0.174323, -170.92, -9.93855e-17, 0.174323, -0.984689, -12.8829, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: sketchfab_model
        objectName: "Sketchfab_model"
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        scale: Qt.vector3d(0.0134608, 0.0134608, 0.0134608)
        Node {
            id: e781d2e811e44e6e8f9ae820e68cc7b4_fbx
            objectName: "e781d2e811e44e6e8f9ae820e68cc7b4.fbx"
            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
            Node {
                id: object_2
                objectName: "Object_2"
                Node {
                    id: rootNode
                    objectName: "RootNode"
                    Node {
                        id: object_4
                        objectName: "Object_4"
                        Node {
                            id: _rootJoint
                            objectName: "_rootJoint"
                            Node {
                                id: hips_01
                                objectName: "hips_01"
                                position: Qt.vector3d(0.00303421, 99.5592, 11.8538)
                                rotation: Qt.quaternion(-0.00521978, -0.00556977, 0.728937, -0.684538)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: l_leg_02
                                    objectName: "L_leg_02"
                                    position: Qt.vector3d(-11.1696, -0.0586629, 0.117165)
                                    rotation: Qt.quaternion(0.0595496, -0.0254315, 0.997901, 0.000227289)
                                    Node {
                                        id: l_knee_03
                                        objectName: "L_knee_03"
                                        position: Qt.vector3d(-7.10543e-15, -4.44089e-15, -40.7894)
                                        rotation: Qt.quaternion(0.993207, 0.11526, 0.015961, -0.00114591)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: l_ankle_04
                                            objectName: "L_ankle_04"
                                            position: Qt.vector3d(2.4869e-14, 2.4869e-14, -47.0491)
                                            rotation: Qt.quaternion(0.870913, -0.488178, -0.0526731, 0.0204775)
                                            Node {
                                                id: l_foot_05
                                                objectName: "L_foot_05"
                                                position: Qt.vector3d(-3.55271e-15, 2.22045e-14, -14.3216)
                                                rotation: Qt.quaternion(0.939819, -0.339059, -0.0396851, -0.0143172)
                                                Node {
                                                    id: l_toes_06
                                                    objectName: "L_toes_06"
                                                    position: Qt.vector3d(1.06581e-14, 1.02252e-13, -12.6325)
                                                    rotation: Qt.quaternion(1, 2.90046e-15, 4.71845e-16, 2.77556e-17)
                                                }
                                            }
                                        }
                                    }
                                }
                                Node {
                                    id: r_leg_07
                                    objectName: "R_leg_07"
                                    position: Qt.vector3d(11.1696, -0.0586629, 0.117165)
                                    rotation: Qt.quaternion(-0.0565823, 0.00116196, 0.998397, -0.00015163)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: r_knee_08
                                        objectName: "R_knee_08"
                                        position: Qt.vector3d(3.55271e-14, -2.84217e-14, -40.7894)
                                        rotation: Qt.quaternion(0.992562, 0.116994, -0.0204265, 0.0267533)
                                        Node {
                                            id: r_ankle_09
                                            objectName: "R_ankle_09"
                                            position: Qt.vector3d(-6.39488e-14, 3.90799e-14, -47.0491)
                                            rotation: Qt.quaternion(0.857747, -0.494049, -0.000534863, -0.142076)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: r_foot_010
                                                objectName: "R_foot_010"
                                                position: Qt.vector3d(-3.55271e-15, 2.4869e-14, -14.3216)
                                                rotation: Qt.quaternion(0.936551, -0.330621, -0.0850012, -0.079605)
                                                Node {
                                                    id: r_toes_011
                                                    objectName: "R_toes_011"
                                                    position: Qt.vector3d(-8.52651e-14, 8.88178e-14, -12.6325)
                                                    rotation: Qt.quaternion(1, 2.158e-15, 2.72005e-15, 1.47451e-16)
                                                }
                                            }
                                        }
                                    }
                                }
                                Node {
                                    id: spine_012
                                    objectName: "spine_012"
                                    position: Qt.vector3d(8.61811e-15, -9.97758e-07, -20.237)
                                    rotation: Qt.quaternion(0.995742, 0.0921812, -9.28711e-05, -8.01115e-06)
                                    Node {
                                        id: chest_013
                                        objectName: "chest_013"
                                        position: Qt.vector3d(-8.04912e-16, -1.49214e-13, -18.5845)
                                        rotation: Qt.quaternion(0.99916, -0.00667016, -0.00754345, -0.0397327)
                                        Node {
                                            id: l_shoulder_014
                                            objectName: "L_shoulder_014"
                                            position: Qt.vector3d(-7.26517, -0.610447, -14.0824)
                                            rotation: Qt.quaternion(0.325479, -0.504582, 0.596745, -0.532312)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: l_arm_015
                                                objectName: "L_arm_015"
                                                position: Qt.vector3d(4.44089e-15, 8.52651e-14, -11.6141)
                                                rotation: Qt.quaternion(0.857385, -0.464235, -0.191189, -0.113247)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: l_elbow_016
                                                    objectName: "L_elbow_016"
                                                    position: Qt.vector3d(3.55271e-15, -1.42109e-13, -25.8069)
                                                    rotation: Qt.quaternion(0.944515, -0.0318449, -0.222933, -0.239121)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: l_wrist_017
                                                        objectName: "L_wrist_017"
                                                        position: Qt.vector3d(1.42109e-14, -1.42109e-14, -26.698)
                                                        rotation: Qt.quaternion(0.959906, -0.125903, 0.12166, -0.218924)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                        Node {
                                                            id: l_thumb1_018
                                                            objectName: "L_thumb1_018"
                                                            position: Qt.vector3d(2.61013, -0.753882, -3.80658)
                                                            rotation: Qt.quaternion(0.777834, 0.184208, -0.375729, -0.468903)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: l_thumb2_019
                                                                objectName: "L_thumb2_019"
                                                                position: Qt.vector3d(-1.42109e-14, 0, -6.58986)
                                                                rotation: Qt.quaternion(0.963662, -0.265683, -0.0267288, -0.00736917)
                                                                Node {
                                                                    id: l_thumb3_020
                                                                    objectName: "L_thumb3_020"
                                                                    position: Qt.vector3d(1.24345e-14, 7.4607e-14, -4.34295)
                                                                    rotation: Qt.quaternion(0.991862, -0.12302, -0.0325368, -0.00403552)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: l_thumb4_021
                                                                        objectName: "L_thumb4_021"
                                                                        position: Qt.vector3d(-4.79616e-14, 2.66454e-14, -3.19883)
                                                                        rotation: Qt.quaternion(1, 2.48412e-15, 8.07687e-15, 1.66533e-16)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: l_point1_022
                                                            objectName: "L_point1_022"
                                                            position: Qt.vector3d(3.33949, 2.46821, -14.8479)
                                                            rotation: Qt.quaternion(-0.0986806, -0.00798587, 0.120645, 0.987747)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: l_point2_023
                                                                objectName: "L_point2_023"
                                                                position: Qt.vector3d(3.55271e-15, 1.06581e-14, -3.68068)
                                                                rotation: Qt.quaternion(0.974713, 0.221484, -0.0289316, 0.00657412)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: l_point3_024
                                                                    objectName: "L_point3_024"
                                                                    position: Qt.vector3d(-4.08562e-14, -1.77636e-14, -3.49062)
                                                                    rotation: Qt.quaternion(0.989897, 0.139003, -0.0276795, 0.00388681)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: l_point4_025
                                                                        objectName: "L_point4_025"
                                                                        position: Qt.vector3d(3.90799e-14, 6.03961e-14, -3.14452)
                                                                        rotation: Qt.quaternion(1, 4.85723e-15, -4.996e-15, -2.77556e-17)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: l_middle1_026
                                                            objectName: "L_middle1_026"
                                                            position: Qt.vector3d(-0.283424, 1.13868, -14.3809)
                                                            rotation: Qt.quaternion(-0.170404, -0.00209524, 0.203192, 0.964195)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: l_middle2_027
                                                                objectName: "L_middle2_027"
                                                                position: Qt.vector3d(-1.77636e-15, -1.42109e-14, -4.76661)
                                                                rotation: Qt.quaternion(0.964071, 0.26452, -0.0235338, 0.00645716)
                                                                Node {
                                                                    id: l_middle3_028
                                                                    objectName: "L_middle3_028"
                                                                    position: Qt.vector3d(-4.44089e-14, -1.06581e-14, -3.50473)
                                                                    rotation: Qt.quaternion(0.992537, 0.121799, 0.00598229, -0.000734114)
                                                                    Node {
                                                                        id: l_middle4_029
                                                                        objectName: "L_middle4_029"
                                                                        position: Qt.vector3d(1.42109e-14, -5.68434e-14, -3.23861)
                                                                        rotation: Qt.quaternion(1, -4.03844e-15, -9.99201e-16, -1.249e-16)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: l_ring1_030
                                                            objectName: "L_ring1_030"
                                                            position: Qt.vector3d(-2.83609, -0.674379, -13.489)
                                                            rotation: Qt.quaternion(-0.336871, 0.0510977, 0.338058, 0.877282)
                                                            Node {
                                                                id: l_ring2_031
                                                                objectName: "L_ring2_031"
                                                                position: Qt.vector3d(7.10543e-15, 3.73035e-14, -4.56064)
                                                                rotation: Qt.quaternion(0.980998, 0.194017, -0.000111502, 2.20523e-05)
                                                                Node {
                                                                    id: l_ring3_032
                                                                    objectName: "L_ring3_032"
                                                                    position: Qt.vector3d(-3.55271e-14, 2.84217e-14, -3.4635)
                                                                    rotation: Qt.quaternion(0.989325, 0.141857, -0.0330175, 0.0047343)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: l_ring4_033
                                                                        objectName: "L_ring4_033"
                                                                        position: Qt.vector3d(-4.26326e-14, -7.10543e-15, -3.02945)
                                                                        rotation: Qt.quaternion(1, 7.80626e-16, 4.94049e-15, -4.85723e-17)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: l_pink1_034
                                                            objectName: "L_pink1_034"
                                                            position: Qt.vector3d(-4.03933, -3.85527, -12.142)
                                                            rotation: Qt.quaternion(-0.368406, 0.0214893, 0.46138, 0.80681)
                                                            Node {
                                                                id: l_pink2_035
                                                                objectName: "L_pink2_035"
                                                                position: Qt.vector3d(-7.10543e-15, 6.75016e-14, -3.37303)
                                                                rotation: Qt.quaternion(0.976269, 0.214076, 0.0319481, -0.00700557)
                                                                Node {
                                                                    id: l_pink3_036
                                                                    objectName: "L_pink3_036"
                                                                    position: Qt.vector3d(4.61853e-14, -4.26326e-14, -2.36)
                                                                    rotation: Qt.quaternion(0.976529, 0.214281, 0.0212862, -0.00467085)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: l_pink4_037
                                                                        objectName: "L_pink4_037"
                                                                        position: Qt.vector3d(1.95399e-14, -1.42109e-14, -2.08661)
                                                                        rotation: Qt.quaternion(1, 8.72566e-15, -3.48332e-15, -5.55112e-17)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: r_shoulder_038
                                            objectName: "R_shoulder_038"
                                            position: Qt.vector3d(7.26517, -0.610447, -14.0824)
                                            rotation: Qt.quaternion(-0.325416, 0.507647, 0.596893, -0.529261)
                                            Node {
                                                id: r_arm_039
                                                objectName: "R_arm_039"
                                                position: Qt.vector3d(1.77636e-15, 0, -11.6141)
                                                rotation: Qt.quaternion(0.882846, -0.426359, 0.159155, 0.116064)
                                                Node {
                                                    id: r_elbow_040
                                                    objectName: "R_elbow_040"
                                                    position: Qt.vector3d(2.22045e-14, 5.68434e-14, -25.8069)
                                                    rotation: Qt.quaternion(0.956923, -0.0581564, 0.24238, 0.148891)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: r_wrist_041
                                                        objectName: "R_wrist_041"
                                                        position: Qt.vector3d(-2.84217e-14, 0, -26.698)
                                                        rotation: Qt.quaternion(0.984966, -0.107565, -0.0593429, 0.121452)
                                                        Node {
                                                            id: r_thumb1_042
                                                            objectName: "R_thumb1_042"
                                                            position: Qt.vector3d(-2.61013, -0.753882, -3.80658)
                                                            rotation: Qt.quaternion(0.777834, 0.184208, 0.375729, 0.468903)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: r_thumb2_043
                                                                objectName: "R_thumb2_043"
                                                                position: Qt.vector3d(3.19744e-14, 0, -6.58986)
                                                                rotation: Qt.quaternion(0.963662, -0.265683, 0.0267288, 0.00736917)
                                                                Node {
                                                                    id: r_thumb3_044
                                                                    objectName: "R_thumb3_044"
                                                                    position: Qt.vector3d(-1.42109e-14, 9.9476e-14, -4.34295)
                                                                    rotation: Qt.quaternion(0.991862, -0.12302, 0.0325368, 0.00403552)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: r_thumb4_045
                                                                        objectName: "R_thumb4_045"
                                                                        position: Qt.vector3d(7.4607e-14, 3.55271e-15, -3.19883)
                                                                        rotation: Qt.quaternion(1, 3.1225e-15, -8.1081e-15, -1.38778e-16)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: r_point1_046
                                                            objectName: "R_point1_046"
                                                            position: Qt.vector3d(-3.33949, 2.46821, -14.8479)
                                                            rotation: Qt.quaternion(0.0986806, 0.00798587, 0.120645, 0.987747)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: r_point2_047
                                                                objectName: "R_point2_047"
                                                                position: Qt.vector3d(1.06581e-14, -5.68434e-14, -3.68068)
                                                                rotation: Qt.quaternion(0.974713, 0.221484, 0.0289316, -0.00657411)
                                                                scale: Qt.vector3d(1, 1, 1)
                                                                Node {
                                                                    id: r_point3_048
                                                                    objectName: "R_point3_048"
                                                                    position: Qt.vector3d(2.24382e-08, -3.08511e-09, -3.49062)
                                                                    rotation: Qt.quaternion(0.989897, 0.139003, 0.0276795, -0.00388681)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: r_point4_049
                                                                        objectName: "R_point4_049"
                                                                        position: Qt.vector3d(6.386e-12, -1.25056e-12, -3.14452)
                                                                        rotation: Qt.quaternion(1, -2.03032e-13, -1.01583e-12, -7.45058e-09)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: r_middle1_050
                                                            objectName: "R_middle1_050"
                                                            position: Qt.vector3d(0.283424, 1.13868, -14.3809)
                                                            rotation: Qt.quaternion(0.170404, 0.00209524, 0.203192, 0.964195)
                                                            scale: Qt.vector3d(1, 1, 1)
                                                            Node {
                                                                id: r_middle2_051
                                                                objectName: "R_middle2_051"
                                                                position: Qt.vector3d(-3.90799e-14, 7.4607e-14, -4.76661)
                                                                rotation: Qt.quaternion(0.978296, 0.205772, 0.0238811, -0.00502307)
                                                                Node {
                                                                    id: r_middle3_052
                                                                    objectName: "R_middle3_052"
                                                                    position: Qt.vector3d(3.55271e-14, -2.84217e-14, -3.50473)
                                                                    rotation: Qt.quaternion(0.992537, 0.121799, -0.00598229, 0.000734114)
                                                                    Node {
                                                                        id: r_middle4_053
                                                                        objectName: "R_middle4_053"
                                                                        position: Qt.vector3d(-2.13163e-14, -3.55271e-14, -3.23861)
                                                                        rotation: Qt.quaternion(1, -4.09395e-15, 8.32667e-16, -1.11022e-16)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: r_ring1_054
                                                            objectName: "R_ring1_054"
                                                            position: Qt.vector3d(2.83609, -0.674379, -13.489)
                                                            rotation: Qt.quaternion(0.336871, -0.0510977, 0.338058, 0.877282)
                                                            Node {
                                                                id: r_ring2_00
                                                                objectName: "R_ring2_00"
                                                                position: Qt.vector3d(-1.06581e-14, 2.4869e-14, -4.56064)
                                                                rotation: Qt.quaternion(0.980998, 0.194017, 0.000111502, -2.20523e-05)
                                                                Node {
                                                                    id: r_ring3_055
                                                                    objectName: "R_ring3_055"
                                                                    position: Qt.vector3d(3.55271e-14, 2.84217e-14, -3.4635)
                                                                    rotation: Qt.quaternion(0.989325, 0.141857, 0.0330175, -0.0047343)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: r_ring4_056
                                                                        objectName: "R_ring4_056"
                                                                        position: Qt.vector3d(6.75016e-14, -2.84217e-14, -3.02945)
                                                                        rotation: Qt.quaternion(1, 1.05211e-15, -4.7462e-15, 2.08167e-17)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Node {
                                                            id: r_pink1_057
                                                            objectName: "R_pink1_057"
                                                            position: Qt.vector3d(4.03933, -3.85527, -12.142)
                                                            rotation: Qt.quaternion(0.368406, -0.0214893, 0.46138, 0.80681)
                                                            Node {
                                                                id: r_pink2_058
                                                                objectName: "R_pink2_058"
                                                                position: Qt.vector3d(4.26326e-14, -6.39488e-14, -3.37303)
                                                                rotation: Qt.quaternion(0.976269, 0.214076, -0.0319481, 0.00700557)
                                                                Node {
                                                                    id: r_pink3_059
                                                                    objectName: "R_pink3_059"
                                                                    position: Qt.vector3d(-4.44089e-14, -4.26326e-14, -2.36)
                                                                    rotation: Qt.quaternion(0.976529, 0.214281, -0.0212862, 0.00467085)
                                                                    scale: Qt.vector3d(1, 1, 1)
                                                                    Node {
                                                                        id: r_pink4_060
                                                                        objectName: "R_pink4_060"
                                                                        position: Qt.vector3d(-3.90799e-14, 2.84217e-14, -2.08661)
                                                                        rotation: Qt.quaternion(1, 9.07434e-15, 3.91354e-15, 1.04083e-16)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: neck_061
                                            objectName: "neck_061"
                                            position: Qt.vector3d(1.88738e-15, 0, -20.787)
                                            rotation: Qt.quaternion(0.962506, -0.271235, -0.00256509, -0.00259507)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: head_062
                                                objectName: "head_062"
                                                position: Qt.vector3d(-4.44089e-16, -3.55271e-14, -14.207)
                                                rotation: Qt.quaternion(0.969132, 0.174879, -0.0706849, 0.158755)
                                                Node {
                                                    id: l_eye_063
                                                    objectName: "L_eye_063"
                                                    position: Qt.vector3d(-3.38408, -7.63093, -8.19899)
                                                    rotation: Qt.quaternion(7.75511e-11, -3.90287e-09, 0.730014, -0.683432)
                                                }
                                                Node {
                                                    id: r_eye_064
                                                    objectName: "R_eye_064"
                                                    position: Qt.vector3d(3.38408, -7.63093, -8.19899)
                                                    rotation: Qt.quaternion(7.75514e-11, -3.90287e-09, 0.730014, -0.683432)
                                                }
                                                Node {
                                                    id: jaw_065
                                                    objectName: "jaw_065"
                                                    position: Qt.vector3d(-2.34966e-07, -3.99652, 0.100868)
                                                    rotation: Qt.quaternion(0.682642, -0.730734, 0.00525178, 0.000980343)
                                                    Node {
                                                        id: lip_066
                                                        objectName: "lip_066"
                                                        position: Qt.vector3d(0, -0.0420012, -7.06836)
                                                        rotation: Qt.quaternion(0.999996, -0.00297103, 5.54181e-17, 3.13898e-17)
                                                    }
                                                }
                                                Node {
                                                    id: tip_067
                                                    objectName: "tip_067"
                                                    position: Qt.vector3d(5.32907e-15, 0, -18.0547)
                                                    rotation: Qt.quaternion(1, 1.38778e-17, 5.20417e-18, 1.38778e-17)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Model {
                            id: object_7
                            objectName: "Object_7"
                            source: "meshes/mesh_zombie1_0_mesh.mesh"
                            skin: skin
                            materials: [
                                zombie1_material
                            ]
                        }
                        Node {
                            id: object_6
                            objectName: "Object_6"
                            position: Qt.vector3d(3.02923e-28, 1.42109e-14, 0)
                            rotation: Qt.quaternion(1, 0, -8.97329e-30, 0)
                        }
                        Node {
                            id: root83
                            objectName: "Root"
                            Node {
                                id: master
                                objectName: "Master"
                                Node {
                                    id: l_FOOTcontrol
                                    objectName: "L_FOOTcontrol"
                                    position: Qt.vector3d(14.2668, 14.116, -4.00514)
                                    rotation: Qt.quaternion(0.997801, 0, -0.0662739, 0)
                                }
                                Node {
                                    id: r_FOOTcontrol
                                    objectName: "R_FOOTcontrol"
                                    position: Qt.vector3d(-13.9338, 14.0707, -2.85836)
                                    rotation: Qt.quaternion(0.99824, -4.41867e-10, 0.0593064, -7.43747e-09)
                                }
                            }
                        }
                        Node {
                            id: mesh
                            objectName: "mesh"
                        }
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: idlewalk_timeline
        objectName: "idlewalk"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 7034
        currentFrame: 0
        enabled: true
        animations: TimelineAnimation {
            duration: 7034
            from: 0
            to: 7034
            running: true
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: l_FOOTcontrol
            property: "position"
            keyframeSource: "animations/l_FOOTcontrol_position_0.qad"
        }
        KeyframeGroup {
            target: l_FOOTcontrol
            property: "rotation"
            keyframeSource: "animations/l_FOOTcontrol_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_ankle_09
            property: "position"
            keyframeSource: "animations/r_ankle_09_position_0.qad"
        }
        KeyframeGroup {
            target: r_ankle_09
            property: "rotation"
            keyframeSource: "animations/r_ankle_09_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_FOOTcontrol
            property: "position"
            keyframeSource: "animations/r_FOOTcontrol_position_0.qad"
        }
        KeyframeGroup {
            target: r_FOOTcontrol
            property: "rotation"
            keyframeSource: "animations/r_FOOTcontrol_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_knee_08
            property: "position"
            keyframeSource: "animations/r_knee_08_position_0.qad"
        }
        KeyframeGroup {
            target: r_knee_08
            property: "rotation"
            keyframeSource: "animations/r_knee_08_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_leg_07
            property: "rotation"
            keyframeSource: "animations/r_leg_07_rotation_0.qad"
        }
        KeyframeGroup {
            target: master
            property: "position"
            keyframeSource: "animations/master_position_0.qad"
        }
        KeyframeGroup {
            target: spine_012
            property: "position"
            keyframeSource: "animations/spine_012_position_0.qad"
        }
        KeyframeGroup {
            target: spine_012
            property: "rotation"
            keyframeSource: "animations/spine_012_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_ankle_04
            property: "position"
            keyframeSource: "animations/l_ankle_04_position_0.qad"
        }
        KeyframeGroup {
            target: l_ankle_04
            property: "rotation"
            keyframeSource: "animations/l_ankle_04_rotation_0.qad"
        }
        KeyframeGroup {
            target: hips_01
            property: "position"
            keyframeSource: "animations/hips_01_position_0.qad"
        }
        KeyframeGroup {
            target: hips_01
            property: "rotation"
            keyframeSource: "animations/hips_01_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_knee_03
            property: "position"
            keyframeSource: "animations/l_knee_03_position_0.qad"
        }
        KeyframeGroup {
            target: l_knee_03
            property: "rotation"
            keyframeSource: "animations/l_knee_03_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_leg_02
            property: "rotation"
            keyframeSource: "animations/l_leg_02_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_thumb3_020
            property: "position"
            keyframeSource: "animations/l_thumb3_020_position_0.qad"
        }
        KeyframeGroup {
            target: l_thumb3_020
            property: "rotation"
            keyframeSource: "animations/l_thumb3_020_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_thumb2_019
            property: "position"
            keyframeSource: "animations/l_thumb2_019_position_0.qad"
        }
        KeyframeGroup {
            target: l_thumb2_019
            property: "rotation"
            keyframeSource: "animations/l_thumb2_019_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_point2_023
            property: "position"
            keyframeSource: "animations/l_point2_023_position_0.qad"
        }
        KeyframeGroup {
            target: l_point2_023
            property: "rotation"
            keyframeSource: "animations/l_point2_023_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_middle3_028
            property: "position"
            keyframeSource: "animations/l_middle3_028_position_0.qad"
        }
        KeyframeGroup {
            target: l_middle3_028
            property: "rotation"
            keyframeSource: "animations/l_middle3_028_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_middle2_027
            property: "position"
            keyframeSource: "animations/l_middle2_027_position_0.qad"
        }
        KeyframeGroup {
            target: l_middle2_027
            property: "rotation"
            keyframeSource: "animations/l_middle2_027_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_ring3_032
            property: "position"
            keyframeSource: "animations/l_ring3_032_position_0.qad"
        }
        KeyframeGroup {
            target: l_ring3_032
            property: "rotation"
            keyframeSource: "animations/l_ring3_032_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_ring2_031
            property: "position"
            keyframeSource: "animations/l_ring2_031_position_0.qad"
        }
        KeyframeGroup {
            target: l_ring2_031
            property: "rotation"
            keyframeSource: "animations/l_ring2_031_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_ring1_030
            property: "rotation"
            keyframeSource: "animations/l_ring1_030_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_pink3_036
            property: "position"
            keyframeSource: "animations/l_pink3_036_position_0.qad"
        }
        KeyframeGroup {
            target: l_pink3_036
            property: "rotation"
            keyframeSource: "animations/l_pink3_036_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_pink2_035
            property: "position"
            keyframeSource: "animations/l_pink2_035_position_0.qad"
        }
        KeyframeGroup {
            target: l_pink2_035
            property: "rotation"
            keyframeSource: "animations/l_pink2_035_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_pink1_034
            property: "rotation"
            keyframeSource: "animations/l_pink1_034_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_wrist_017
            property: "position"
            keyframeSource: "animations/l_wrist_017_position_0.qad"
        }
        KeyframeGroup {
            target: l_wrist_017
            property: "rotation"
            keyframeSource: "animations/l_wrist_017_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_elbow_016
            property: "position"
            keyframeSource: "animations/l_elbow_016_position_0.qad"
        }
        KeyframeGroup {
            target: l_elbow_016
            property: "rotation"
            keyframeSource: "animations/l_elbow_016_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_arm_015
            property: "position"
            keyframeSource: "animations/l_arm_015_position_0.qad"
        }
        KeyframeGroup {
            target: l_arm_015
            property: "rotation"
            keyframeSource: "animations/l_arm_015_rotation_0.qad"
        }
        KeyframeGroup {
            target: l_shoulder_014
            property: "rotation"
            keyframeSource: "animations/l_shoulder_014_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_thumb3_044
            property: "position"
            keyframeSource: "animations/r_thumb3_044_position_0.qad"
        }
        KeyframeGroup {
            target: r_thumb3_044
            property: "rotation"
            keyframeSource: "animations/r_thumb3_044_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_thumb1_042
            property: "rotation"
            keyframeSource: "animations/r_thumb1_042_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_point2_047
            property: "position"
            keyframeSource: "animations/r_point2_047_position_0.qad"
        }
        KeyframeGroup {
            target: r_point2_047
            property: "rotation"
            keyframeSource: "animations/r_point2_047_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_point1_046
            property: "rotation"
            keyframeSource: "animations/r_point1_046_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_middle3_052
            property: "position"
            keyframeSource: "animations/r_middle3_052_position_0.qad"
        }
        KeyframeGroup {
            target: r_middle3_052
            property: "rotation"
            keyframeSource: "animations/r_middle3_052_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_middle2_051
            property: "position"
            keyframeSource: "animations/r_middle2_051_position_0.qad"
        }
        KeyframeGroup {
            target: r_middle2_051
            property: "rotation"
            keyframeSource: "animations/r_middle2_051_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_middle1_050
            property: "rotation"
            keyframeSource: "animations/r_middle1_050_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_ring3_055
            property: "position"
            keyframeSource: "animations/r_ring3_055_position_0.qad"
        }
        KeyframeGroup {
            target: r_ring3_055
            property: "rotation"
            keyframeSource: "animations/r_ring3_055_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_ring2_00
            property: "position"
            keyframeSource: "animations/r_ring2_00_position_0.qad"
        }
        KeyframeGroup {
            target: r_ring2_00
            property: "rotation"
            keyframeSource: "animations/r_ring2_00_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_ring1_054
            property: "rotation"
            keyframeSource: "animations/r_ring1_054_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_pink3_059
            property: "position"
            keyframeSource: "animations/r_pink3_059_position_0.qad"
        }
        KeyframeGroup {
            target: r_pink3_059
            property: "rotation"
            keyframeSource: "animations/r_pink3_059_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_pink2_058
            property: "position"
            keyframeSource: "animations/r_pink2_058_position_0.qad"
        }
        KeyframeGroup {
            target: r_pink2_058
            property: "rotation"
            keyframeSource: "animations/r_pink2_058_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_pink1_057
            property: "rotation"
            keyframeSource: "animations/r_pink1_057_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_wrist_041
            property: "position"
            keyframeSource: "animations/r_wrist_041_position_0.qad"
        }
        KeyframeGroup {
            target: r_wrist_041
            property: "rotation"
            keyframeSource: "animations/r_wrist_041_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_elbow_040
            property: "position"
            keyframeSource: "animations/r_elbow_040_position_0.qad"
        }
        KeyframeGroup {
            target: r_elbow_040
            property: "rotation"
            keyframeSource: "animations/r_elbow_040_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_arm_039
            property: "position"
            keyframeSource: "animations/r_arm_039_position_0.qad"
        }
        KeyframeGroup {
            target: r_arm_039
            property: "rotation"
            keyframeSource: "animations/r_arm_039_rotation_0.qad"
        }
        KeyframeGroup {
            target: r_shoulder_038
            property: "rotation"
            keyframeSource: "animations/r_shoulder_038_rotation_0.qad"
        }
        KeyframeGroup {
            target: jaw_065
            property: "rotation"
            keyframeSource: "animations/jaw_065_rotation_0.qad"
        }
        KeyframeGroup {
            target: head_062
            property: "position"
            keyframeSource: "animations/head_062_position_0.qad"
        }
        KeyframeGroup {
            target: head_062
            property: "rotation"
            keyframeSource: "animations/head_062_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck_061
            property: "position"
            keyframeSource: "animations/neck_061_position_0.qad"
        }
        KeyframeGroup {
            target: neck_061
            property: "rotation"
            keyframeSource: "animations/neck_061_rotation_0.qad"
        }
        KeyframeGroup {
            target: chest_013
            property: "position"
            keyframeSource: "animations/chest_013_position_0.qad"
        }
        KeyframeGroup {
            target: chest_013
            property: "rotation"
            keyframeSource: "animations/chest_013_rotation_0.qad"
        }
    }
}
