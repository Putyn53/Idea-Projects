package io.github.Dev;

import org.junit.Test;

import java.util.Optional;

import static org.junit.Assert.assertEquals;

public class HelloServiceTest {
    private final static String WELCOME = "Hello";
    private final static String FALLBACK_ID_WELCOME = "Hola";
    @Test
    public void test_prepareGreeting_returnsGreetingWithFallbackName()
    {

        LangRepository mockRepository = alwaysReturnHelloRepository();


        HelloService SUT = new HelloService(mockRepository);

        //given
        String name = null;

        //when
        String result = SUT.prepareGreeting(null, "-1");

        //then
        assertEquals(WELCOME+ " " + HelloService.FALLBACK_NAME + "!", result);
    }

    @Test
    public void test_prepareGreeting_returnsGreetingWithName()
    {
        HelloService SUT = new HelloService();

        //given
        String name = "test";

        //when
        String result = SUT.prepareGreeting(name, "-1");

        //then
        assertEquals(WELCOME + " " + name + "!", result);
    }
    @Test
    public void test_prepareGreeting_nullLang_returnsGreetingWithFallbackIdLang()
    {
        LangRepository mockrepository = fallbackLangIdRepository();

        HelloService SUT = new HelloService(mockrepository);

        //when
        String result = SUT.prepareGreeting(null, null);

        //then
        assertEquals(FALLBACK_ID_WELCOME+ " " + HelloService.FALLBACK_NAME + "!", result);
    }
    @Test
    public void test_prepareGreeting_textLang_returnsGreetingWithFallbackIdLang()
    {
        LangRepository mockrepository = fallbackLangIdRepository();

        HelloService SUT = new HelloService(mockrepository);

        //when
        String result = SUT.prepareGreeting(null, "abc");

        //then
        assertEquals(FALLBACK_ID_WELCOME+ " " + HelloService.FALLBACK_NAME + "!", result);
    }
    @Test
    public void test_prepareGreeting_nonExistingLang_returnsGreetingWithFallbackLang()
    {
        LangRepository mockrepository = new LangRepository(){
            @Override
            Optional<Lang> findbyId(Integer id) {
                return Optional.empty();
            }
        };

        HelloService SUT = new HelloService(mockrepository);

        //when
        String result = SUT.prepareGreeting(null, "-1");

        //then
        assertEquals(HelloService.FALLBACK_LANG.getWelcomeMsg()+" " + HelloService.FALLBACK_NAME + "!", result);
    }

    private LangRepository alwaysReturnHelloRepository()
    {
        return new LangRepository()
        {
            @Override
            Optional<Lang> findbyId(Integer id) {
                return Optional.of(new Lang(null,WELCOME,null));
            }
        };
    }
    private LangRepository fallbackLangIdRepository()
    {
        return new LangRepository(){
            @Override
            Optional<Lang> findbyId(Integer id) {
                if(id.equals(HelloService.FALLBACK_LANG.getId()))
                {
                    return Optional.of(new Lang(null,FALLBACK_ID_WELCOME, null));
                }
                return Optional.empty();
            }
        };
    }
}

