package io.github.Dev.hello;
import io.github.Dev.lang.Lang;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "task", urlPatterns = {"/task"})

public class HelloServlet extends HttpServlet{

    private static final String NAME_PARAM = "name";
    private static final String LANG_PARAM = "lang";
    private final Logger logger = LoggerFactory.getLogger(HelloServlet.class);

    private HelloService service;

    public HelloServlet()
    {
        this(new HelloService());
    }

    HelloServlet(HelloService service)
    {
        this.service = service;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.info("Got request with parameters " + req.getParameterMap());
        String name = req.getParameter(NAME_PARAM);
        String lang = req.getParameter(LANG_PARAM);
        Integer langId = null;
        try
        {
            langId = Integer.valueOf(lang);
        }catch (NumberFormatException e)
        {
            logger.warn("Non numeric lang id used: " + lang);
        }

        resp.getWriter().write(service.prepareGreeting(name, langId));
    }
}
