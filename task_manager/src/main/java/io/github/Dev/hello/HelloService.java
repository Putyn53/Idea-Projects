package io.github.Dev.hello;

import io.github.Dev.lang.Lang;
import io.github.Dev.lang.LangRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Optional;

public class HelloService
{

    static final String FALLBACK_NAME = "world";
    static final Lang FALLBACK_LANG = new Lang(1, "Hello","en");
    private LangRepository repository;
    private final Logger logger = LoggerFactory.getLogger(HelloService.class);

    HelloService()
    {
        this(new LangRepository());
    }
    HelloService(LangRepository repository)
    {
        this.repository = repository;
    }

    String prepareGreeting(String name, Integer langId)
    {
        langId = Optional.ofNullable(langId).orElse(FALLBACK_LANG.getId());
        String welcomeMsg = repository.findbyId(langId).orElse(FALLBACK_LANG).getWelcomeMsg();
        String nameToWelcome = Optional.ofNullable(name).orElse(FALLBACK_NAME) + "!";
        return welcomeMsg + " " + nameToWelcome;
    }
}
