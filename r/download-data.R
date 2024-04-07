es <- get_playlist_audio_features("", "4cy45EPpNjdniwLvfLDt0K")
fr <- get_playlist_audio_features("", "0FiYE4GULpT2A2G682GdWd")
kr <- get_playlist_audio_features("", "3mUE7VWxnM5mhWNQvJQlk1")
de <- get_playlist_audio_features("", "6BU1PgFImAbYteXz989v4m")

fr_analyzed <- fr %>% mutate(playlist = "French Hiphop") %>% add_audio_analysis()
de_analyzed <- de %>% mutate(playlist = "German Hiphop") %>% add_audio_analysis()
kr_analyzed <- kr %>% mutate(playlist = "Korean Hiphop") %>% add_audio_analysis()
es_analyzed <- es %>% mutate(playlist = "Latino Hiphop") %>% add_audio_analysis()


cd <-
  get_tidy_audio_analysis("19xVZr90ICYmatwd3FsKbe")
thot <-
  get_tidy_audio_analysis("1PoxR9dqTzlGYFJkHnpNfS") 
como <-
  get_tidy_audio_analysis("76j6ISLdqxSKJBNGLL0fPb")
tl <-
  get_tidy_audio_analysis("7gewLHcVTy1TrlwqSpuTJF") 


hiphop <- bind_rows(fr_analyzed, de_analyzed, kr_analyzed, es_analyzed)


hiphop_features <-
  hiphop |>
  mutate(playlist = factor(playlist)) |>
  mutate(segments = map2(segments, key, compmus_c_transpose)) |>
  mutate(
    pitches =
      map(
        segments,
        compmus_summarise, pitches,
        method = "mean", norm = "manhattan"
      ),
    timbre =
      map(
        segments,
        compmus_summarise, timbre,
        method = "mean"
      )
  ) |>
  mutate(pitches = map(pitches, compmus_normalise, "clr")) |>
  mutate_at(vars(pitches, timbre), map, bind_rows) |>
  unnest(cols = c(pitches, timbre))



saveRDS(object = cd, file = "data/cd.RDS")

saveRDS(object = thot, file = "data/thot.RDS")

saveRDS(object = como, file = "data/como.RDS")

saveRDS(object = tl, file = "data/tl.RDS")



saveRDS(object = fr, file = "data/fr.RDS")

saveRDS(object = es, file = "data/es.RDS")

saveRDS(object = kr, file = "data/kr.RDS")

saveRDS(object = de, file = "data/de.RDS")


saveRDS(object = fr_analyzed, file = "data/fr_all.RDS")

saveRDS(object = es_analyzed, file = "data/es_all.RDS")

saveRDS(object = kr_analyzed, file = "data/kr_all.RDS")

saveRDS(object = de_analyzed, file = "data/de_all.RDS")


saveRDS(object = hiphop_features, file = "data/hiphop_features.RDS")

