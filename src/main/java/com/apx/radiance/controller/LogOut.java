package com.apx.radiance.controller;

import com.apx.radiance.dto.AuthDto;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriBuilder;

@Path("/log-out")
public class LogOut {

    @Context
    HttpServletRequest request;

    @Context
    HttpServletResponse response;

    @POST
    public Response logOut() {

        HttpSession session = request.getSession();
        session.invalidate();

        return Response.ok().entity("ok").build();

    }

}
