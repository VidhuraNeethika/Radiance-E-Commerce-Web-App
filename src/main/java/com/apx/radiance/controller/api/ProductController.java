package com.apx.radiance.controller.api;

import com.apx.radiance.dto.ProductDto;
import com.apx.radiance.entity.Category;
import com.apx.radiance.entity.Product;
import com.apx.radiance.entity.Product_Image;
import com.apx.radiance.entity.User;
import com.apx.radiance.service.FileUploadService;
import com.apx.radiance.service.ModelHasBrandService;
import com.apx.radiance.service.ProductService;
import com.apx.radiance.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import jakarta.inject.Inject;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.ContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;
import org.glassfish.jersey.media.multipart.FormDataParam;

import javax.print.attribute.standard.Media;
import java.io.InputStream;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Path("/admin/api/product")
public class ProductController {

    @Context
    private ServletContext context;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {

        List<ProductDto> list = new ArrayList<>();
        ProductService productService = new ProductService();

        productService.getAll().forEach(product -> {
            ProductDto productDto = new ProductDto();
            productDto.setProductId(product.getId());
            productDto.setTitle(product.getTitle());
            productDto.setPrice(product.getPrice());
            productDto.setImages(product.getProduct_images());
            productDto.setCreatedAt(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(product.getCreatedAt()));
            list.add(productDto);
        });

        return Response.ok().entity(list).build();

    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        ProductService productService = new ProductService();
        Product product = productService.getByProductId(id);
        ProductDto productDto = new ProductDto();
        productDto.setProductId(product.getId());
        productDto.setTitle(product.getTitle());
        productDto.setPrice(product.getPrice());
        productDto.setImages(product.getProduct_images());
        productDto.setCreatedAt(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(product.getCreatedAt()));
        return Response.ok().entity(productDto).build();
    }


    @POST
    @Path("/{id}/upload-image")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response upload(@PathParam("id") Long id, @FormDataParam("file[]") FormDataBodyPart body) {

        List<FileUploadService.FileItem> items = new ArrayList<>();

        ArrayList<String> filePaths = new ArrayList<>();

        FileUploadService uploadService = new FileUploadService(context);
        ProductService productService = new ProductService();

        Product product = productService.getByProductId(id);

        body.getParent().getBodyParts().forEach(bodyPart -> {
            InputStream is = bodyPart.getEntityAs(InputStream.class);
            ContentDisposition meta = bodyPart.getContentDisposition();
            FileUploadService.FileItem fileItem = uploadService.upload("admin-uploads/" + id, is, meta);

            items.add(fileItem);
            filePaths.add(fileItem.getPath());

        });

        Product_Image productImage = new Product_Image();
        productImage.setPath_01(filePaths.get(0));
        productImage.setPath_02(filePaths.get(1));
        productImage.setPath_03(filePaths.get(2));
        productImage.setPath_04(filePaths.get(3));
        product.getProduct_images().add(productImage);

        product.setActive(true);

        productService.update(product);
        return Response.ok().entity(items).build();

    }

    private static final ObjectMapper mapper = new ObjectMapper();

    @Context
    HttpServletRequest request;
    String userId = "";
    Boolean isSession = false;
    @Inject
    UserService userService;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response save(ProductDto productDto) {

        ProductService productService = new ProductService();
        ModelHasBrandService modelHasBrandService = new ModelHasBrandService();

        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("admin") != null) {
            isSession = true;
        }

        if (isSession) {

            userId = httpSession.getAttribute("admin").toString();
            User user = userService.getById(Long.valueOf(userId));

            Product product = new Product();

            product.setTitle(productDto.getTitle());
            product.setPrice(productDto.getPrice());
            product.setQty(productDto.getQty());
            product.setDelivery_fee(productDto.getDelivery_fee());
            product.setDescription(productDto.getDescription());
            product.setCategory(productService.getHibernateSession().get(Category.class, productDto.getCategory()));
            product.setModelHasBrand(modelHasBrandService.getModelHasBrand(productDto.getBrand(), productDto.getModel()));
            product.setUser(user);

            productService.save(product);

            ObjectNode jsonNodes = mapper.createObjectNode();
            jsonNodes.put("pid", product.getId());

            return Response.ok().entity(jsonNodes).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("error").build();
        }
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response update(ProductDto productDto) {

        ProductService productService = new ProductService();
        ModelHasBrandService modelHasBrandService = new ModelHasBrandService();

        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("admin") != null) {
            isSession = true;
        }

        if (isSession) {

            userId = httpSession.getAttribute("admin").toString();
            User user = userService.getById(Long.valueOf(userId));

            Product product = new Product();

            product.setTitle(productDto.getTitle());
            product.setPrice(productDto.getPrice());
            product.setQty(productDto.getQty());
            product.setDelivery_fee(productDto.getDelivery_fee());
            product.setDescription(productDto.getDescription());
            product.setCategory(productService.getHibernateSession().get(Category.class, productDto.getCategory()));
            product.setModelHasBrand(modelHasBrandService.getModelHasBrand(productDto.getBrand(), productDto.getModel()));
            product.setUser(user);

            productService.update(product);

            ObjectNode jsonNodes = mapper.createObjectNode();
            jsonNodes.put("pid", product.getId());

            return Response.ok().entity(jsonNodes).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("error").build();
        }
    }

    @DELETE
    @Path("/{id}")
    public Response delete(@PathParam("id") Long id) {

        new ProductService().delete(id);

        FileUploadService uploadService = new FileUploadService(context);
        uploadService.deleteDirectory("assets/pictures/products/admin-uploads/" + id);

        return Response.ok().build();

    }

}
