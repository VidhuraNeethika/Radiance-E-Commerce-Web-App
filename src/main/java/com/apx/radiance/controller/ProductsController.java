package com.apx.radiance.controller;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/products")
public class ProductsController {

    @GET
    public Viewable index(){
        return new Viewable("/frontend/products-list");
    }

}
