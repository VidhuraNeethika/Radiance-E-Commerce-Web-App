package com.apx.radiance.middleware;

import com.apx.radiance.annotation.IsAdmin;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.IOException;

@Provider
@IsAdmin
public class IsAdminImplementation implements ContainerRequestFilter {

    @Context
    HttpServletRequest request;

    @Context
    HttpServletResponse response;

    @Override
    public void filter(ContainerRequestContext containerRequestContext) throws IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("admin") == null) {

            containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED)
                    .entity(new Viewable("/frontend/home")).build());

        }

    }

}
