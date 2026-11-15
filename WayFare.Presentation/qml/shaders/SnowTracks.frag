float snowHash(vec2 p)
{
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float snowNoise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);
    vec2 s = f * f * (3.0 - 2.0 * f);
    float a = snowHash(i);
    float b = snowHash(i + vec2(1.0, 0.0));
    float c = snowHash(i + vec2(0.0, 1.0));
    float d = snowHash(i + vec2(1.0, 1.0));
    return mix(mix(a, b, s.x), mix(c, d, s.x), s.y);
}

float snowPrint(vec2 local, float size, float tread)
{
    float sole = 1.0 - smoothstep(0.75, 1.0, length(vec2((local.x - 0.16 * size) / (0.34 * size), local.y / (0.19 * size))));
    float heel = 1.0 - smoothstep(0.75, 1.0, length(vec2((local.x + 0.3 * size) / (0.2 * size), local.y / (0.16 * size))));
    float print = max(sole, heel);
    if (tread > 0.5) {
        float ridge = step(0.5, fract(local.x / (size * 0.09)));
        print *= 0.7 + 0.3 * ridge;
    }
    if (tread > 1.5) {
        float dots = step(0.55, snowHash(floor(local * 40.0 / size)));
        print *= 0.8 + 0.2 * dots;
    }
    return print;
}

float snowSteps(float along, float across, float len, float size, float stride, float seed, float tread)
{
    float result = 0.0;
    float nearest = floor(along / stride + 0.5);
    for (int i = -1; i <= 1; i++) {
        float k = nearest + float(i);
        float at = k * stride;
        if (at < 0.0 || at > len) {
            continue;
        }
        float jitter = snowHash(vec2(k, seed)) - 0.5;
        float foot = mod(k + seed, 2.0) < 1.0 ? -1.0 : 1.0;
        vec2 d = vec2(along - at, across - foot * size * 0.32 - jitter * size * 0.12);
        float angle = foot * 0.1 + jitter * 0.2;
        vec2 turned = vec2(d.x * cos(angle) - d.y * sin(angle), d.x * sin(angle) + d.y * cos(angle));
        result = max(result, snowPrint(turned, size, tread));
    }
    return result;
}

float snowSegment(vec2 p, vec2 a, vec2 b, float size, float stride, float seed, float tread)
{
    vec2 dir = normalize(b - a);
    vec2 side = vec2(-dir.y, dir.x);
    float len = length(b - a);
    vec2 q = p - a;
    float along = dot(q, dir);
    if (along < -size || along > len + size) {
        return 0.0;
    }
    float across = dot(q, side);
    if (abs(across) > size * 1.5) {
        return 0.0;
    }
    return snowSteps(along, across, len, size, stride, seed, tread);
}

float snowRing(vec2 p, vec2 center, float radius, float size, float stride, float seed)
{
    vec2 d = p - center;
    float across = length(d) - radius;
    if (abs(across) > size * 1.5) {
        return 0.0;
    }
    float angle = mod(atan(d.y, d.x) + 1.5708, 6.28318);
    return snowSteps(angle * radius, across, 5.24 * radius, size, stride, seed, 2.0);
}

float snowTrail(vec2 p, float index)
{
    float h1 = snowHash(vec2(index, 3.0));
    float h2 = snowHash(vec2(index, 11.0));
    float h3 = snowHash(vec2(index, 17.0));

    vec2 start = vec2(-15.0 + index * 3.4 + (h1 - 0.5) * 2.0, -24.0 - h2 * 6.0);
    float pierOffset = (h3 - 0.5) * 0.8;
    vec2 root = vec2(pierOffset, -15.5);
    vec2 pierEnd = vec2(pierOffset * 0.7, -2.4);
    vec2 hole = vec2(0.1 + (h1 - 0.5) * 0.6, -0.7);

    float size = 0.24 + h2 * 0.1;
    float stride = 0.48 + h1 * 0.14;
    float tread = floor(h3 * 3.0);
    if (index > 7.5) {
        size = 0.42;
        stride = 0.8;
        tread = 1.0;
    }
    if (index < 0.5) {
        start = vec2(-6.0, -26.0);
        size = 0.21;
        stride = 0.42;
        tread = 2.0;
    }

    float seed = index * 7.0;
    float prints = snowSegment(p, start, root, size, stride, seed, tread);
    prints = max(prints, snowSegment(p, root, pierEnd, size, stride, seed + 1.0, tread));
    prints = max(prints, snowSegment(p, pierEnd, hole, size, stride, seed + 2.0, tread));
    return prints;
}

float snowEdge(vec2 d, float scale)
{
    vec2 around = normalize(d) * scale;
    return snowNoise(around + vec2(7.0, 3.0)) * 0.7 + snowNoise(around * 3.1 + vec2(1.0, 9.0)) * 0.3 - 0.5;
}

void MAIN()
{
    vec3 n = normalize(NORMAL);
    vec2 world = VAR_WORLD_POSITION.xz;

    vec2 lake = (world - lakeCenter) / lakeRadius;
    float lakeDistance = length(lake) * (1.0 + snowEdge(lake, 3.0) * 0.16);
    if (lakeCut > 0.5 && lakeDistance < 1.0) {
        discard;
    }

    vec2 fromHole = world - holeCenter;
    float holeDistance = length(fromHole);
    float holeEdge = holeRadius * (1.0 + snowEdge(fromHole, 2.6) * 0.5);
    float outside = holeDistance - holeEdge;
    if (n.y > 0.5 && outside < 0.0) {
        discard;
    }

    vec2 uv = world * uvScale;
    vec3 albedo = texture(diffuseMap, uv).rgb;
    vec3 mapNormal = texture(normalMap, uv).rgb * 2.0 - 1.0;
    float roughness = texture(roughnessMap, uv).r;

    float depth = 0.0;
    float fresh = 0.0;
    if (n.y > 0.5) {
        for (int i = 1; i < 11; i++) {
            float age = 0.1 + 0.5 * snowHash(vec2(float(i), 29.0));
            depth = max(depth, snowTrail(world, float(i)) * (1.0 - age));
        }
        depth = max(depth, snowRing(world, holeCenter, holeRadius + 0.6, 0.21, 0.42, 3.0) * 0.45);
        fresh = snowTrail(world, 0.0);
        depth = max(depth, fresh);
    }

    vec3 dpdx = dFdx(VAR_WORLD_POSITION);
    vec3 dpdy = dFdy(VAR_WORLD_POSITION);
    float dhx = dFdx(depth);
    float dhy = dFdy(depth);
    vec3 r1 = cross(dpdy, n);
    vec3 r2 = cross(n, dpdx);
    float det = dot(dpdx, r1);
    vec3 grad = sign(det) * (dhx * r1 + dhy * r2);
    vec3 shaped = vec3(1.0, 0.0, 0.0) * mapNormal.x + vec3(0.0, 0.0, 1.0) * mapNormal.y + n * mapNormal.z;
    shaped = normalize(shaped * abs(det) + grad * 0.12);

    vec3 color = albedo * 1.05;
    color = mix(color, color * vec3(0.32, 0.4, 0.58), depth * 0.85);
    color = mix(color, color * vec3(0.4, 0.48, 0.62), fresh * 0.35);

    float shore = lakeCut > 0.5 ? 1.0 - smoothstep(1.0, 1.07, lakeDistance) : 0.0;
    color = mix(color, color * vec3(0.72, 0.78, 0.86), shore);

    float wet = n.y > 0.5 ? 1.0 - smoothstep(0.0, 0.35, outside) : 0.0;
    float crackNoise = snowNoise(vec2(atan(fromHole.y, fromHole.x) * 4.0, holeDistance * 1.3));
    float crack = (1.0 - smoothstep(0.0, 0.025, abs(crackNoise - 0.5))) * (1.0 - smoothstep(0.0, 1.8, outside));
    if (n.y < 0.5) {
        crack = 0.0;
    }
    color = mix(color, vec3(0.3, 0.4, 0.47), wet * 0.85);
    color = mix(color, color * vec3(0.35, 0.45, 0.55), crack * 0.8);

    NORMAL = normalize(mix(n, shaped, 0.9 * (1.0 - wet)));
    BASE_COLOR = vec4(color, 1.0);
    ROUGHNESS = mix(clamp(roughness + depth * 0.1, 0.0, 1.0), 0.12, wet);
    SPECULAR_AMOUNT = mix(0.25, 0.8, wet);
}
