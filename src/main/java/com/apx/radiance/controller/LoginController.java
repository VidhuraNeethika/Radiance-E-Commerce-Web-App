package com.apx.radiance.controller;

import com.apx.radiance.dto.AuthDto;
import com.apx.radiance.dto.RegisterDto;
import com.apx.radiance.dto.TokenDto;
import com.apx.radiance.entity.User;
import com.apx.radiance.entity.UserType;
import com.apx.radiance.service.UserService;
import com.apx.radiance.util.Encryption;
import com.apx.radiance.util.HibernateUtil;
import com.apx.radiance.util.JwtTokenUtil;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriBuilder;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.Date;

@Path("/sign-in")
public class LoginController {

    @GET
    public Viewable index() {
        return new Viewable("/frontend/auth/sign-in");
    }

    @Inject
    private JwtTokenUtil jwtTokenUtil;

    @Inject
    private UserService userService;

    @Context
    HttpServletResponse response;


    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response loginAction(AuthDto authDto, @Context HttpServletRequest request) {

        User byEmail = userService.getByEmail(authDto.getUsername());
        String encrpPassword = Encryption.encrypt(authDto.getPassword());

        if (byEmail != null) {

            if (byEmail.getPassword().equals(encrpPassword)) {
                if (byEmail.isActive() && !byEmail.getEmail_verified_at().isEmpty()) {

                    HttpSession session = request.getSession();

                    if(byEmail.getUserType().equals(UserType.ADMIN)){
                        session.setAttribute("admin", byEmail.getId());
                    }else{
                        session.setAttribute("user", byEmail.getId());
                    }

                    AuthDto byUsername = userService.getUserByUsername(byEmail.getUsername());

                    String accessToken = jwtTokenUtil.generateAccessToken(byUsername);
                    String refreshToken = jwtTokenUtil.generateRefreshToken(byUsername);
                    Date expireDate = jwtTokenUtil.getExpireDateFromToken(accessToken);

                    TokenDto tokenDto = new TokenDto();
                    tokenDto.setAccessToken(accessToken);
                    tokenDto.setRefreshToken(refreshToken);
                    tokenDto.setExpireIn(expireDate.toString());

                    return Response.ok().entity(tokenDto).build();

                } else {

                    HttpSession session = request.getSession();
                    if(byEmail.getUserType().equals(UserType.ADMIN)){
                        session.setAttribute("admin", byEmail.getId());
                    }else{
                        session.setAttribute("user", byEmail.getId());
                    }
                    return Response.status(Response.Status.FORBIDDEN).build();

                }
            } else {
                return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid Username or Password").build();
            }

        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid Username or Password").build();
        }

    }

    @Path("/refresh-token")
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public Response refreshToken(@FormParam("token") String refreshToken) {

        AuthDto userByUsername = userService.getUserByUsername(jwtTokenUtil.getUsernameFromToken(refreshToken));

        if (userByUsername == null || !jwtTokenUtil.validateToken(refreshToken, userByUsername)) {
            return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid refresh token").build();
        } else {

            String accessToken = jwtTokenUtil.generateAccessToken(userByUsername);
            Date expireDate = jwtTokenUtil.getExpireDateFromToken(accessToken);

            TokenDto tokenDto = new TokenDto();
            tokenDto.setAccessToken(accessToken);
            tokenDto.setRefreshToken(refreshToken);
            tokenDto.setExpireIn(String.valueOf(expireDate.getTime()));

            return Response.ok().entity(tokenDto).build();

        }

    }


}
