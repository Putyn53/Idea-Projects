package io.github.Dev.lang;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "languages", urlPatterns = {"/task/languages"})

public class LangServlet extends HttpServlet{

    private final Logger logger = LoggerFactory.getLogger(LangServlet.class);

    private LangService service;
    private ObjectMapper mapper;

    public LangServlet()
    {
        this(new LangService(), new ObjectMapper());
    }

    LangServlet(LangService service, ObjectMapper mapper)
    {
        this.mapper = mapper;
        this.service = service;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("Got request with parameters " + req.getParameterMap());
        resp.setContentType("application/json;charset=UTF-8");
        mapper.writeValue(resp.getOutputStream(),service.findAll());
    }
}
