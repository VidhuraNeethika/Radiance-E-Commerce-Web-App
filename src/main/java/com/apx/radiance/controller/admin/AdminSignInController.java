package com.apx.radiance.controller.admin;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/admin-sign-in")
public class AdminSignInController {

    @GET
    public Viewable index(){
        return new Viewable("/backend/auth/admin-sign-in");
    }

}
