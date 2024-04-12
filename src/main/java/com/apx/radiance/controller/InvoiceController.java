package com.apx.radiance.controller;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/invoice")
public class InvoiceController {

    @GET
    public Viewable index(){
        return new Viewable("/frontend/invoice");
    }

}
