package com.apx.radiance.controller.admin;


import com.apx.radiance.annotation.IsAdmin;
import com.apx.radiance.service.FileUploadService;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.InputStream;

@IsAdmin
@Path("/admin/product")
public class ProductController {

    @GET
    public Viewable index(){
        return new Viewable("/backend/manage-products");
    }

    @Context
    ServletContext context;

    @Path("upload-image")
    @POST
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response action(@FormDataParam("file")InputStream is, @FormDataParam("file")FormDataContentDisposition fileMetaData){

        FileUploadService uploadService = new FileUploadService(context);
        FileUploadService.FileItem fileItem = uploadService.upload(is,fileMetaData);
//        uploadService.delete("abc");
        return Response.ok().entity("").build();

    }
}
