package io.github.Dev;

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

    String prepareGreeting(String name, String lang)
    {
        Integer langIdNum;
        try
        {
            langIdNum= Optional.ofNullable(lang).map(Integer::valueOf).orElse(FALLBACK_LANG.getId());
        }catch (NumberFormatException n){
            logger.warn("Non-numeric Language ID used: " + lang);
            langIdNum = FALLBACK_LANG.getId();
        }

        String welcomeMsg = repository.findbyId(langIdNum).orElse(FALLBACK_LANG).getWelcomeMsg();
        String nameToWelcome = Optional.ofNullable(name).orElse(FALLBACK_NAME) + "!";
        return welcomeMsg + " " + nameToWelcome;
    }
}
