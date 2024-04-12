package com.apx.radiance.controller;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/purchased-history")
public class PurchasedHistory {

    @GET
    public Viewable index(){
        return new Viewable("/frontend/purchased-history");
    }

}
