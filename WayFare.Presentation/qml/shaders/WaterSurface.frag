vec2 waterSlope(vec2 uv)
{
    float e = 1.0 / 512.0;
    float hx = texture(heightMap, uv + vec2(e, 0.0)).r - texture(heightMap, uv - vec2(e, 0.0)).r;
    float hz = texture(heightMap, uv + vec2(0.0, e)).r - texture(heightMap, uv - vec2(0.0, e)).r;
    return vec2(hx, hz);
}

void MAIN()
{
    vec2 world = VAR_WORLD_POSITION.xz;
    vec2 slope = waterSlope(world * waveScale + vec2(time * 0.011, time * 0.006));
    slope += waterSlope(world * waveScale * 1.7 + vec2(-time * 0.008, time * 0.013)) * 0.7;

    vec3 normal = normalize(vec3(-slope.x * waveStrength, 1.0, -slope.y * waveStrength));
    float facing = max(dot(normal, normalize(VIEW_VECTOR)), 0.0);
    float fresnel = pow(1.0 - facing, 4.0);

    NORMAL = normal;
    BASE_COLOR = vec4(deepColor.rgb, 1.0);
    EMISSIVE_COLOR = skyColor.rgb * (0.08 + fresnel * 0.9);
    ROUGHNESS = 0.06;
    METALNESS = 0.0;
    SPECULAR_AMOUNT = 1.0;
}
