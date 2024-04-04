es <- get_playlist_audio_features("", "4cy45EPpNjdniwLvfLDt0K")
fr <- get_playlist_audio_features("", "0FiYE4GULpT2A2G682GdWd")
kr <- get_playlist_audio_features("", "3mUE7VWxnM5mhWNQvJQlk1")
de <- get_playlist_audio_features("", "6BU1PgFImAbYteXz989v4m")

fr_analyzed <- fr %>% mutate(playlist = "French Hiphop") %>% add_audio_analysis()
de_analyzed <- de %>% mutate(playlist = "German Hiphop") %>% add_audio_analysis()
kr_analyzed <- kr %>% mutate(playlist = "Korean Hiphop") %>% add_audio_analysis()
es_analyzed <- es %>% mutate(playlist = "Latino Hiphop") %>% add_audio_analysis()


saveRDS(object = fr, file = "data/fr.RDS")

saveRDS(object = es, file = "data/es.RDS")

saveRDS(object = kr, file = "data/kr.RDS")

saveRDS(object = de, file = "data/de.RDS")


saveRDS(object = fr_analyzed, file = "data/fr_all.RDS")

saveRDS(object = es_analyzed, file = "data/es_all.RDS")

saveRDS(object = kr_analyzed, file = "data/kr_all.RDS")

saveRDS(object = de_analyzed, file = "data/de_all.RDS")

