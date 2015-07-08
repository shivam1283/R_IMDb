library(rvest)
n<-commandArgs(TRUE)#arguments passed from terminal

url_p1<-"http://www.imdb.com/search/keyword?keywords="
url_p2<-"&sort=moviemeter,asc&mode=detail&ref_=kw_ref_key&page="

#URL Generator
if (length(n) > 1)
for(i in 1:(length(n)-1))
{
  url_p1<-(paste(url_p1,as.character(n[i]),"%2C",sep=""))
}
url_p1 <- paste(url_p1,as.character(n[length(n)]),url_p2,sep="")

#extracts page 1 and 2
for (i in 1:2){

  url_char<-(paste(url_p1,as.character(i),sep=""))#Page number generator
  
  url<-html(url_char)
  
  movie_names <- url %>%  html_nodes("h3 a") %>%  html_text()
  ratings <- url %>%  html_nodes("div strong") %>%  html_text()

  print(paste("PAGE",as.character(i)))
  overall<-data.frame(movie_names[1:50],ratings[13:62])
  print(ratings)

}