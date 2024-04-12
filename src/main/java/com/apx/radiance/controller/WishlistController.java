package com.apx.radiance.controller;

import com.apx.radiance.annotation.ApiSecure;
import com.apx.radiance.dto.ProductDto;
import com.apx.radiance.entity.Cart;
import com.apx.radiance.entity.Product;
import com.apx.radiance.entity.User;
import com.apx.radiance.entity.Wishlist;
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
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Path("/wishlist")
public class WishlistController {

    @GET
    public Viewable index() {
        return new Viewable("/frontend/wishlist");
    }

    @Context
    HttpServletRequest request;

    @Inject
    UserService userService;

    String userId = "";
    Boolean isSession = false;

    Boolean isAdminSession = false;
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();

    @ApiSecure
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response wishlistAction(ProductDto productDto) {

        HttpSession httpSession = request.getSession();

        ProductService productService = new ProductService();
        Product productDetails = productService.getByProductId(productDto.getProductId());

        if (httpSession.getAttribute("user") != null) {
            userId = httpSession.getAttribute("user").toString();
            isSession = true;
        }else if (httpSession.getAttribute("admin") != null) {
            userId = httpSession.getAttribute("admin").toString();
            isAdminSession = true;
        }

        if (isSession||isAdminSession) {

            User user = userService.getById(Long.valueOf(userId));

            Wishlist singleResult = session.createQuery("select w from Wishlist w where w.user.id=:userID and w.product.id=:productID", Wishlist.class)
                    .setParameter("userID", userId).setParameter("productID", productDto.getProductId()).uniqueResult();

            if (singleResult == null) {

                Wishlist wishlist = new Wishlist();
                wishlist.setProduct(productDetails);
                wishlist.setUser(user);

                session.persist(wishlist);
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

            session.createQuery("delete from Wishlist w where w.user.id=:userID and w.product.id=:productID")
                    .setParameter("userID", userId).setParameter("productID", productDto.getProductId()).executeUpdate();

            transaction.commit();

            return Response.status(Response.Status.FOUND).entity("Success").build();

        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("error").build();
        }

    }

}
