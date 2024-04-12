package com.apx.radiance.util;
import com.apx.radiance.dto.AuthDto;
import io.fusionauth.jwt.Signer;
import io.fusionauth.jwt.Verifier;
import io.fusionauth.jwt.domain.JWT;
import io.fusionauth.jwt.hmac.HMACSigner;
import io.fusionauth.jwt.hmac.HMACVerifier;

import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JwtTokenUtil {

    private static final String CLAIM_KEY_USERNAME = "sub";
    private static final String CLAIM_KEY_CREATED = "created";
    private static final String ISSUER = "www.jiat.lk";
    private static final String SECRET = "w/abyYF_$:7%tSnq=fqX2PL]!z$?F@xvhchaCqH%mjYSbh;utK+FUL,K2EQ4eV4v";
    private static final Long TOKEN_LIFE = 30000L;
    private static final Long REFRESH_TOKEN_LIFE = 43200L;

    private String generateToken(Map<String, String> claims, Long expiration, String subject) {

        // Build an HMAC signer using a SHA-256 hash
        Signer signer = HMACSigner.newSHA256Signer(SECRET);

        // Build a new JWT with an issuer(iss), issued at(iat), subject(sub) and expiration(exp)
        JWT jwt = new JWT().setIssuer(ISSUER)
                .setIssuedAt(ZonedDateTime.now(ZoneOffset.UTC))
                .setSubject(subject)
                .setExpiration(ZonedDateTime.now(ZoneOffset.UTC).plusMinutes(expiration));

        claims.keySet().forEach(k -> {
            if (claims.get(k) != null) {
                jwt.addClaim(k, claims.get(k));
            }
        });

        return JWT.getEncoder().encode(jwt, signer);

    }

    public Map<String, String> getClaimsFromToken(String token) {

        // Build an HMC verifier using the same secret that was used to sign the JWT
        Verifier verifier = HMACVerifier.newVerifier(SECRET);

        // Verify and decode the encoded string JWT to a rich object
        JWT jwt = JWT.getDecoder().decode(token, verifier);

        Map<String, String> claims = new HashMap<>();
        if (jwt != null) {
            jwt.getAllClaims().forEach((k, v) -> {
                claims.put(k, v.toString());
            });
        }

        return claims;

    }

    public String getUsernameFromToken(String token) {

        Map<String, String> claims = getClaimsFromToken(token);
        return claims.get(CLAIM_KEY_USERNAME);

    }

    public Date getExpireDateFromToken(String token) {

        Verifier verifier = HMACVerifier.newVerifier(SECRET);
        JWT jwt = JWT.getDecoder().decode(token, verifier);

        return new Date(jwt.expiration.toInstant().toEpochMilli());

    }

    private boolean isTokenExpired(String token) {
        Date expireDate = getExpireDateFromToken(token);
        return expireDate.before(new Date(System.currentTimeMillis()));
    }

    public boolean validateToken(String token, AuthDto authDto) {

        String username = getUsernameFromToken(token);
        return username.equals(authDto.getUsername()) && !isTokenExpired(token);

    }

    public String generateAccessToken(AuthDto authDto) {

        Map<String, String> claims = new HashMap<>();
        claims.put(CLAIM_KEY_USERNAME, authDto.getUsername());
        claims.put(CLAIM_KEY_CREATED, new Date().toString());

        return generateToken(claims, TOKEN_LIFE, authDto.getUsername());

    }

    public String generateRefreshToken(AuthDto authDto) {

        Map<String, String> claims = new HashMap<>();
        claims.put(CLAIM_KEY_USERNAME, authDto.getUsername());
        claims.put(CLAIM_KEY_CREATED, new Date().toString());

        return generateToken(claims, REFRESH_TOKEN_LIFE, authDto.getUsername());

    }

}
