package com.apx.radiance.controller;

import com.apx.radiance.annotation.ApiSecure;
import com.apx.radiance.dto.ProductDto;
import com.apx.radiance.entity.Cart;
import com.apx.radiance.entity.Product;
import com.apx.radiance.entity.User;
import com.apx.radiance.service.ProductService;
import com.apx.radiance.service.UserService;
import com.apx.radiance.util.HibernateUtil;
import com.apx.radiance.util.JwtTokenUtil;
import jakarta.inject.Inject;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriBuilder;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Path("/cart")
public class CartController {

    @GET
    public Viewable index() {
        return new Viewable("/frontend/cart");
    }

    @Context
    HttpServletRequest request;
    @Inject
    UserService userService;

    ProductService productService = new ProductService();
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();
    String userId = "";
    Boolean isSession = false;
    Boolean isAdminSession = false;

    @ApiSecure
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response cartAction(ProductDto productDto) {

        Product productDetails = productService.getByProductId(productDto.getProductId());

        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("user") != null) {
            userId = httpSession.getAttribute("user").toString();
            isSession = true;
        }else if (httpSession.getAttribute("admin") != null) {
            userId = httpSession.getAttribute("admin").toString();
            isAdminSession = true;
        }

        if (isSession||isAdminSession) {

            User user = userService.getById(Long.valueOf(userId));

            Cart singleResult = session.createQuery("select c from Cart c where c.user.id=:userID and c.product.id=:productID", Cart.class)
                    .setParameter("userID", userId).setParameter("productID", productDto.getProductId()).uniqueResult();

            if (singleResult == null) {

                Cart cart = new Cart();
                cart.setProduct(productDetails);
                cart.setUser(user);
                cart.setQty(1);

                session.persist(cart);
                transaction.commit();

                return Response.status(Response.Status.FOUND).entity("Success").build();

            } else {
                return Response.status(Response.Status.FOUND).entity("Added").build();
            }

        } else {

            return Response.status(Response.Status.UNAUTHORIZED).entity("error").build();

        }

    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    public Response deleteAction(ProductDto productDto) {

        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("user") != null) {
            userId = httpSession.getAttribute("user").toString();
            isSession = true;
        }else if (httpSession.getAttribute("admin") != null) {
            userId = httpSession.getAttribute("admin").toString();
            isAdminSession = true;
        }

        if (isSession||isAdminSession) {

            session.createQuery("delete from Cart c where c.user.id=:userID and c.product.id=:productID")
                    .setParameter("userID", userId).setParameter("productID", productDto.getProductId()).executeUpdate();

            transaction.commit();

            return Response.status(Response.Status.FOUND).entity("Success").build();

        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("error").build();
        }

    }


}
