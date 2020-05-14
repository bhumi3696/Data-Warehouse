install.packages("rvest")
install.packages("dplyr")
install.packages("XML")
library("XML")
library("dplyr")
library("rvest")
product_table <- read_html("https://www.cqc.org.uk/provider/RHW/survey/3", sep="\t", quote="", comment.char="")
product_category <- product_table %>%html_nodes("div")%>%html_nodes("h4")%>%html_text()

product_price <- product_table%>%html_nodes(".regular")%>%html_text()
product_colour <- product_table%>%html_nodes(".ng-scope+ .ng-scope .ng-scope .ng-binding , .ng-scope:nth-child(7) .product-name , .product-item:nth-child(1) .product-name .ng-binding")%>%html_text()
product_category
product_price
product_colour
a <- data.frame(product_category)
a

data <- product_table %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]

df[!grepl('answered by emergency patients only','answered by those referred to hospital',df$data),]
df <- data.frame(data)
nrow(df)
df.1<-df[1:55,]
str(df.1)
d1<-df[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]

product_type  <- product_table %>%html_nodes(".patient_score")%>%html_text()
product_type
d <- merge(data.frame(d1, row.names=NULL),data.frame(product_type, row.names=NULL), by = 0, all = TRUE)[-1]
data <- d[-c(4),]
data1 <- data.frame(data)
data1
#Airport details
Airport_table <- read_html("http://www.flightontime.info/scheduled/airports/lhr16.html")
Airport <- Airport_table %>%html_nodes(".text2s+ .text2s")%>%html_text(trim = TRUE)
Average_delay_mins<- Airport_table %>%html_nodes(".text2sl:nth-child(15)")%>%html_text(trim = TRUE)
Operated_within_15_mins_percentage<- Airport_table%>%html_nodes(".text2sl:nth-child(16)")%>%html_text()
Over_1_hour_late_percentage<- Airport_table%>%html_nodes(".text2sl:nth-child(17)")%>%html_text()
Over_3_hours_late_percentage<- Airport_table%>%html_nodes(".text2sl:nth-child(18)")%>%html_text()
Total_flights_analysed<- Airport_table%>%html_nodes(".text2sl:nth-child(19)")%>%html_text()
Airport
Average_delay_mins
Operated_within_15_mins_percentage
Over_1_hour_late_percentage
Over_3_hours_late_percentage
Total_flights_analysed
Airport_details<-data.frame(Airport,Average_delay_mins,Operated_within_15_mins_percentage,Over_1_hour_late_percentage,Over_3_hours_late_percentage,Total_flights_analysed)
Airport_details



airline <- 'https://www.airhelp.com/en/airhelp-score/airport-ranking/'
airline.table = readHTMLTable(airline, header=T, which=1,stringsAsFactors=F)


product_details <- merge(data.frame(product_category,product_price,product_colour, row.names=NULL), data.frame(product_arrival, row.names=NULL), by = 0, all = TRUE)[-1]
product_details
product <- merge(data.frame(product_details, row.names=NULL),data.frame(trend_top, row.names=NULL), by = 0, all = TRUE)[-1]

#sale
product_DiscountPrice <- read_html("https://www2.hm.com/en_ie/sale/ladies/viewall.html?sort=stock&image-size=small&image=stillLife&offset=0&page-size=4015")
product_category <- product_DiscountPrice %>%html_nodes(".item-heading .link")%>%html_text()
product_Discount <- product_DiscountPrice %>%html_nodes(".sale")%>%html_text("")
Product_RegularPrice <- product_DiscountPrice %>%html_nodes(".regular")%>%html_text("")
product_colour <- product_DiscountPrice %>%html_nodes(".list-swatches")%>%html_text("")
Product_category 
Product_Discount
Product_RegularPrice
Product_colour
sales_product <- data.frame(product_category,Product_RegularPrice,product_Discount,product_colour)
sales_product

#trend
product_colour <- product_table %>%html_nodes(".list-swatches")%>%html_text()
product_colour
trend_top
product_trend <- merge(data.frame(product_colour, row.names=NULL), data.frame(trend_top, row.names=NULL), by = 0, all = TRUE)[-1]
product_trend

#productSize
product_category <- product_table %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize2 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=7_2_1_womenswear&image-size=small&image=model&offset=0&page-size=282")
product_size2 <- product_tableSize2 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize4 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=11_4_1_womenswear&image-size=small&image=model&offset=0&page-size=282")
product_size4 <- product_tableSize4 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize6 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=15_6_1_womenswear&image-size=small&image=model&offset=0&page-size=3983")
product_size6 <- product_tableSize6 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize8 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=19_8_1_womenswear&image-size=small&image=model&offset=0&page-size=4116")
product_size8 <- product_tableSize8 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize9 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=19_8_1_womenswear&image-size=small&image=model&offset=0&page-size=4128")
product_size9 <- product_tableSize9 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize10 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=23_10_1_womenswear&image-size=small&image=model&offset=0&page-size=4016")
product_size10 <- product_tableSize10 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize12 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=27_12_1_womenswear&image-size=small&image=model&offset=0&page-size=3790")
product_size12 <- product_tableSize12 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize14 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=30_14_1_womenswear&image-size=small&image=model&offset=0&page-size=3509")
product_size14 <- product_tableSize14 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize16 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=33_16_1_womenswear&image-size=small&image=model&offset=0&page-size=3421")
product_size16 <- product_tableSize16 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize18 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=35_18_1_womenswear&image-size=small&image=model&offset=0&page-size=3464")
product_size18 <- product_tableSize18 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize20 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=37_20_1_womenswear&image-size=small&image=model&offset=0&page-size=3440")
product_size20 <- product_tableSize20 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize22 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=39_22_1_womenswear&image-size=small&image=model&offset=0&page-size=2506")
product_size22 <- product_tableSize22 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize24 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=41_24_1_womenswear&image-size=small&image=model&offset=0&page-size=2556")
product_size24 <- product_tableSize24 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize26 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=43_26_1_womenswear&image-size=small&image=model&offset=0&page-size=287")
product_size26 <- product_tableSize26 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize28 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=45_28_1_womenswear&image-size=small&image=model&offset=0&page-size=288")
product_size28 <- product_tableSize28 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize30 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=47_30_1_womenswear&image-size=small&image=model&offset=0&page-size=196")
product_size30 <- product_tableSize30 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize32 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=49_32_1_womenswear&image-size=small&image=model&offset=0&page-size=125")
product_size32 <- product_tableSize32 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize34 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=51_34_1_womenswear&image-size=small&image=model&offset=0&page-size=77")
product_size34 <- product_tableSize34 %>%html_nodes(".item-heading .link")%>%html_text()
product_tableSize36 <- read_html("https://www2.hm.com/en_ie/ladies/shop-by-product/view-all.html?sort=stock&sizes=53_36_1_womenswear&image-size=small&image=model&offset=0&page-size=77")
product_size36 <- product_tableSize36 %>%html_nodes(".item-heading .link")%>%html_text()
product_category
product_size2
product_size4
product_size6
product_size8
product_size10
product_size12
product_size14
product_size16
product_size18
product_size20
product_size22
product_size24
product_size26
product_size28
product_size30
product_size32
product_size34
size1 <- merge(data.frame(product_category, row.names=NULL), data.frame(product_size2, row.names=NULL), by = 0, all = TRUE)[-1]
size2 <- merge(data.frame(size1, row.names=NULL), data.frame(product_size4, row.names=NULL), by = 0, all = TRUE)[-1]
size3 <- merge(data.frame(size2, row.names=NULL), data.frame(product_size6, row.names=NULL), by = 0, all = TRUE)[-1]
size4 <- merge(data.frame(size3, row.names=NULL), data.frame(product_size8, row.names=NULL), by = 0, all = TRUE)[-1]
size5 <- merge(data.frame(size4, row.names=NULL), data.frame(product_size10, row.names=NULL), by = 0, all = TRUE)[-1]
size6 <- merge(data.frame(size5, row.names=NULL), data.frame(product_size12, row.names=NULL), by = 0, all = TRUE)[-1]
size7 <- merge(data.frame(size6, row.names=NULL), data.frame(product_size14, row.names=NULL), by = 0, all = TRUE)[-1]
size8 <- merge(data.frame(size7, row.names=NULL), data.frame(product_size16, row.names=NULL), by = 0, all = TRUE)[-1]
size9 <- merge(data.frame(size8, row.names=NULL), data.frame(product_size18, row.names=NULL), by = 0, all = TRUE)[-1]
size10 <- merge(data.frame(size9, row.names=NULL), data.frame(product_size20, row.names=NULL), by = 0, all = TRUE)[-1]
size11 <- merge(data.frame(size10, row.names=NULL), data.frame(product_size22, row.names=NULL), by = 0, all = TRUE)[-1]
size12 <- merge(data.frame(size11, row.names=NULL), data.frame(product_size24, row.names=NULL), by = 0, all = TRUE)[-1]
size13 <- merge(data.frame(size12, row.names=NULL), data.frame(product_size26, row.names=NULL), by = 0, all = TRUE)[-1]
size14 <- merge(data.frame(size13, row.names=NULL), data.frame(product_size28, row.names=NULL), by = 0, all = TRUE)[-1]
size15 <- merge(data.frame(size14, row.names=NULL), data.frame(product_size30, row.names=NULL), by = 0, all = TRUE)[-1]
size16 <- merge(data.frame(size15, row.names=NULL), data.frame(product_size32, row.names=NULL), by = 0, all = TRUE)[-1]
size17 <- merge(data.frame(size16, row.names=NULL), data.frame(product_size34, row.names=NULL), by = 0, all = TRUE)[-1]
product_size <- merge(data.frame(size17, row.names=NULL), data.frame(product_size36, row.names=NULL), by = 0, all = TRUE)[-1]


product_size <- data.frame(product_category,product_size2,product_size4,product_size6,product_size8,product_size10,
                            product_size12,product_size14,product_size16,product_size18,product_size20,product_size22,product_size24,product_size26,product_size28,
                            product_size30,product_size32,product_size34)
product_size


write.table(MyData, file = "MyData.csv",row.names=product_category,product_price,product_colour, na="",col.names=FALSE, sep=",")