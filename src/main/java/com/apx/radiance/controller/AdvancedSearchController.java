package com.apx.radiance.controller;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/advance-search")
public class AdvancedSearchController {

    @GET
    public Viewable index(){
        return new Viewable("/frontend/advance-search");
    }

}
