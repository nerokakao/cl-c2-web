(in-package #:cl-c2-web)

;;;横幅信息
(postmodern:defprepared-with-names banner-info ()
  ("
SELECT title     AS TITLE,               
       image_url AS IMAGE_URL,           
       link_url  AS LINK_URL             
FROM   banner                            
WHERE  1 = 1                             
       AND start_dt < now()::timestamp(0)
       AND end_dt > now()::timestamp(0)  
       AND status = 'Y'
") :plists)

;;;游戏简介 精选
(postmodern:defprepared-with-names game-intro-handpick-info ()
  ("
SELECT logo_url                           LOGO_URL,   
       name                               GAME_NAME,   
       game_id                            GAME_ID,     
       Round(good * 5.0 / ( good + bad )) RECOM_NUM,   
       category                           CATEGORY,    
       size                               GAME_SIZE,   
       \"desc\"                           \"DESC\",    
       download_link ->> 'android'        ANDROID_LINK,
       download_link ->> 'ios'            IOS_LINK,    
       web_link                           WEB_LINK     
FROM   game_meta                                       
WHERE  status = 'Y'                                    
AND    is_handpick = 'Y'
") :plists)

;;;游戏简介 热门
(postmodern:defprepared-with-names game-intro-hot-info ()
  ("
SELECT logo_url                           LOGO_URL,    
       name                               GAME_NAME,   
       game_id                            GAME_ID,     
       Round(good * 5.0 / ( good + bad )) RECOM_NUM,   
       category                           CATEGORY,    
       size                               GAME_SIZE,   
       \"desc\"                           \"DESC\",    
       download_link ->> 'android'        ANDROID_LINK,
       download_link ->> 'ios'            IOS_LINK,    
       web_link                           WEB_LINK     
FROM   game_meta                                       
WHERE  status = 'Y'                                    
AND    round(good * 5.0 / (good + bad)) > 1
") :plists)

