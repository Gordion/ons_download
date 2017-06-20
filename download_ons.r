download_ons <- function(dataset) {
  url <- paste0("https://www.ons.gov.uk/generator?format=csv&uri=/economy/grossdomesticproductgdp/timeseries/",
                dataset,
                "/pn2")
  download.file(url,destfile=paste0("~/",dataset,".csv"))
  return(read.csv(paste0("~/",dataset,".csv"),header=FALSE,skip=8))
}

uk_gdp_short_term_growth<-download_ons("kgm9") %>%
  rename(Period=V1,uk_gdp_short_term_growth=V2) %>%
  slice(n())
uk_service_short_term_growth<-download_ons("l3e2") %>%
  rename(Period=V1,uk_service_short_term_growth=V2) %>%
  slice(n())
uk_production_short_term_growth<-download_ons("l3bg") %>%
  rename(Period=V1,uk_production_short_term_growth=V2) %>%
  slice(n())
uk_construction_short_term_growth<-download_ons("l3dw") %>%
  rename(Period=V1,uk_construction_short_term_growth=V2) %>%
  slice(n())
uk_gdp_per_head_growth<-download_ons("n3y7") %>%
  rename(Period=V1,uk_gdp_per_head_growth=V2) %>%
  slice(n())
uk_gdp_medium_term_growth<-download_ons("kgn3") %>%
  rename(Period=V1,uk_gdp_medium_term_growth=V2) %>%
  slice(n())
uk_service_medium_term_growth<-download_ons("l44q") %>%
  rename(Period=V1,uk_service_medium_term_growth=V2) %>%
  slice(n())
uk_production_medium_term_growth<-download_ons("l426") %>%
  rename(Period=V1,uk_production_medium_term_growth=V2) %>%
  slice(n())
uk_construction_medium_term_growth<-download_ons("l44m") %>%
  rename(Period=V1,uk_construction_medium_term_growth=V2) %>%
  slice(n())
uk_gdp_per_head_last_year_growth<-download_ons("n3y8") %>%
  rename(Period=V1,uk_gdp_per_head_last_year_growth=V2) %>%
  slice(n())

#test<-data.frame()

test<-uk_gdp_short_term_growth %>%
  left_join(uk_service_short_term_growth) %>%
  left_join(uk_production_short_term_growth) %>%
  left_join(uk_construction_short_term_growth) %>%
  left_join(uk_gdp_per_head_growth) %>%
  left_join(uk_gdp_medium_term_growth) %>%
  left_join(uk_service_medium_term_growth) %>%
  left_join(uk_production_medium_term_growth) %>%
  left_join(uk_construction_medium_term_growth) %>%
  left_join(uk_gdp_per_head_last_year_growth) %>%
  gather("sector","value",2:11)
