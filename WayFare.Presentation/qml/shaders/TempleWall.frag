float templeHash(vec2 p)
{
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float templeNoise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);
    vec2 s = f * f * (3.0 - 2.0 * f);
    float a = templeHash(i);
    float b = templeHash(i + vec2(1.0, 0.0));
    float c = templeHash(i + vec2(0.0, 1.0));
    float d = templeHash(i + vec2(1.0, 1.0));
    return mix(mix(a, b, s.x), mix(c, d, s.x), s.y);
}

float templeFbm(vec2 p)
{
    float value = 0.0;
    float amplitude = 0.5;
    for (int i = 0; i < 3; i++) {
        value += amplitude * templeNoise(p);
        p = p * 2.03 + vec2(17.0, 9.0);
        amplitude *= 0.5;
    }
    return value / 0.875;
}

void templeHole(vec2 local, vec2 size, vec2 center, float radius, inout float hole, inout vec2 rim)
{
    vec2 d = (local - center) * size;
    float dist = length(d);
    hole = max(hole, 1.0 - smoothstep(radius * 0.55, radius, dist));
    if (dist > 0.0001) {
        float weight = (1.0 - smoothstep(radius * 0.4, radius * 1.4, dist)) * smoothstep(0.0, radius * 0.6, dist);
        rim -= d / dist * weight;
    }
}

void MAIN()
{
    vec3 n = normalize(NORMAL);
    vec3 t = vec3(1.0, 0.0, 0.0);
    vec3 b = vec3(0.0, 0.0, 1.0);
    if (abs(n.y) < 0.5) {
        b = vec3(0.0, 1.0, 0.0);
        t = normalize(cross(b, n));
    }

    vec2 uv = UV0 * uvScale;
    vec3 albedo = texture(diffuseMap, uv).rgb;
    vec3 mapNormal = texture(normalMap, uv).rgb * 2.0 - 1.0;
    float roughness = texture(roughnessMap, uv).r;

    vec2 p = vec2(dot(VAR_WORLD_POSITION, t), dot(VAR_WORLD_POSITION, b));
    vec2 brickSize = vec2(0.5, 0.22);
    float row = floor(p.y / brickSize.y);
    float shift = mod(row, 2.0) * 0.5;
    vec2 cell = vec2(floor(p.x / brickSize.x + shift), row);
    vec2 local = vec2(fract(p.x / brickSize.x + shift), fract(p.y / brickSize.y));
    vec2 edge = min(local, 1.0 - local) * brickSize;
    float edgeDistance = min(edge.x, edge.y);
    float mortar = 1.0 - smoothstep(0.008, 0.014, edgeDistance);
    float bevel = (1.0 - smoothstep(0.014, 0.05, edgeDistance)) * (1.0 - mortar);

    vec2 tilt = vec2(0.0);
    if (edge.x < edge.y) {
        tilt.x = local.x < 0.5 ? -1.0 : 1.0;
    } else {
        tilt.y = local.y < 0.5 ? -1.0 : 1.0;
    }

    float h1 = templeHash(cell);
    float h2 = templeHash(cell + vec2(41.0, 7.0));
    float h3 = templeHash(cell + vec2(13.0, 29.0));
    float hole = 0.0;
    vec2 rim = vec2(0.0);
    if (h1 < 0.3) {
        templeHole(local, brickSize, vec2(0.2 + 0.6 * h2, 0.3 + 0.4 * h3), 0.025 + 0.025 * fract(h2 * 7.0), hole, rim);
    }
    if (h1 > 0.9) {
        templeHole(local, brickSize, vec2(0.2 + 0.6 * h3, 0.3 + 0.4 * h2), 0.02, hole, rim);
    }
    hole *= 1.0 - mortar;
    rim *= 1.0 - mortar;

    float vein = 1.0 - smoothstep(0.0, 0.018, abs(templeFbm(p * 2.5 + vec2(3.0, 1.0)) - 0.5));
    vein *= 1.0 - mortar;

    float shade = 0.8 + 0.28 * templeHash(cell + vec2(5.0, 3.0));
    vec3 tint = mix(vec3(1.0), vec3(0.92, 1.0, 0.96), templeHash(cell + vec2(8.0, 2.0)));
    vec3 color = pow(albedo, vec3(1.15)) * 1.08 * shade * tint;
    color = mix(color, color * vec3(0.5, 0.58, 0.52), vein);
    color = mix(color, albedo * 0.35, mortar);
    color = mix(color, color * 0.15, hole);

    float y = VAR_WORLD_POSITION.y;
    float contact = mix(0.55, 1.0, smoothstep(0.0, 0.35, y)) * mix(0.65, 1.0, smoothstep(0.0, 0.35, wallTop - y));

    vec3 shaped = t * mapNormal.x * 1.6 + b * mapNormal.y * 1.6 + n * mapNormal.z;
    shaped += (t * tilt.x + b * tilt.y) * bevel * 0.6;
    shaped += (t * rim.x + b * rim.y) * 0.8;

    NORMAL = normalize(shaped);
    BASE_COLOR = vec4(color * contact, 1.0);
    ROUGHNESS = clamp(roughness + 0.1 * mortar, 0.0, 1.0);
    SPECULAR_AMOUNT = 0.3;
}
