package com.apx.radiance.controller;

import com.apx.radiance.annotation.ApiSecure;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@ApiSecure
@Path("/test")
public class TestController {

    @GET
    public Viewable index(){
        return new Viewable("/frontend/test");
    }

}
