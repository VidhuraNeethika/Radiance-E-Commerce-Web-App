package com.apx.radiance.controller;

import com.apx.radiance.annotation.ApiSecure;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;


@Path("/")
public class HomeController {

    @GET
    public Viewable index(){
        return new Viewable("/frontend/home");
    }
}
