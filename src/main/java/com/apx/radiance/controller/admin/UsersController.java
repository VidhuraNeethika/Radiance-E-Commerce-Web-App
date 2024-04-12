package com.apx.radiance.controller.admin;

import com.apx.radiance.annotation.IsAdmin;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/admin/users")
public class UsersController {

    @GET
    public Viewable index(){
        return new Viewable("/backend/manage-users");
    }

}
