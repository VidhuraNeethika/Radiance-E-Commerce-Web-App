package com.apx.radiance.controller;

import com.apx.radiance.entity.City;
import com.apx.radiance.entity.User;
import com.apx.radiance.dto.RegisterDto;
import com.apx.radiance.entity.UserType;
import com.apx.radiance.mail.VerificationMail;
import com.apx.radiance.provider.MailServiceProvider;
import com.apx.radiance.service.UserService;
import com.apx.radiance.util.Encryption;
import com.apx.radiance.util.HibernateUtil;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.hibernate.Session;

import java.util.UUID;

@Path("/sign-up")
public class RegisterController {

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response register(RegisterDto registerDto) {

        UserService userService = new UserService();
        User byEmail = userService.getByEmail(registerDto.getEmail());

        if (registerDto.getFirstName().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your first name").build();
        }else if (registerDto.getLastName().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your last name").build();
        }else if (registerDto.getEmail().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your email").build();
        }else if (registerDto.getMobile().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your mobile number").build();
        }else if (registerDto.getUsername().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your username").build();
        }else if (registerDto.getPassword().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your password").build();
        }else if (registerDto.getAddressLine01().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your address line 01").build();
        }else if (registerDto.getAddressLine02().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your address line 02").build();
        }else if (registerDto.getPostalCode().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Enter your postal code").build();
        }else if (byEmail != null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Email already exists").build();
        } else {

            User user = new User();
            Session session = HibernateUtil.getSessionFactory().openSession();

            user.setFirst_name(registerDto.getFirstName());
            user.setLast_name(registerDto.getLastName());
            user.setPassword(Encryption.encrypt(registerDto.getPassword()));
            user.setAddress_line_01(registerDto.getAddressLine01());
            user.setAddress_line_02(registerDto.getAddressLine02());
            user.setCity(session.get(City.class,registerDto.getCity()));
            user.setEmail(registerDto.getEmail());
            user.setMobile(registerDto.getMobile());
            user.setPostal_code(registerDto.getPostalCode());
            user.setUserType(UserType.USER);
            user.setUsername(registerDto.getUsername());

            String verificationCode = UUID.randomUUID().toString();
            user.setVerification_code(verificationCode);

            userService.save(user);

            VerificationMail mail = new VerificationMail(user.getEmail(),verificationCode);
            MailServiceProvider.getInstance().sendMail(mail);

            return Response.ok().entity("Registered Success").build();

        }

    }

}
