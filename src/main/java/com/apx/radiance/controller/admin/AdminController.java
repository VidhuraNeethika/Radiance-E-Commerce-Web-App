package com.apx.radiance.controller.admin;

import com.apx.radiance.annotation.ApiSecure;
import com.apx.radiance.annotation.IsAdmin;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/admin-panel")
public class AdminController {

    @GET
    public Viewable index(){
        return new Viewable("/backend/admin");
    }

}
