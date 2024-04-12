package com.apx.radiance.middleware;

import com.apx.radiance.annotation.ApiSecure;
import com.apx.radiance.dto.AuthDto;
import com.apx.radiance.entity.User;
import com.apx.radiance.entity.UserType;
import com.apx.radiance.service.UserService;
import com.apx.radiance.util.JwtTokenUtil;
import io.fusionauth.jwt.JWTExpiredException;
import jakarta.annotation.Priority;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriBuilder;
import jakarta.ws.rs.core.UriInfo;
import jakarta.ws.rs.ext.Provider;

import java.io.IOException;

@Provider
@Priority(1)
@ApiSecure
public class JwtTokenFilter implements ContainerRequestFilter {

    @Inject
    private JwtTokenUtil jwtTokenUtil;

    @Inject
    private UserService userService;

    @Context
    HttpServletRequest request;

    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {

        System.out.println("JwtValidationFilter : Running...");

        if (requestContext.getHeaders().getFirst("Authorization") == null) {

            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());

        } else {

            String token = requestContext.getHeaders().getFirst("Authorization").split("Bearer")[1];

            try {

                AuthDto userDetails = userService.getUserByUsername(jwtTokenUtil.getUsernameFromToken(token));
                User byEmail = userService.getByEmail(userDetails.getUsername());

                if (!jwtTokenUtil.validateToken(token, userDetails)) {
                    requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
                }else{
                    HttpSession session = request.getSession(false);

                    if(byEmail.getUserType().equals(UserType.ADMIN)){
                        session.setAttribute("admin", byEmail.getId());
                    }else{
                        session.setAttribute("user", byEmail.getId());
                    }

                }

            } catch (JWTExpiredException | NullPointerException ex) {
                requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("Token Expired...").build());
            } catch (Exception ex) {
                //ex.printStackTrace();
                requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
            }

        }

    }
}
