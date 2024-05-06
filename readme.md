# Quick Explanation about Key Components in this Web Application

## Dependencies (pom.xml):

Here is an explanation of the dependencies and their usages:

1. **Tomcat server dependencies**:
    -  `tomcat-embed-core` : Core components for embedding Tomcat server.
    -  `tomcat-embed-logging-juli` : Logging support for Tomcat.
    -  `tomcat-embed-jasper` : JSP support for Tomcat.

2. **Servlets dependency**:
    -  `jakarta.servlet-api` : API for the Java Servlets. The  `provided`  scope means it is required for compilation and testing but will not be packaged with the final application.

3. **Jersey dependencies**:
    -  `jersey-common` ,  `jersey-hk2` ,  `jersey-container-servlet` ,  `jersey-mvc-jsp` ,  `jersey-media-json-jackson` ,  `jersey-bean-validation` : Dependencies for the Jersey framework for building RESTful web services.

4. **Fusionauth JWT dependency**:
    -  `fusionauth-jwt` : Library for generating security tokens.

5. **Hibernate dependency**:
    -  `hibernate-core` : Core library for the Hibernate ORM framework.

6. **MySQL connector dependency**:
    -  `mysql-connector-java` : Connector for MySQL database.

7. **JSP template inheritance dependencies**:
    -  `jsp-template-inheritance`  from  `kr.pe.kwonnam.jsp`  and  `lk.callidora.jsp` : Libraries for JSP template inheritance.

8. **Gson dependency**:
    -  `gson` : Library for JSON serialization and deserialization.

9. **Jetty dependency**:
    -  `apache-jstl` : JSTL library for the Jetty server.

10. **Mail provider dependencies**:
    -  `jakarta.mail`  from  `org.eclipse.angus` : Library for sending emails.
    -  `email-template-builder`  from  `io.rocketbase.mail` : Library for building email templates.

11. **Jersey media multipart dependency**:
    -  `jersey-media-multipart` : Support for handling multipart requests in Jersey.

12. **Common IO dependency**:
    -  `commons-io` : Common IO utilities library.

These dependencies are essential for the project to compile, run, and include various functionalities such as web server support, REST API development, database connectivity, email handling, and more.

## Deployment Descriptor (web.xml)

web.xml represents a web application configuration using Java EE technologies. It sets up context parameters for JSP inheritance, defines a filter for Jersey (a RESTful web services framework), and maps the filter to all URL patterns in the application.

Here is an explanation of the key components in the code:

1. **XML Declaration**:
    - Specifies the version and encoding of the XML document.

2. **Root Element  `<web-app>`**:
    - Defines the configuration for the web application.
    - Namespaces and schema locations are specified for Java EE.

3. **Context Parameters**:
    - Two  `<context-param>`  elements are used to set context parameters.
    -  `jsp-inheritance-prefix` : Specifies the prefix for JSP files located in  `/WEB-INF/views/layout/` .
    -  `jsp-inheritance-suffix` : Specifies the suffix for JSP files as  `.jsp` .

4. **Filter Configuration**:
    -  `<filter>`  element defines a filter named "JerseyFilter" using the  `org.glassfish.jersey.servlet.ServletContainer`  class.
    - Two  `<init-param>`  elements are used to set initialization parameters for the filter:
        -  `jakarta.ws.rs.Application` : Specifies the application class ( `com.apx.radiance.config.AppConfig` ) for Jersey.
        -  `jersey.config.servlet.filter.forwardOn404` : Sets the parameter to  `true`  to enable forwarding on 404 errors.

5. **Filter Mapping**:
    -  `<filter-mapping>`  element maps the "JerseyFilter" to all URL patterns in the application using  `<url-pattern>/*</url-pattern>` .

Usage:
- This configuration file is typically used in a Java web application (e.g., a Servlet or JSP application) to set up the necessary configurations for JSP inheritance and Jersey filter.
- The context parameters define settings related to JSP file inheritance, and the filter configuration is essential for handling RESTful web services using Jersey.
- The filter mapping ensures that the Jersey filter is applied to all URL patterns in the application, allowing it to process incoming requests.

## Jersey Application Configuration (AppConfig.java)

The provided Java class  `AppConfig`  extends  `ResourceConfig` , which is a class provided by Jersey, a framework for building RESTful web services in Java. The  `AppConfig`  class is used to configure and customize the behavior of the Jersey application.

Explanation of the code and its usages:

1. `public AppConfig()`  Constructor:
   - The constructor of the  `AppConfig`  class is used to set up the configuration for the Jersey application.

2. `packages("com.apx.radiance.controller")`  and  `packages("com.apx.radiance.middleware")`:
   - The ` packages() ` method is used to specify the package(s) to scan for resources and providers in the Jersey application.
   - In this case, it is scanning the packages ` com.apx.radiance.controller ` and ` com.apx.radiance.middleware ` for classes that contain JAX-RS resources and providers.

3. ` register(JspMvcFeature.class) `:
   - The ` register() ` method is used to register features or components in the Jersey application.
   - ` JspMvcFeature ` is a feature provided by Jersey that enables support for JSP-based MVC (Model-View-Controller) templates.

4. ` register(MultiPartFeature.class) `:
   - Registers the ` MultiPartFeature ` class, which is a Jersey feature for handling multipart content, such as file uploads in RESTful services.

5. ` property(JspMvcFeature.TEMPLATE_BASE_PATH, "/WEB-INF/views") `:
   - Sets a property for the ` JspMvcFeature ` specifying the base path for JSP templates.
   - In this case, it sets the base path to ` /WEB-INF/views `, indicating where the JSP templates are located in the project.

6. ` register(DependencyBinder.class) `:
   - Registers the ` DependencyBinder ` class, which is likely a custom class responsible for binding dependencies or performing dependency injection in the application.

**Usages**:
- The ` AppConfig` class is typically used as the application configuration class in a Jersey-based web application.
- It configures the Jersey application by specifying the packages to scan for resources, registering features like JSP support and multipart handling, setting properties for features, and registering any custom components or providers.
- This class plays a crucial role in setting up the Jersey application and customizing its behavior based on the requirements of the application.
- It helps in organizing and configuring the resources, features, and dependencies needed for the RESTful web services provided by the Jersey application.

## Dependency Injection (DependencyBinder.java)

The provided Java class  `DependencyBinder`  extends  `AbstractBinder` , which is a class from the HK2 dependency injection framework. The  `DependencyBinder`  class is used to define bindings between interfaces and their concrete implementations for dependency injection within an application.

Explanation of the code and its usages:

1. `public class DependencyBinder extends AbstractBinder`:
   - Defines a class named  `DependencyBinder`  that extends  `AbstractBinder` , which is a class provided by HK2 for configuring dependency bindings.

2. `@Override protected void configure()`:
   - The  `configure()`  method is an overridden method from the  `AbstractBinder`  class that is used to define the bindings between interfaces and their implementations.

3. `bind(JwtTokenUtil.class).to(JwtTokenUtil.class).in(Singleton.class)`:
   - Binds the  `JwtTokenUtil`  class to itself and specifies that it should be treated as a singleton instance.
   - This means that whenever  `JwtTokenUtil`  is injected, the same instance will be used throughout the application.

4. `bind(Encryption.class).to(Encryption.class).in(Singleton.class)`:
   - Binds the  `Encryption`  class to itself as a singleton instance, similar to the previous binding.

5. `bind(UserService.class).to(UserService.class).in(Singleton.class)`:
   - Binds the  `UserService`  class to itself as a singleton instance.

**Usages**:
- The  `DependencyBinder`  class is typically used in applications that utilize the HK2 dependency injection framework to manage dependencies and perform dependency injection.
- It is responsible for defining the bindings between interfaces and their concrete implementations, specifying the scope of instances (e.g., singleton in this case), and configuring how dependencies are resolved and injected.
- By defining these bindings in the  `configure()`  method, the  `DependencyBinder`  class sets up the dependency injection mechanism for the application, ensuring that the specified classes are instantiated and injected where needed.
- This approach helps in decoupling components, promoting reusability, and facilitating the management of dependencies in a modular and flexible manner within the application.

## Hibernate Configuration (hibernate.cfg.xml)

Hibernate configuration file used to set up the configuration for a Hibernate session factory. It includes various properties and mappings needed for Hibernate to interact with a MySQL database.

Explanation of the key elements in the code and their usages:

1. **<hibernate-configuration>**:
   - This is the root element that encapsulates the Hibernate configuration settings.

2. **<session-factory>**:
   - Contains the configuration properties and mappings for the Hibernate session factory.

3. **Properties**:
   - `hibernate.dialect`: Specifies the SQL dialect to be used by Hibernate. In this case, it is set to  org.hibernate.dialect.MySQLDialect  for MySQL database.
   - `hibernate.connection.driver_class`: Specifies the JDBC driver class for MySQL database, which is  com.mysql.cj.jdbc.Driver .
   - `hibernate.connection.url`: Specifies the JDBC URL for connecting to the MySQL database with additional parameters like SSL settings and key retrieval.
   - `hibernate.connection.username`: Specifies the username for connecting to the database.
   - `hibernate.connection.password`: Specifies the password for the database user.
   - `hibernate.hbm2ddl.auto`: Specifies the schema generation strategy. Setting it to  update  will automatically update the schema based on the entity mappings.
   - `hibernate.show_sql`: Enables the display of SQL statements in the console for debugging purposes.

4. **Mappings**:
   -  `<mapping>`  elements specify the entity classes that are mapped to database tables in Hibernate. 
   - Each  `<mapping>`  element references a Java entity class that represents a database table. In this case, entities like  User ,  Brand ,  Category , etc., are mapped.

**Usages**:
- This Hibernate configuration file is used to configure the Hibernate ORM framework to work with a MySQL database.
- It defines the database connection details, SQL dialect, schema generation strategy, and entity mappings required for Hibernate to interact with the database.
- The mappings ensure that the Java entity classes are synchronized with the corresponding database tables, allowing Hibernate to perform CRUD operations and manage the database schema. 